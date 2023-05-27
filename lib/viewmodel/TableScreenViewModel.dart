import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:core';
import 'dart:core';

//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';


import '../Constants.dart';
import '../datamodel/FacesDetail.dart';
import '../datamodel/FarGloryMsg.dart';
import '../datamodel/Profile.dart';
import '../datamodel/ServerFaceType.dart';
import '../datamodel/WebSocketFace.dart';
import '../util/Utils.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

//final List<String> headerInfo = ['GPT-4掀起AI界高潮，ChatGPT之父卻怕了：我設了一個終止開關    敬禮！張育成獲經典賽最佳一壘手    BLACKPINK七月再來台？「主辦方員工」洩消息',
//  '            26°  大致晴朗'];
final String headerNews = '進行高空作業前，一定要確認安全掛勾是否扣上     進入狹窄的空間前，進入狹窄的空間前，    進入工地戴安全帽（安全帽區域）     確實配戴背負式安全帶（磨損的安全線束）';
final String headerWeather = '26°\n大致晴朗';
final List<String> leftRow1Title = ['進場人次','出場人次','現場人數'];
final List<String> clearupTitle = ['進場人次','出場人次','滯留人數'];
//List<String> leftRow1Count = ["99","0","99"];
int leaveCount = 0;
int enterCount = 0;
List<int> enterName = [];
List<int> leaveName = [];
const String EASY_READ_ENTER = '進場';
const String EASY_READ_LEAVE = '出場';

String mClearTime = "";
String mResetTime = "";

//final List<String> workTypeTitle = ['點工', '板模', '水泥', '排水', '電氣', '吊臂', '砂石'];
List<int> workTypeCount = [0, 0, 0, 0, 0, 0, 0];
const Utf8Codec utf8 = Utf8Codec();
final List<String> environTitle = ['空氣品質指標', '空氣污染指標物', '狀態', "一氧化碳", "PM10", "PM2.5", "風速"];
List<String> environCount = ["", "", "", "", "", "", ""];
List<String> environColor = ["green", "green", "green", "green", "green", "green", "green"];
final String DEFAULT_VENDOR_NAME = '承包商';
final String VENDOR_NAME_OTHER = '其他';
List<Vendor> vendorList = [];


//List<String> workerNames = ['姜才藝','黃文柏','蘇銳思','沈立誠','徐涵暢','萬泰清','孫鵬翼','史俊雄','湯嘉石','秦承運','李文成','夏陽舒','袁經義','盧樂湛','謝俊材','段雨星','崔俊哲',];
List<bool> DEFAULT_BOOLLIST = [true, true, true, true]; //酒測 工地帽 背心 效期內,非黑名單
List<bool> boolListDrink = [false, true, true, true];
List<bool> boolListBlack = [true, true, true, false];


List<Profile> profilesRemain = [
  //Profile(name: '黃 * 林', profession: rightRowTitle[3], imageUrl: workerImages[2], action: leaveStr, boolList: boolList, faceId: '0' ),
];
List<Profile> profilesPool = [
  //Profile(name: '陳 * 榮', profession: rightRowTitle[0], imageUrl: workerImages[0], action: leaveStr, boolList: boolList, faceId: '0'),
];
List<Profile> profiles = [
];
final int LIMIT_LIST_PROFILE = 6;

enum DisplayMode {
  punch,
  clearup,
}
DisplayMode currentMode = DisplayMode.punch ; //差勤或清場
late StompClient stomp;
final dio = Dio();
List<FaceType> faceTypes = [];


class TableScreenViewModel {


  TableScreenViewModel(BuildContext ctx)  {
    var webSocketUrl = "ws://$HOST:$WS_PORT$WS_TOPIC";
    //print('art WebSocket url=$webSocketUrl');

    stomp = StompClient(
        config: StompConfig(
          url: webSocketUrl,
          onConnect: onConnectCallback1,
          onWebSocketError: (e) => //showMsg(ctx, e.toString())
          print('art onWebSocketError e=$e'),
          onStompError: (d) => print('art error stomp'),
          onDisconnect: (f) => print('art disconnected'),
          //onDebugMessage: (f) => print('art debug $f'),
        )
    );
    stomp.activate();

  }


  
  deactivate() {
    stomp.deactivate();
  }

  void addSubscribe(String deviceID) {
    stomp.subscribe(destination: "/topic/capture/$deviceID", headers: {}, callback: (frame) {

      WebSocketFace face=  webSocketFaceFromJson(frame.body.toString());
      //print("art face " + face.name! + ", " + face.type_id! + "");
      if(face.enabled!=null && face.enabled!) {
        if( isDuplicate(face) ) {
          print("art face 去重 ${face.name!} , id=${face.face_id}");
          return;
        }
        // if(isExistRemain(face.face_id!)) {
        //   print("art 還未離場又進場的人不用加pool");
        //   return;
        // }
        webSocketToPool(face, "enter");
      }

    });
  }

  // bool isDuplicate(WebSocketFace face) {
  //   //print("art isDuplicate currentMode=${currentMode.name}");
  //   return profilesPool.length>0 && isSameFace(profilesPool.last, face) && (currentMode == DisplayMode.punch);
  // }

  //與Remain比對，如果存在一樣faceid且15秒內 則不給離場或新增
  bool isDuplicate(WebSocketFace face) {
    //print("art isDuplicate currentMode=${currentMode.name}");
    if(currentMode != DisplayMode.punch) {
      return false;
    }
    if(face.end_time==0) {
      print('art isDuplicate face.end_time==0');
      return false;
    }
    for(int i=0; i<profilesRemain.length; i++) {
      if(profilesRemain[i].faceId == face.face_id) {
        var diff = face.end_time! - profilesRemain[i].end_time;
        print('art isDuplicate ' + face.name! + " time diff=" + diff.toString() +" , 更新 profilesRemain[i].end_time");
        profilesRemain[i].end_time = face.end_time!;
        if (diff< 25000) {
          //but need update end_time
          print('art isDuplicate 15秒內 不給離場或新增');
          return true;
        }
      }
    }
    return false;
  }


  void addLeaveSubscribe(String deviceID) {
    stomp.subscribe(destination: "/topic/capture/$deviceID", headers: {}, callback: (frame) {

      WebSocketFace face=  webSocketFaceFromJson(frame.body.toString());
      //print("art face " + face.name! + ", " + face.type_id! + "");
      if(face.enabled!=null && face.enabled!) {
        if( isDuplicate(face) ) {
          print("art face leave去重");
          return;
        }
        webSocketToPool(face, "leave");
      }

    });
  }


  Future<void> onConnectCallback1(StompFrame connectFrame) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String setting = prefs.getString(PREF_KEY_IN_DEVICEIDS)??"";
    List<String> ids = setting.split(",");
    ids.forEach((element) {addSubscribe(element);});
    if(HOST == '192.168.0.109') {
      addSubscribe('30'); //for test in 109
      addLeaveSubscribe('31');
    }


    setting = prefs.getString(PREF_KEY_OUT_DEVICEIDS)??"";
    ids = setting.split(",");
    ids.forEach((element) {addLeaveSubscribe(element);});

  }

  webSocketToPool(WebSocketFace face, String action) {
    // Profile p = genProfile2(face, action);
    // p.boolList = null;
    // addToPool(p, action);
    //print('art add from socket :' + (face.name ?? "") + ", " + face.type_id.toString());
    genProfile2(face, action).then((value) => {
      addToPool(value, action)
    });

  }

  bool isSameFace(Profile profile, WebSocketFace face) {
    return profile.faceId == face.face_id && profilesPool.last.action == EASY_READ_ENTER;
  }

  cb(FarGloryMsg msg) {
    Profile p = genProfile(msg);
    p.boolList = null;

    addToPool(p, msg.action!);
  }

  void addToPool(Profile p, String action) {
    if(currentMode == DisplayMode.clearup) {
      leaveCount = leaveCount+1;
      if(profilesRemain.length>0)
        profilesRemain.removeLast();
    } else {
      switch(action) {
        case "helmet":
        // Update the age of each person in the list
        //   for (int i = profilesPool.length-1; i >=0 ; i--) {
        //     if(profilesPool[i].faceId == p.faceId && msg.company!=null) {
        //       profilesPool[i].boolList= [true, msg.company!.parseBool(), msg.worktype!.parseBool(), true];
        //       break;
        //     }
        //   }
          break;
        case "enter":
          askFaceDetail(p.faceId, action, p);
          profilesPool.add(p);
          // if(isExistRemain(p.faceId)) {
          //   print("art 還未離場又進場的人不用加 remain");
          //   break;
          // }
          // profilesRemain.add(p);
          //playMP3('blacklist.mp3'); //for test
          break;

        case "leave":
          askFaceDetail(p.faceId, action, p);
          p.action = EASY_READ_LEAVE;
          profilesPool.add(p);

          //playMP3('blacklist.mp3'); //for test

          //if(isExistRemain(p.faceId)) {
          var ll = profilesRemain.where((element) => element.faceId==p.faceId);
          print('art check remove p.faceId=' + p.faceId.toString() + " name=" + p.name + " ll size=" + ll.length.toString());
            if(ll.length>0) {
              leaveCount = leaveCount+1;
              if(!leaveName.contains(p.faceId)) {
                leaveName.add(p.faceId);
              }
              Profile find = ll.first;
              var isSuiccess = profilesRemain.remove(find);
              print('art remove is success=$isSuiccess');
            }
          //}
          break;

        default:
          break;
      }
    }

    //var filtered1 = profilesPool.where((e) => e.action == leaveStr).toList();
    //leaveCount = filtered1.length;
  }

  static String base64Decode(String data){
    List<int> bytes = convert.base64Decode(data);
    // 網上找的很多都是String.fromCharCodes，這個中文會亂碼
    //String txt1 = String.fromCharCodes(bytes);
    String result = convert.utf8.decode(bytes);
    return result;
  }

  Profile genProfile(FarGloryMsg msg) {
    String actionStr = EASY_READ_ENTER;
    if(msg.action=="leave") {
      actionStr = EASY_READ_LEAVE;
    }
    String myName;
    if(msg.name==null || msg.name!.isEmpty) {
      //myName = randomListItem(workerNames);
      myName = "台灣第一勇";
    } else {
      myName = utf8.decode(msg.name!.codeUnits);
    }
    String name = myName.replaceRange(1, 2, ' * ');
    //String vendor = "${randomListItem(vendorTitle2)}-${randomListItem(workTypeTitle)}";
    String vendor = VENDOR_NAME_OTHER;
    List<bool> boolList = [true, false, false, true]; //酒測 工地帽 背心 效期內,非黑名單
    return Profile(name: name, profession: vendor, imageUrl:msg.imgUrl!, action: actionStr,  boolList: boolList, faceId: int.parse(msg.id!), end_time: 0, typeId:-1 );
  }

  Future<Profile> genProfile2(WebSocketFace msg, String action) async {
    List<bool> boolList = [true, false, false, true]; //酒測 工地帽 背心 效期內,非黑名單

    //轉成好讀
    String actionStr = EASY_READ_ENTER;
    if(action=="leave") {
      actionStr = EASY_READ_LEAVE;
    }

    String myName;
    if(msg.name==null || msg.name!.isEmpty) {
      myName = "台灣第一勇";
    } else {
      //myName = utf8.decode(msg.name!.codeUnits);
      myName = msg.name!;
    }
    String name = myName.replaceRange(1, 2, ' * ');
    //String vendor = "${randomListItem(vendorTitle2)}-${randomListItem(workTypeTitle)}";
    String vendor = getFacelibName(int.parse(msg.type_id!) );
    int faceId = msg.face_id ?? 0;
    String imagePath = getFullImageUrl(msg.photo!);
    //imagePath = msg.photo_string!;
    //print("art profile path=$imagePath");

    //2023-5-22 老闆指示工地帽先不判斷, 但要用抓拍照
    // TODO check helmet, vest by api -- start

    boolList[1] = false;
    boolList[2] = false;
    try {
      final imageUrl = imagePath;
      var HOST = "60.250.33.237:60105";
      Future<String?> networkImageToBase64(String imageUrls) async {
        http.Response response = await http.get(Uri.parse(imageUrls));
        if (response.statusCode == 200) {
          final bytes = response?.bodyBytes;
          if (bytes != null) {
            String encodedString = base64Encode(bytes);
            return encodedString;
          } else {
            return null;
          }
        } else {
          print('art call $imageUrl fail! code: $response.statusCode');
          return null;
        }
      }

      // Future<String?> checkHelmet(String imgBase64Str) async {
      //   final String checkUrl = "http://" + HOST + "/image_in";
      //   var map = new Map<String, dynamic>();
      //   map['img'] = imgBase64Str;
      //   var response = await http.post(Uri.parse(checkUrl), body: map);
      //   if (response.statusCode == 200) {
      //     return response.body;
      //   } else {
      //     print('art call $checkUrl fail! code: $response.statusCode');
      //     return null;
      //   }
      // }

      //snapshot_uri
      //final imgBase64Str = await networkImageToBase64(imageUrl.toString());
      String snapshotUrl = (msg.snapshot_uri ?? "");
      //print('art snapshot=' + snapshotUrl );
      //var imgBase64Str =msg.photo_string;
      if(snapshotUrl!.isNotEmpty) {
        if(snapshotUrl.startsWith("app/static")|| snapshotUrl.startsWith("/static")) {
          //var path = snapshotUrl.replaceFirst("app/static", "/static");
          //var url = "http://$WS_SERVER$path";
          var url = getFullImageUrl(snapshotUrl);
          //print('art img1 url=$url');
          //imgBase64Str = await networkImageToBase64(url);
          imagePath = url;
        } else {
          //imgBase64Str = msg.snapshot_uri; // is already image string
          imagePath = snapshotUrl;
          print('art img2 url=$imagePath');
        }

      }
    //   print('art img3');
    //   if (imgBase64Str != null) {
    //     /*
    //     art post fetch and set catch error
    //     StackTrace #0      IOClient.send (package:http/src/io_client.dart:94:7)
    //      <asynchronous suspension>
    //     #3      TableScreenViewModel.genProfile2 (package:far_glory_construction_dashboard/viewmodel/TableScreenViewModel.dart:412:24)
    //   <asynchronous suspension>
    //      */
    //       final String checkUrl = "http://" + HOST + "/image_in";
    //       var map = new Map<String, dynamic>();
    //       map['img'] = imgBase64Str;
    //       var response = await http.post(Uri.parse(checkUrl), body: map);
    //       print("art image_in=$response");
    //       Map data = jsonDecode(response.toString());
    //       if (data["code"] == 200) {
    //         // print(boolList);
    //         boolList[1] = data["helmet"];
    //         boolList[2] = data["vest"];
    //       } else {
    //         print('art call $checkUrl fail! code: $response.statusCode');
    //       }
    //     //}
    //     // var body = await checkHelmet(imgBase64Str);
    //     // if (body != null) {
    //     //   Map data = jsonDecode(body);
    //     //   print("art image_in=$data");
    //     //   boolList[1] = data["helmet"];
    //     //   boolList[2] = data["vest"];
    //     // }
    //   }
    //
    } catch (e, s) {
      print('art post fetch and set catch error');
      print("Exception $e");
      print("StackTrace $s");
    }

    // TODO check helmet, vest by api -- end
    return Profile(name: name, profession: vendor, imageUrl:imagePath, action: actionStr,  boolList: boolList, faceId: faceId, end_time: msg.end_time!, typeId: int.parse(msg.type_id??"-1") );
  }

}

String getFacelibName(int typeid) {
  print('art 0526 getFacelibName id='+ typeid.toString() + ", faceTypes len=" + faceTypes.length.toString());
  for(int i=0; i<faceTypes.length; i++) {
    if(faceTypes[i].id == typeid) {
      print('art 0526 bingo! id='+ typeid.toString() +' name=' + faceTypes[i].name!);
      return faceTypes[i].name! ;
    }
  }
  return "";
}

// void askFaceDetail(int id, String action, Profile profile) async {
//   final response = await dio.get("http://$HOST/api/faces/$id");
//   //print(profile.typeId.toString() + "," + profile.faceId.toString() + ", " + profile.name!);
//
//   FacesDetail apiFaces = facesDetailFromJson(response.toString());
//   var face = apiFaces.result;
//   if(face!=null) {
//     updateProfile(face);
//     if(action=="enter")
//       updateVendorCount(face, profile);
//   }
// }

void askFaceDetail(int id, String action, Profile profile) async {
   //String facelibName = getFacelibName(profile.typeId);
  // print("art update facelibName =$facelibName" );
  // if(facelibName.isNotEmpty) {
  //   updateProfileNew(profile.faceId, facelibName);
  //   if(action=="enter")
  //     updateVendorList(facelibName, profile);
  // }

  if(action=="enter")
    updateVendorList(profile.profession, profile);

}

void updateProfileNew(int autoid, String facelibName) {
  // String company = face.company?? "" ;
  // String title = face.title ?? "";
  // int autoid = face.autoid ?? 0;

  //
  //print("art update company autoid=$autoid" + ", " + company + "," + title);

  for(int i=0; i<profilesPool.length; i++) {
    print('art faceId=' + profilesPool[i].faceId.toString());
  }


  var ll = profilesPool.where((element) => (element.faceId==autoid));
  print("art update "+ autoid.toString() +" find ="+ll.toList().toString() );
  if(ll.isNotEmpty) {
    print("art update "+ autoid.toString() +" find ="+ll.last.toString() );
    ll.last.profession = facelibName;
  }

}

// void updateProfile(Result face) {
//   String company = face.company?? "" ;
//   String title = face.title ?? "";
//   int autoid = face.autoid ?? 0;
//
//   //getFacelibName(profile.typeId);
//   print("art update company autoid=$autoid" + ", " + company + "," + title);
//
//
//   var ll = profilesPool.where((element) => (element.faceId==autoid));
//   if(ll.isNotEmpty) {
//     ll.last.typeId = face.typeId ?? -1;
//     if(title.isNotEmpty) {
//       ll.last.profession = "$company-$title";
//     } else {
//       ll.last.profession = company;
//     }
//   }
//
// }

// bool checkFaceId(int str, int autoid) {
//   print("art update company element.faceId=$str");
//   return int.parse( str ) == autoid;
// }

//還未離場又進場的人不用加1
bool isExistRemain(int autoid) {
  var ll = profilesRemain.where((element) => (element.faceId==autoid));
  print("art isExistRemain =${ll.length}");
  return ll.length>0;
}

Future<void> saveEnterLeave() async {
  //print('art debug vendorList=' + vendorList.toList().toString());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(PREF_KEY_ENTER_COUNT, enterCount);
  prefs.setInt(PREF_KEY_LEAVE_COUNT, leaveCount);
  prefs.setString(PREF_KEY_PROFILE_REMAIN, jsonEncode(profilesRemain));
  prefs.setString(PREF_KEY_VENDOR , jsonEncode(vendorList));
  prefs.setString(PREF_KEY_ENTER_UNIQUE_NAME , jsonEncode(enterName.toList()));
  prefs.setString(PREF_KEY_LEAVE_UNIQUE_NAME , jsonEncode(leaveName.toList()));
  //print('art jsonEncode=' + jsonEncode(profilesRemain));
}

List<String> addUnique(List<String> list)  {
  var seen = Set<String>();
  return list.where((ele) => seen.add(ele)).toList();
}


/*
各別供應商人"數"：
  4.清單異動時，要修改顯示順序，數字大的在前面
    4-1.當供應商小於等於8時,最大顯示八個(排序先人數降冪，在faceTypeId升冪)
    4-2.當供應商大於8時,顯示前七大(排序先人數降冪，在faceTypeId升冪)，超過7者
      ，全部加在一起顯示其他
 */
void updateVendorList(String company, Profile profile) {
  int autoid = profile.faceId;
  int typeId = profile.typeId;
  if(isExistRemain(autoid!)) {
    print("art 還未離場又進場的人不用加1");
    //playMP3('blacklist.mp3');
    return;
  }
  enterCount++;
  if(!enterName.contains(autoid)) {
    enterName.add(autoid);
  }

  profilesRemain.add(profile);
  saveEnterLeave();

  print('art 0526 find vendor typeid:' + typeId.toString() + ", company="+ company! );
  var find = vendorList.where((f) => f.faceTypeId==typeId).toList();
  if(find.isEmpty) {
    //print('art 0523 find vendor  add new');
    List<int> workerNames = [];
    workerNames.add(autoid);
    Vendor v = Vendor(faceTypeId: typeId, name: company, worker: workerNames);
    vendorList.add(v);
  } else {
    Vendor v = find.first;
    if(!v.worker.contains(autoid) ) {
      v.worker.add(autoid);
    }
    vendorList[vendorList.indexWhere((element) => element.faceTypeId == typeId)] = v;
  }
  vendorList.sort((a, b) => b.worker.length.compareTo(a.worker.length));
  //print('art 0526 find vendor  sorted ${jsonEncode(vendorList)}' );

}

void playMP3(String filename) {
  // assetsAudioPlayer.open(
  //   Audio("audios/$filename"),
  // );

  FlutterRingtonePlayer.play(fromAsset: "audios/$filename");
  //FlutterRingtonePlayer.playNotification();
}

extension BoolParsing on String {
  bool parseBool() {
    //print("art 0419 check=${toLowerCase()}");
    return toLowerCase() == 'true';
  }
}