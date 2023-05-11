import 'dart:convert' as convert;
import 'dart:convert';

import 'package:flutter/material.dart';

import '../Constants.dart';
import '../datamodel/FacesDetail.dart';
import '../datamodel/FarGloryMsg.dart';
import '../datamodel/Profile.dart';
import '../datamodel/WebSocketFace.dart';
import '../util/Utils.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

//final List<String> headerInfo = ['GPT-4掀起AI界高潮，ChatGPT之父卻怕了：我設了一個終止開關    敬禮！張育成獲經典賽最佳一壘手    BLACKPINK七月再來台？「主辦方員工」洩消息',
//  '            26°  大致晴朗'];
final String headerNews = '進行高空作業前，一定要確認安全掛勾是否扣上     進入狹窄的空間前，進入狹窄的空間前，    進入工地戴安全帽（安全帽區域）     確實配戴背負式安全帶（磨損的安全線束）';
final String headerWeather = '26°\n大致晴朗';
final List<String> leftRow1Title = ['進場人次','出場人次','現場人數'];
final List<String> clearupTitle = ['進場人次','出場人次','滯留人數'];
//List<String> leftRow1Count = ["99","0","99"];
int leaveCount = 0;
const String enterStr = '進場';
const String leaveStr = '出場';

final List<String> workTypeTitle = ['點工', '板模', '水泥', '排水', '電氣', '吊臂', '砂石'];
List<int> workTypeCount = [0, 0, 0, 0, 0, 0, 0];


const Utf8Codec utf8 = Utf8Codec();

final List<String> environTitle = ['PM2.5', 'PM10', '紫外線指數', "噪音", "濕度", "溫度", "風速"];
List<String> environCount = ["21", "66", "6", "86 db", "75%", "27度C", "4.4m/s"];
List<String> environColor = ["yellow", "green", "red", "green", "green", "green", "green"];

// List<String> vendorTitle = ['榮工處', '華雄營造', '大林組', '三重埔營造', '大肚營造', '金豪營造'];
// List<int> vendorCount = [9, 20, 20, 20, 20, 10];
final String DEFAULT_VENDOR_NAME = '承包商';
List<String> vendorTitle2 = ['承包商', '承包商', '承包商', '承包商', '承包商', '承包商', '承包商', '承包商', '', ''];
List<double> vendorCount2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

 final List<String> rightRowTitle = ['廠商A', '廠商B', '廠商C', '廠商D', '廠商E', '廠商F', '廠商G','廠商H'];
// List<int> rightRowCount = [7, 8, 5, 6, 15, 35, 3, 5];

List<String> workerImages = ['worker1.png', 'worker2.png', 'worker3.png', 'worker4.png', 'worker5.png'];
List<String> workerNames = ['姜才藝','黃文柏','蘇銳思','沈立誠','徐涵暢','萬泰清','孫鵬翼','史俊雄','湯嘉石','秦承運','李文成','夏陽舒','袁經義','盧樂湛','謝俊材','段雨星','崔俊哲',];
List<bool> boolList = [true, true, true, true]; //酒測 工地帽 背心 效期內,非黑名單
List<bool> boolListDrink = [false, true, true, true];
//List<bool> boolListHat = [true, false, true, true];
List<bool> boolListBlack = [true, true, true, false];


List<Profile> profilesRemain = [
  //Profile(name: '黃 * 林', profession: rightRowTitle[3], imageUrl: workerImages[2], action: leaveStr, boolList: boolList, faceId: '0' ),
];
List<Profile> profilesPool = [
  //Profile(name: '陳 * 榮', profession: rightRowTitle[0], imageUrl: workerImages[0], action: leaveStr, boolList: boolList, faceId: '0'),
];
List<Profile> profiles = [
];
final int LIMIT_LIST_PROFILE = 5;

enum DisplayMode {
  punch,
  clearup,
}
DisplayMode currentMode = DisplayMode.punch ; //差勤或清場
late StompClient stomp;
final dio = Dio();


void askFaceDetail(String id, String action) async {
  final response = await dio.get("http://$WS_SERVER/api/faces/$id");
  //print(response);

  FacesDetail apiFaces = facesDetailFromJson(response.toString());
  Result? face = apiFaces.result;
  if(face!=null) {
    updateProfile(face);
    if(action=="enter")
      updateVendorCount(face);
  }
}

void updateProfile(Result face) {
  String company = face.company?? "" ;
  String title = face.title ?? "";
  int autoid = face.autoid ?? 0;

  Profile pp = profilesPool.where((element) => int.parse( element.faceId! ) == autoid).last;
  if(pp!=null) pp.profession = "$company-$title";
}

void updateVendorCount(Result face) {
  //vendorDefault
  String company = face.company?? "" ;
  if(vendorTitle2.contains(company)) {
    for (int i = 0; i <vendorTitle2.length ; i++) {
      print("art find company  name=" + vendorTitle2[i]);
      if(vendorTitle2[i]==company) {
        vendorCount2[i] = vendorCount2[i]+1;
        break;
      }
    }
  } else {
    //find first no default name
    for (int i = 0; i <vendorTitle2.length ; i++) {
      print("art find first no default name=" + vendorTitle2[i]);
      if(vendorTitle2[i]==DEFAULT_VENDOR_NAME) {
        vendorTitle2[i]=company;
        vendorCount2[i] = vendorCount2[i]+1;
        break;
      }
    }
  }

}



extension BoolParsing on String {
  bool parseBool() {
    print("art 0419 check=" + this.toLowerCase());
    return this.toLowerCase() == 'true';
  }
}


class TableScreenViewModel {
  
  TableScreenViewModel(BuildContext ctx) {
    var webSocketUrl = "ws://" + WS_SERVER + ":" + WS_PORT.toString() + WS_TOPIC;
    print('art WebSocket url=' + webSocketUrl);

    stomp = StompClient(
        config: StompConfig(
          url: webSocketUrl,
          onConnect: onConnectCallback1,
          onWebSocketError: (e) => //showMsg(ctx, e.toString())
          print('art onWebSocketError e=' + e.toString()),
          onStompError: (d) => print('art error stomp'),
          onDisconnect: (f) => print('art disconnected'),
          onDebugMessage: (f) => print('art debug ' + f),
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
          print("art face 去重 " + face.name! + " , id=" + face.face_id.toString());
          //webSocketToPool(face, "leave"); //for test
          return;
        }

        webSocketToPool(face, "enter");
      }

    });
  }

  bool isDuplicate(WebSocketFace face) {
    print("art isDuplicate currentMode=" + currentMode.name);
    return profilesPool.length>0 && isSameFace(profilesPool.last, face) && (currentMode == DisplayMode.punch);
  }

  void addLeaveSubscribe(String deviceID) {
    stomp.subscribe(destination: "/topic/capture/$deviceID", headers: {}, callback: (frame) {

      WebSocketFace face=  webSocketFaceFromJson(frame.body.toString());
      //print("art face " + face.name! + ", " + face.type_id! + "");
      if(face.enabled!=null && face.enabled!) {
        webSocketToPool(face, "leave");
      }

    });
  }


  Future<void> onConnectCallback1(StompFrame connectFrame) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String setting = prefs.getString(PREF_KEY_IN_DEVICEIDS)??"";
    List<String> ids = setting.split(",");
    ids.forEach((element) {addSubscribe(element);});
    if(WS_SERVER == '192.168.0.109') {
      addSubscribe('30'); //for test in 109
      addLeaveSubscribe('31');
    }


    setting = prefs.getString(PREF_KEY_OUT_DEVICEIDS)??"";
    ids = setting.split(",");
    ids.forEach((element) {addLeaveSubscribe(element);});

  }

  webSocketToPool(WebSocketFace face, String action) {
    Profile p = genProfile2(face, action);
    p.boolList = null;
    addToPool(p, action);
  }

  bool isSameFace(Profile profile, WebSocketFace face) {
    return int.parse(profile.faceId!) == face.face_id && profilesPool.last.action == enterStr;
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
          if(profilesPool.length>LIMIT_LIST_PROFILE) {
            profilesPool.removeRange(0, profilesPool.length-LIMIT_LIST_PROFILE);
          }

          askFaceDetail(p.faceId!, action);
          profilesPool.add(p);
          profilesRemain.add(p);
          break;

        case "leave":
          askFaceDetail(p.faceId!, action);
          leaveCount = leaveCount+1;
          p.action = leaveStr;
          profilesPool.add(p);
          Profile find = profilesRemain.where((element) => element.faceId==p.faceId).first;
          profilesRemain.remove(find);
          break;

        default:
          break;
      }
    }

    var filtered1 = profilesPool.where((e) => e.action == leaveStr).toList();
    leaveCount = filtered1.length;
  }

  static String base64Decode(String data){
    List<int> bytes = convert.base64Decode(data);
    // 網上找的很多都是String.fromCharCodes，這個中文會亂碼
    //String txt1 = String.fromCharCodes(bytes);
    String result = convert.utf8.decode(bytes);
    return result;
  }

  Profile genProfile(FarGloryMsg msg) {
    String actionStr = enterStr;
    if(msg.action=="leave") {
      actionStr = leaveStr;
    }
    String myName;
    if(msg.name==null || msg.name!.isEmpty) {
      myName = randomListItem(workerNames);
    } else {
      myName = utf8.decode(msg.name!.codeUnits);
    }
    String name = myName.replaceRange(1, 2, ' * ');
    String vendor = "${randomListItem(vendorTitle2)}-${randomListItem(workTypeTitle)}";
    return Profile(name: name, profession: vendor, imageUrl:msg.imgUrl!, action: actionStr,  boolList: boolList, faceId: msg.id);
  }

  Profile genProfile2(WebSocketFace msg, String action) {
    //轉成好讀
    String actionStr = enterStr;
    if(action=="leave") {
      actionStr = leaveStr;
    }

    String myName;
    if(msg.name==null || msg.name!.isEmpty) {
      myName = randomListItem(workerNames);
    } else {
      //myName = utf8.decode(msg.name!.codeUnits);
      myName = msg.name!;
    }
    String name = myName.replaceRange(1, 2, ' * ');
    String vendor = "${randomListItem(vendorTitle2)}-${randomListItem(workTypeTitle)}";
    String faceId = msg.face_id!.toString();
    String imagePath = "http://" + WS_SERVER + msg.photo!;
    //imagePath = msg.photo_string!;
    print("art profile path=" + imagePath);
    return Profile(name: name, profession: vendor, imageUrl:imagePath, action: actionStr,  boolList: boolList, faceId: faceId);
  }

}