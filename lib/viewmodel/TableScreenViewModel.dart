import 'dart:async';
import 'dart:collection';
import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:intl/intl.dart';
import 'package:mac_address/mac_address.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


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
import 'package:web_socket_channel/io.dart';


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
int blockCount = 0;
List<int> enterFaceId = [];
List<int> leaveFaceId = [];
bool aiHealthy = false;
bool socketHealthy = false;


String mClearTime = DEFAULT_CLEARUP_TIME;
String mResetTime = DEFAULT_RESET_TIME;
String mAIHost = DEFAULT_AI_SERVER;
String mDeduplicate = DEFAULT_DEDUP_SEC;


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
//db path: /data/data/com.aiunion.far_glory_construction_dashboard/databases/my_db.db
//file: /data/data/com.aiunion.far_glory_construction_dashboard/app_flutter/socket_20230607.txt
//deviceId	in_out	faceId	FaceTypeId	time	OK	IN_TOTAL	IN_DEDUPLICATE	OUT_TOTAL	OUT_DEDUPLICATE + 5  大屏五項資料
bool mIsNeedLog = true;
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

var mRun1 = 0.0;
var mRun2 = 0.0;
//bool isLoadProfileFinish=false;
int disconnectTimeStamp = 0;
String aiAPIAlertSubject = "工地大屏 AI ";
String aiAPIAlertFail = "Not working";
String aiAPIAlertOK = "OK";
String aiAPIAlertReciver = "t108360228@ntut.org.tw,paul.liao@aiunion.com.tw,arttseng@pm.me";
//String aiAPIAlertReciver = "arttseng@pm.me";
String socketAlertSubject = "工地大屏 Socket ";
String socketAlertReciver = "paul.liao@aiunion.com.tw,arttseng@pm.me";
//String socketAlertReciver = "arttseng@pm.me";

String? deviceIP;
String? mac;


class TableScreenViewModel {
  var webSocketUrl = "ws://$HOST:$WS_PORT$WS_TOPIC";

  TableScreenViewModel(BuildContext ctx)  {
    //print('art WebSocket url=$webSocketUrl');


    stomp = StompClient(
        config: StompConfig(
          //heartbeatOutgoing: const Duration(milliseconds: 500),
          //heartbeatIncoming: const Duration(milliseconds: 500),
          url: webSocketUrl,
          onConnect: onConnectCallback1,
          //onWebSocketError: (e) => socketHealthy=false,
          onWebSocketError: onSocketError,
          onStompError: (d) => print('art error stomp'),
          onDisconnect: onDisconnect,
          onDebugMessage: (f) => print('art debug $f'),
          onUnhandledFrame: (f) => print('art onUnhandledFrame $f'),
          onUnhandledMessage: (f) => print('art onUnhandledFrame $f'),
          onUnhandledReceipt: (f) => print('art onUnhandledFrame $f'),
        )
    );
    //stomp.activate();


    
  }

  void onSocketError(dynamic e) {
    socketHealthy=false;

    var body = alertBody("WebSocket onWebSocketError() $e");
    sendEmail(socketAlertTitle('Scoket Error'), body, socketAlertReciver);
  }

  //網路斷線紀錄時間 重連後,補資料
  void onDisconnect(StompFrame f) {
    print('art 0615 disconnected');
    if(disconnectTimeStamp==0) {
      disconnectTimeStamp = DateTime.now().millisecondsSinceEpoch;
    }
    var body = alertBody("WebSocket onDisconnect() ${f.body ?? ""}");
    sendEmail(socketAlertTitle('Disconnect'), body, socketAlertReciver);
  }

  //補資料作法 查詢captures, 比對目前最後 一筆資料時間, 補完之後再去訂閱
  Future<void> syncCaptures(int startTime, int endTime) async {
    if(faceTypes.isEmpty) {
      print('reload socket return! faceTypes.isEmpty');
      return;
    }
    // if(!isLoadProfileFinish) {
    //   print('reload socket return! isLoadTodayProfileFinish=false');
    //   return;
    // }

    if(mRun1==0) {
      deviceIP = await printIps();
      mac = await GetMac.macAddress;
      sendEmail(socketAlertTitle('App Launch'), "App Launch!", socketAlertReciver);
    }

    //var mPrecent = 0.0;
    if(mRun1==1 && mRun2 ==1) {
      print('reload socket return! mPrecent==1 && mPrecent2 ==1');
      return;
    }

    if(mRun1>0 && mRun1<1) {
      print('Bingo! reload socket return! Run 1 ing');
      return;
    }

    if(mRun1==0) {
      print('reload socket Run 1');
      mRun1 = 0.1;
      //return;
    }
    if(mRun1==1) {
      print('reload socket Run 2');
    }

    //var format = new DateFormat('HH:mm:ss');
    //var ss = DateTime.fromMillisecondsSinceEpoch(startTime);
    //var ee = DateTime.fromMillisecondsSinceEpoch(endTime);
    //print('art afterReloadData ' + format.format(ss) + ", end=" + format.format(ee));
    
    String captureUrl = "http://$HOST/api/captures?capturedAtBegin=$startTime&capturedAtEnd=$endTime&deviceIds=5,3&isWhitelist=true&pageSize=1000";
    
    //reload 6/19
    //captureUrl = "http://60.250.33.237//api/captures?capturedAtBegin=1687107589000&capturedAtEnd=1687190389000&isWhitelist=true&pageSize=1000";

    var response = await http.get(Uri.parse(captureUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      List result = map['result'];
      var captureList = List.from(result.reversed);
      //比對目前最後一筆資料時間,
      int patchStart=0;
      if(profilesPool.isNotEmpty) {
        for(int i=0; i<captureList.length; i++) {
          var each = captureList[i];
          var end_time = each['capturedAt'];
          int poolLastTime = profilesPool[profilesPool.length-1].start_time;
          if(end_time>poolLastTime) {
            patchStart = i+1;
            break;
          }
        }
      }
      print(captureUrl);
      print('art total=${captureList.length-patchStart} 比對目前最後一筆資料 patchStart:$patchStart' );
      // if(patchStart==0) {
      //   resetData();
      // }

      //double total = captureList.length - patchStart + 0.0;
      for(int i=patchStart; i<captureList.length; i++) {
        var each = captureList[i];
        WebSocketFace face = WebSocketFace(
          cid: each['cid'],
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
          enabled: each['isWhitelist']==1,
          snapshot_uri: each['filePath'],
        );
        String deviceID = face.device_id!;


        bool isNeedLoad = false;
        if((captureList.length-i) < 6) {
          isNeedLoad = true;
        }
        if(deviceID=="5") {
          await processIn(deviceID, face, isNeedLoad);
        } else {
          await processOUT(deviceID, face, isNeedLoad);
        }
        print('art debugCaptures [$i] ' + face.name! + ", isNeedLoad=" + isNeedLoad.toString());

        if((captureList.length-i) < 6) {
          //sleep(const Duration(milliseconds: 1500));
          await Future.delayed(const Duration(milliseconds: 1500), (){});
        }
      }

      if(mRun1==1) {
        mRun2==1;
        stomp.activate();
      } else {
        mRun1=1;
        //loadRemoteCaptures(startTime, endTime);
        stomp.activate(); // not run twice, so activite here
      }

    } else {
      print('art get fail ');
      stomp.activate();
    }


  }
  
  deactivate() {
    stomp.deactivate();
  }


  void addSubscribe(String deviceID) {
    stomp.subscribe(destination: "/topic/capture/$deviceID", headers: {}, callback: (frame) {

      socketHealthy = true;
      WebSocketFace face=  webSocketFaceFromJson(frame.body.toString());
      processIn(deviceID, face, true);

    });
  }

  Future<void> processIn(String deviceID, WebSocketFace face, bool isNeedLoadImage) async {
    //check id exist
    bool isExist = await deHelper.isDataExist(face.getCID() );
    if(isExist) {
      print("art 0612 DataExist! id:${face.getCID()}" );
      return;
    }

    writeFileAppend(face.toString2(DBHelper.IN)+DBHelper.EnterChar, 'socket_${getYYYYMMDD()}.txt');
    if(mIsNeedLog) {
      var result= await dbLogIn(deviceID, face);
    }
    var result = await webSocketToPool(face, "enter", isNeedLoadImage);
  }

  // bool isDuplicate(WebSocketFace face) {
  //   //print("art isDuplicate currentMode=${currentMode.name}");
  //   return profilesPool.length>0 && isSameFace(profilesPool.last, face) && (currentMode == DisplayMode.punch);
  // }



  //與Remain比對，如果存在一樣faceid且15秒內 則不計離場或新增
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
        var diff = face.end_time! - profilesRemain[i].start_time;
        print('art isDuplicate ' + face.name! + " time diff=" + diff.toString() +" , 更新 profilesRemain[i].end_time");
        profilesRemain[i].start_time = face.end_time!;
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
      processOUT(deviceID, face, true);

    });


  }

  Future<void> processOUT(String deviceID, WebSocketFace face, bool isNeedLoadImage) async {
    //check id exist
    bool isExist = await deHelper.isDataExist(face.getCID() );
    if(isExist) {
      print("art 0612 DataExist! id:${face.getCID()}" );
      return;
    }

    writeFileAppend(face.toString2(DBHelper.OUT)+DBHelper.EnterChar, 'socket_${getYYYYMMDD()}.txt');
    if(mIsNeedLog) {
      await dbLogOut(deviceID, face);
    }
    webSocketToPool(face, "leave", isNeedLoadImage);
  }

  Future<void> goSubscribe() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String setting = prefs.getString(PREF_KEY_IN_DEVICEIDS)?? DEFAULT_IN_DEVICEIDS ;
    List<String> ids = setting.split(",");
    ids.forEach((element) {
      addSubscribe(element);}
    );


    setting = prefs.getString(PREF_KEY_OUT_DEVICEIDS)?? DEFAULT_OUT_DEVICEIDS;
    ids = setting.split(",");
    ids.forEach((element) {
      addLeaveSubscribe(element);
    });
  }


  void onConnectCallback1(StompFrame connectFrame) {
    // if(disconnectTimeStamp>0) {
    //   //網路斷線紀錄時間 重連後,補資料
    //   int endTime = DateTime.now().millisecondsSinceEpoch;
    //   loadRemoteCaptures(disconnectTimeStamp, endTime);
    //   disconnectTimeStamp = 0; //reset
    // }

    //if(!socketHealthy) {
      //var body = alertBody("Socket connect OK");
      //sendEmail(socketAlertTitle('Connect OK'), body, socketAlertReciver);

      goSubscribe();
    //}
    socketHealthy = true;
  }

  webSocketToPool(WebSocketFace face, String action, bool isNeedLoadImage) async {
    //print('art genProfile2 isNeedLoadImage:$isNeedLoadImage');
    // genProfile2(face, action, isNeedLoadImage).then((value) => {
    //   addToPool(value, action)
    // });
    Profile p = await genProfile2(face, action, isNeedLoadImage);
    addToPool(p, action, isNeedLoadImage);
  }

  bool isSameFace(Profile profile, WebSocketFace face) {
    return profile.faceId == face.face_id && profilesPool.last.action == EASY_READ_ENTER;
  }


  void addToPool(Profile p, String action, bool isNeedLoadImage) {
    //print('art addToPool is success=${p.name}');
    if(currentMode == DisplayMode.clearup) {
      leaveCount = leaveCount+1;
      if(profilesRemain.isNotEmpty) {
        profilesRemain.removeLast();
        saveToPref();
      }
    } else {
      switch(action) {
        case "enter":
          updateVendorList(p);
          profilesPool.add(p);
          break;

        case "leave":
          p.action = EASY_READ_LEAVE;
          profilesPool.add(p);

          //playMP3('blacklist.mp3'); //for test

          var ll = profilesRemain.where((element) => element.faceId==p.faceId);
          //print('art check remove p.faceId=' + p.faceId.toString() + " name=" + p.name + " ll size=" + ll.length.toString());
          if(ll.isNotEmpty) {
            leaveCount = leaveCount+1;
            if(!leaveFaceId.contains(p.faceId)) {
              leaveFaceId.add(p.faceId);
            }
            Profile find = ll.first;
            var isSuiccess = profilesRemain.remove(find);
            //print('art remove is success=$isSuiccess');
            saveToPref();
          } else {
            print('profile leave: 不在場又離場? ${p.name} faceid:${p.faceId}');
            p.isValid = false;
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
    return Profile(name: name, profession: vendor, imageUrl:msg.imgUrl!, action: actionStr,  boolList: boolList, faceId: int.parse(msg.id!), start_time: 0, typeId:-1, isValid: true );
  }

  Future<Profile> genProfile2(WebSocketFace msg, String action, bool isNeedLoadImage) async {

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
          print('art call $imageUrl fail! code: ${response.statusCode}');
          return null;
        }
      }

      Future<String?> checkHelmet(String imgBase64Str) async {
        final String checkUrl = "http://$mAIHost/image_in";
        //print("art profile checkUrl=$checkUrl");
        var map = new Map<String, dynamic>();
        map['img'] = imgBase64Str;
        var response = await http.post(Uri.parse(checkUrl),
            headers: <String, String>{
              'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            },
            body: map);
        if (response.statusCode == 200) {
          return response.body;
        } else {
          print('art call $checkUrl fail! code: ${response.statusCode}');
          return null;
        }
      }

      if(isNeedLoadImage) {
        String snapshotUrl = (msg.snapshot_uri ?? "");
        print('art img2 ${msg.name}  snapshot=$snapshotUrl');
        if(snapshotUrl!.isNotEmpty) {
          if(snapshotUrl.startsWith("app/static")|| snapshotUrl.startsWith("/static")) {
            var url = getFullImageUrl(snapshotUrl);
            imagePath = url;
          } else {
            imagePath = snapshotUrl;
          }

        }
        //print('art img2 url=$imagePath');
        final imgBase64Str = await networkImageToBase64(imageUrl.toString());
        if (imgBase64Str != null) {
          var body = await checkHelmet(imgBase64Str);
          if (body != null) {
            if(aiHealthy==false) {
              var body = await alertBody(aiAPIAlertOK);
              sendEmail(aiAlertTitle(aiAPIAlertOK), body, aiAPIAlertReciver);
            }
            aiHealthy = true;
            Map data = jsonDecode(body);
            print("art image_in=$data");
            if(data['zconfidence']>0) {
              boolList[1] = data["helmet"];
              boolList[2] = data["vest"];
            }
          }
        }
      }

    //
    } catch (e, s) {
      if(aiHealthy==true) {
        var body = await alertBody(aiAPIAlertFail);
        sendEmail(aiAlertTitle(aiAPIAlertFail), body, aiAPIAlertReciver);
      }
      aiHealthy = false;
      print('art post fetch and set catch error');
      print("Exception $e");
      print("StackTrace $s");
    }
    //print("art genProfile $name=$boolList");
    // TODO check helmet, vest by api -- end
    return Profile(name: name, profession: vendor, imageUrl:imagePath, action: actionStr,  boolList: boolList, faceId: faceId, start_time: msg.start_time!, typeId: int.parse(msg.type_id??"-1"), isValid:true  );
  }

}

// bool isInReloadData() {
//   if(mPrecent==0 || mPrecent2==0) {
//     print('art 0615 isInReload:mPrecent==0 || mPrecent2==0 ');
//     return true;
//   }
//   if(!stomp.isActive) {
//     print('art 0615 isInReload:mPrecent==0 || mPrecent2==0 ');
//     return true;
//   }
//   print('art 0615 isInReload: true');
//   return false;
// }

String getFacelibName(int typeid) {
  //print('art 0526 getFacelibName id='+ typeid.toString() + ", faceTypes len=" + faceTypes.length.toString());
  for(int i=0; i<faceTypes.length; i++) {
    if(faceTypes[i].id == typeid) {
      //print('art 0526 bingo! id=$typeid name=${faceTypes[i].name!}');
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

// void askFaceDetail(String action, Profile profile) async {
//   if(action=="enter")
//     updateVendorList(profile.profession, profile);
// }

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
  //print("art isExistRemain =${ll.length}");
  return ll.length>0;
}

Future<void> saveToPref() async {
  if(1+1==2) {
    //debugPrint('art 暫時先都不存,反正重啟會reload');
    return;
  }
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

// Future<void> dbToFile() async {
//   List<Map<String, Object?>>?  allData = await deHelper.getAllData();
//   final buffer = StringBuffer();
//   buffer.write("id,deviceId,in_out,faceId,FaceTypeId,time,OK,IN_TOTAL,IN_DEDUPLICATE,OUT_TOTAL,OUT_DEDUPLICATE,enterCount,enterUnique,leaveCount,leaveUnique,remain ${DBHelper.EnterChar}");
//   allData?.forEach((element) {
//     buffer.writeAll([element.values.toString().replaceAll('(', '').replaceAll(')', ''), DBHelper.EnterChar]);
//   });
//   writeFile(buffer.toString(), 'IN_OUT_${getYYYYMMDD()}.csv');
// }

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
void updateVendorList(Profile profile) {
  String company = profile.profession;
  int autoid = profile.faceId;
  int typeId = profile.typeId;
  if(isExistRemain(autoid)) {
    blockCount++;
    print("art 還未離場又進場的人不用加1");
    profile.isValid = false;
    //playMP3('blacklist.mp3');
    return;
  }
  enterCount++;
  if(!enterFaceId.contains(autoid)) {
    enterFaceId.add(autoid);
  }

  profilesRemain.add(profile);
  saveToPref();

  //print('art 0526 find vendor typeid:' + typeId.toString() + ", company="+ company);
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

//工地大屏 Socket Connect OK (60.250.33.237)
String aiAlertTitle(String status) {
  return "$aiAPIAlertSubject $status ($deviceIP)";
}

String socketAlertTitle(String status) {
  return "$socketAlertSubject $status ($deviceIP)";
}

String alertBody(String status) {
  return '''Status: $status<br>
      Server: $HOST<br>
      dsbox IP: $deviceIP<br>
      dsbox MAC: $mac<br>
      AI : $mAIHost<br>
      Time: ${getformatNow()}<br>
      ''';
}



void resetData() {
  print('art resetData()');
  //resetToday();
  currentMode = DisplayMode.punch;
  vendorList.clear();

  profilesPool.clear();
  profilesRemain.clear();
  enterFaceId.clear();
  leaveFaceId.clear();
  enterCount = 0;
  leaveCount = 0;
  blockCount = 0;
}
