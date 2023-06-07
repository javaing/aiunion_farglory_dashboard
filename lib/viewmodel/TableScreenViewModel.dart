import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';


import '../Constants.dart';
import '../datamodel/FarGloryMsg.dart';
import '../datamodel/Profile.dart';
import '../datamodel/ServerFaceType.dart';
import '../datamodel/WebSocketFace.dart';
import '../util/DBHelper.dart';
import '../util/DataDebug.dart';
import '../util/Utils.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


final String headerNews = '進行高空作業前，一定要確認安全掛勾是否扣上     進入狹窄的空間前，進入狹窄的空間前，    進入工地戴安全帽（安全帽區域）     確實配戴背負式安全帶（磨損的安全線束）';
final String headerWeather = '26°\n大致晴朗';
final List<String> leftRow1Title = ['進場人次','出場人次','現場人數'];
final List<String> clearupTitle = ['進場人次','出場人次','滯留人數'];
const String EASY_READ_ENTER = '進場';
const String EASY_READ_LEAVE = '出場';
final String NAME = "姓名";
final String UNIT = "單位";
final String ENVIROMENT = "環境資訊";
final String UPDATE = "更新";
final List<String> environTitle = ['空氣品質指標', '空氣污染指標物', '狀態', "一氧化碳", "PM10", "PM2.5", "風速"];
final String DEFAULT_VENDOR_NAME = '承包商';
final String VENDOR_NAME_OTHER = '其他';

int leaveCount = 0;
int enterCount = 0;
List<int> enterFaceId = [];
List<int> leaveFaceId = [];
bool aiHealthy = false;
bool socketHealthy = false;


String mClearTime = "";
String mResetTime = "";
String AIHost = "";
String mDeduplicate = "15";

List<int> workTypeCount = [0, 0, 0, 0, 0, 0, 0];
const Utf8Codec utf8 = Utf8Codec();
List<String> environCount = ["", "", "", "", "", "", ""];
List<String> environColor = ["green", "green", "green", "green", "green", "green", "green"];
List<Vendor> vendorList = [];


//List<String> workerNames = ['姜才藝','黃文柏','蘇銳思','沈立誠','徐涵暢','萬泰清','孫鵬翼','史俊雄','湯嘉石','秦承運','李文成','夏陽舒','袁經義','盧樂湛','謝俊材','段雨星','崔俊哲',];
List<bool> DEFAULT_BOOLLIST = [true, true, true, true]; //酒測 工地帽 背心 效期內,非黑名單
List<bool> boolListDrink = [false, true, true, true];
List<bool> boolListBlack = [true, true, true, false];
final String CLEAR_ALL = "Clear All Data";

// final List<String> leftRow1Title = ['Enter Count','Exit Count','Present People'];
// final List<String> clearupTitle = ['進場人次','出場人次','滯留人數'];
// const String EASY_READ_ENTER = 'Enter';
// const String EASY_READ_LEAVE = 'Exit';
// final List<String> environTitle = ['Quality Index', 'Pollution object', 'State', "CO", "PM10", "PM2.5", "Windy"];
// final String DEFAULT_VENDOR_NAME = 'Vendor';
// final String VENDOR_NAME_OTHER = 'Other';
// final String NAME = "name";
// final String UNIT = "unit";
// final String ENVIROMENT = "Enviroment";
// final String headerNews = 'Before performing high-altitude operations, be sure to confirm whether the safety hook is buckled. Before entering a narrow space, before entering a narrow space, wear a safety helmet (hard hat area) on the construction site, and wear a backpack safety belt (worn security harness)';
// final String UPDATE = "updated";

//Log
//deviceId	in_out	faceId	FaceTypeId	time	OK	IN_TOTAL	IN_DEDUPLICATE	OUT_TOTAL	OUT_DEDUPLICATE + 5  大屏五項資料
List<String> dailyLOG = [];
DBHelper deHelper = DBHelper();


List<Profile> profilesRemain = [
  //Profile(name: '黃 * 林', profession: rightRowTitle[3], imageUrl: workerImages[2], action: leaveStr, boolList: boolList, faceId: '0' ),
];
List<Profile> profilesPool = [
  //Profile(name: '陳 * 榮', profession: rightRowTitle[0], imageUrl: workerImages[0], action: leaveStr, boolList: boolList, faceId: '0'),
];
List<Profile> profiles = [
];
const int LIMIT_LIST_PROFILE = 6;

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
          onWebSocketError: (e) => socketHealthy=false,
          //print('art onWebSocketError e=$e'),
          onStompError: (d) => print('art error stomp'),
          onDisconnect: (f) => print('art disconnected'),
          //onDebugMessage: (f) => print('art debug $f'),
        )
    );
    stomp.activate();


    //TODO: arttseng
    //debugCaptures();
  }


  Future<void> debugCaptures() async {
    // 6/5 String captureUrl = "http://60.250.33.237/api/captures?capturedAtBegin=1685894439000&capturedAtEnd=1685978139000&deviceIds=5,3&isWhitelist=true&pageSize=1000";
    // 6/4 String captureUrl = "http://60.250.33.237/api/captures?capturedAtBegin=1685808017000&capturedAtEnd=1685894357000&deviceIds=5,3&isWhitelist=true&pageSize=1000";
    // 6/3 same
    String captureUrl = "http://60.250.33.237/api/captures?capturedAtBegin=1685721617000&capturedAtEnd=1685807957000&deviceIds=5,3&isWhitelist=true&pageSize=1000";

    var response = await http.get(Uri.parse(captureUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      List result = map['result'];
      var reversedList = List.from(result.reversed);
      for(int i=0; i<reversedList.length; i++) {
        var each = reversedList[i];

        WebSocketFace face = WebSocketFace(
          name: each['person'],
          photo: each['photo'],
          type_id: each['faceTypeId'].toString(),
          identity: each['identity'],
          serialNo: each['serialNo'],
          cardSerialNo: each['cardSerialNo'],
          device_id: each['deviceId'].toString(),
          face_id: each['faceId'],
          start_time: each['capturedAt'],
          end_time: each['createdAt'],
          enabled: true,
          snapshot_uri: each['filePath'],
        );
        String deviceID = face.device_id!;
        print('art debugCaptures [$i] ' + face.name! + ", start_time=" + face.start_time!.toString());
        if(deviceID=="5") {
          await processIn(deviceID, face);
        } else {
          await processOUT(deviceID, face);
        }

        sleep(const Duration(milliseconds: 600));
      }

    } else {
      print('art get fail ');
    }
  }



  
  deactivate() {
    stomp.deactivate();
  }


  void addSubscribe(String deviceID) {
    stomp.subscribe(destination: "/topic/capture/$deviceID", headers: {}, callback: (frame) {

      socketHealthy = true;
      WebSocketFace face=  webSocketFaceFromJson(frame.body.toString());
      processIn(deviceID, face);

    });
  }

  Future<void> processIn(String deviceID, WebSocketFace face) async {
    //writeFileAppend(face.toString2()+DBHelper.EnterChar, 'socket_${getYYYYMMDD()}.txt');
    if(face.enabled!=null && face.enabled!) {
      // if( isDuplicate(face) ) {
      //   print("art face 去重 ${face.name!} , id=${face.face_id}");
      //   return;
      // }
      //writeFile(face.toString2(), 'farglory_in_de_${getYYYYMMDD()}.txt');

      await inLog(deviceID, face);
      webSocketToPool(face, "enter");
    }
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
    int deduplicate = int.parse(mDeduplicate) * 1000;
    for(int i=0; i<profilesRemain.length; i++) {
      if(profilesRemain[i].faceId == face.face_id) {
        var diff = face.end_time! - profilesRemain[i].end_time;
        print('art isDuplicate ' + face.name! + " time diff=" + diff.toString() +" , 更新 profilesRemain[i].end_time");
        profilesRemain[i].end_time = face.end_time!;
        if (diff< deduplicate) {
          //but need update end_time
          print("art isDuplicate $mDeduplicate秒內 不給離場或新增");
          return true;
        }
      }
    }
    return false;
  }


  void addLeaveSubscribe(String deviceID) {
    stomp.subscribe(destination: "/topic/capture/$deviceID", headers: {}, callback: (frame) {

      socketHealthy = true;
      WebSocketFace face=  webSocketFaceFromJson(frame.body.toString());
      processOUT(deviceID, face);

    });
  }

  Future<void> processOUT(String deviceID, WebSocketFace face) async {
    //writeFileAppend(face.toString2()+DBHelper.EnterChar, 'socket_${getYYYYMMDD()}.txt');
    if(face.enabled!=null && face.enabled!) {
      // if( isDuplicate(face) ) {
      //   print("art websocket leave去重");
      //   return;
      // }
      await outLog(deviceID, face);
      webSocketToPool(face, "leave");
    }
  }


  Future<void> onConnectCallback1(StompFrame connectFrame) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String setting = prefs.getString(PREF_KEY_IN_DEVICEIDS)?? DEFAULT_IN_DEVICEIDS ;
    List<String> ids = setting.split(",");
    ids.forEach((element) {addSubscribe(element);});
    // if(HOST == '192.168.0.109') {
    //   addSubscribe('30'); //for test in 109
    //   addLeaveSubscribe('31');
    // }


    setting = prefs.getString(PREF_KEY_OUT_DEVICEIDS)?? DEFAULT_OUT_DEVICEIDS;
    ids = setting.split(",");
    ids.forEach((element) {addLeaveSubscribe(element);});

  }

  webSocketToPool(WebSocketFace face, String action) {
    genProfile2(face, action).then((value) => {
      addToPool(value, action)
    });

  }

  bool isSameFace(Profile profile, WebSocketFace face) {
    return profile.faceId == face.face_id && profilesPool.last.action == EASY_READ_ENTER;
  }


  void addToPool(Profile p, String action) {
    print('art addToPool is success=${p.name}');
    if(currentMode == DisplayMode.clearup) {
      leaveCount = leaveCount+1;
      if(profilesRemain.isNotEmpty) {
        profilesRemain.removeLast();
        saveEnterLeave();
      }
    } else {
      switch(action) {
        case "enter":
          askFaceDetail(p.faceId, action, p);
          profilesPool.add(p);
          break;

        case "leave":
          askFaceDetail(p.faceId, action, p);
          p.action = EASY_READ_LEAVE;
          profilesPool.add(p);

          //playMP3('blacklist.mp3'); //for test

          var ll = profilesRemain.where((element) => element.faceId==p.faceId);
          print('art check remove p.faceId=' + p.faceId.toString() + " name=" + p.name + " ll size=" + ll.length.toString());
          if(ll.length>0) {
            leaveCount = leaveCount+1;
            if(!leaveFaceId.contains(p.faceId)) {
              leaveFaceId.add(p.faceId);
            }
            Profile find = ll.first;
            var isSuiccess = profilesRemain.remove(find);
            print('art remove is success=$isSuiccess');
            saveEnterLeave(); //arttseng
          }
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
    print("art profile path=$imagePath");

    //2023-5-22 老闆指示工地帽先不判斷, 但要用抓拍照
    // TODO check helmet, vest by api -- start

    boolList[1] = false;
    boolList[2] = false;
    try {
      final imageUrl = imagePath;
      //var HOST = "60.250.33.237:60105";
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

      Future<String?> checkHelmet(String imgBase64Str) async {
        final String checkUrl = "http://$AIHost/image_in";
        //print("art profile checkUrl=$checkUrl");
        var map = new Map<String, dynamic>();
        map['img'] = imgBase64Str;
        var response = await http.post(Uri.parse(checkUrl), body: map);
        if (response.statusCode == 200) {
          return response.body;
        } else {
          print('art call $checkUrl fail! code: $response.statusCode');
          return null;
        }
      }

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
        }

      }
      //print('art img2 url=$imagePath');
      final imgBase64Str = await networkImageToBase64(imageUrl.toString());
      if (imgBase64Str != null) {
          // final String checkUrl = "http://" + HOST + "/image_in";
          // var map = new Map<String, dynamic>();
          // map['img'] = imgBase64Str;
          // var response = await http.post(Uri.parse(checkUrl), body: map);
          // print("art image_in=$response");
          // Map data = jsonDecode(response.toString());
          // if (data["code"] == 200) {
          //   // print(boolList);
          //   boolList[1] = data["helmet"];
          //   boolList[2] = data["vest"];
          // } else {
          //   print('art call $checkUrl fail! code: $response.statusCode');
          // }
        //}

        // TODO : arttseng
        var body = await checkHelmet(imgBase64Str);
        if (body != null) {
          aiHealthy = true;
          Map data = jsonDecode(body);
          print("art image_in=$data");
          boolList[1] = data["helmet"];
          boolList[2] = data["vest"];
        }

      }
    //
    } catch (e, s) {
      aiHealthy = false;
      print('art post fetch and set catch error');
      print("Exception $e");
      print("StackTrace $s");
    }
    //print("art genProfile $name=$boolList");
    // TODO check helmet, vest by api -- end
    return Profile(name: name, profession: vendor, imageUrl:imagePath, action: actionStr,  boolList: boolList, faceId: faceId, end_time: msg.end_time!, typeId: int.parse(msg.type_id??"-1") );
  }

}

String getFacelibName(int typeid) {
  //print('art 0526 getFacelibName id='+ typeid.toString() + ", faceTypes len=" + faceTypes.length.toString());
  for(int i=0; i<faceTypes.length; i++) {
    if(faceTypes[i].id == typeid) {
      print('art 0526 bingo! id=$typeid name=${faceTypes[i].name!}');
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
    print('art faceId=${profilesPool[i].faceId}');
  }


  var ll = profilesPool.where((element) => (element.faceId==autoid));
  print("art update $autoid find =${ll.toList()}" );
  if(ll.isNotEmpty) {
    print("art update $autoid find =${ll.last}" );
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
  prefs.setString(PREF_KEY_PROFILE_POOL, jsonEncode(profilesPool));
  prefs.setString(PREF_KEY_PROFILE_REMAIN, jsonEncode(profilesRemain));
  prefs.setString(PREF_KEY_VENDOR , jsonEncode(vendorList));
  prefs.setString(PREF_KEY_ENTER_UNIQUE_FACEID , jsonEncode(enterFaceId.toList()));
  prefs.setString(PREF_KEY_LEAVE_UNIQUE_FACEID , jsonEncode(leaveFaceId.toList()));
  //print('art jsonEncode=' + jsonEncode(profilesRemain));

  //dbToFile();
}

Future<void> dbToFile() async {
  List<Map<String, Object?>>?  allData = await deHelper.getAllData();
  final buffer = StringBuffer();
  buffer.write("id,deviceId,in_out,faceId,FaceTypeId,time,OK,IN_TOTAL,IN_DEDUPLICATE,OUT_TOTAL,OUT_DEDUPLICATE,enterCount,enterUnique,leaveCount,leaveUnique,remain ${DBHelper.EnterChar}");
  allData?.forEach((element) {
    buffer.writeAll([element.values.toString().replaceAll('(', '').replaceAll(')', ''), DBHelper.EnterChar]);
  });
  writeFile(buffer.toString(), 'IN_OUT_${getYYYYMMDD()}.csv');
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
  if(!enterFaceId.contains(autoid)) {
    enterFaceId.add(autoid);
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

void resetData() {
  //resetToday();
  currentMode = DisplayMode.punch;
  vendorList.clear();

  profilesPool.clear();
  profilesRemain.clear();
  enterFaceId.clear();
  leaveFaceId.clear();
  enterCount = 0;
  leaveCount = 0;
}