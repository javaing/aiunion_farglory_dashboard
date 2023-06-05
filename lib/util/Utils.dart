import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Constants.dart';
import '../datamodel/ServerFaceType.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../datamodel/WebSocketFace.dart';


void showMsg(BuildContext context,String msg) {
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          elevation: 4,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          content: Text(style: const TextStyle(fontSize: 25), msg),
          actions: <Widget>[
            TextButton(
              child: const Text(style: TextStyle(fontSize: 25),"OK"),
              onPressed: (){
                //Navigator.of(context).pop();
                Navigator.pop(context,true);
              },)
          ],
        );
      }
  );
}

String getYYYYMMDD() {
  final DateTime now = DateTime.now();
  return DateFormat('yyyyMMdd').format(now);
}

String formatDateTime(DateTime dateTime) {
  return DateFormat('yyyy/MM/dd HH:mm:ss').format(dateTime);
}

String getformatNow() {
  final DateTime now = DateTime.now();
  return formatDateTime(now);
}

String getHHMM() {
  final DateTime now = DateTime.now();
  return DateFormat.Hm().format(now);
}

String formatDateTimeDashBoard(DateTime now) {
  String name = getLocaleWeekDay(now.weekday);
  return DateFormat('yyyy/MM/dd HH:mm:ss')
      .format(now)
      .replaceAll(" ", " \n$name ");
}

String formatTimeDashBoard(DateTime now) {
  String name = getLocaleWeekDay(now.weekday);
  return DateFormat(' hh:mm:ss')
      .format(now)
      .replaceAll(" ", " \n$name ");
}

Widget loadUrlImage(String url, double width) {
  if(url.contains("svg")) {
    return  SvgPicture.network(
      url,
      semanticsLabel: 'A shark?!',
      placeholderBuilder: (BuildContext context) => Container(
          padding: const EdgeInsets.all(30.0),
          child: const CircularProgressIndicator()),
    );
  } else {
    return getUrlImage2(url, width);
  }

}

Image getUrlImage2(String imagePath, double width) {
  return Image.network(
    imagePath,
    fit: BoxFit.cover,
    //height: 300, // set your height
    width: width, // and width here
  );
}

Image getUrlImage(String imagePath) {
  return getUrlImage2(imagePath, 300);
  // return Image.network(
  //   imagePath,
  //   fit: BoxFit.cover,
  //   height: 300, // set your height
  //   width: 300, // and width here
  // );
}

Image getAssetImage(String name) {
  return getAssetImageSize(name, 300);
}

Image getAssetImageSize(String name, double size) {
  return Image.asset(
    'images/$name',
    width: size,
    height: size,
    fit: BoxFit.contain,
  );
}

String getLocaleWeekDay(int weekday) {
  //List<String> name = ['', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六','星期日'];
  List<String> name = ['', 'Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat','Sun'];
  return name[weekday % name.length];
}

List<String> toStringList(List<int> intList) {
  List<String> myList = [];
  for (var element in intList) {
    myList.add(element.toString());
  }
  return myList;
}

T randomListItem<T>(List<T> lst) {
  Random rnd = Random();
  return lst[rnd.nextInt(lst.length)];
}

String getFullImageUrl(String url) {
  var path = url.replaceFirst("app/static", "/static");
  return "http://$HOST$path";
}

List<bool> dynamicToListBool(List<dynamic> dd) {
  List<bool> lb = [];
  for(int i=0;i<dd.length; i++) {
    lb.add(dd[i] as bool);
  }
  return lb;
}

List<String> dynamicToListString(List<dynamic> dd) {
  List<String> ls = [];
  for(int i=0;i<dd.length; i++) {
    ls.add(dd[i] as String);
  }
  return ls;
}

List<int> dynamicToListInt(List<dynamic> dd) {
  List<int> li = [];
  for(int i=0;i<dd.length; i++) {
    li.add(dd[i] as int);
  }
  return li;
}

Set<String> dynamicToSetString(List<dynamic> dd) {
  Set<String> ss = {};
  for(int i=0;i<dd.length; i++) {
    //print('art add set conatin('+ dd[i] +')'+  ss.contains(dd[i]).toString() );
    ss.add(dd[i] as String);
  }
  return ss;
}

String makeUrl(String path) {
  print("art makeUrl http://" + DEFAULT_WS_SERVER + path);
  return "http://" + DEFAULT_WS_SERVER + path;
}

Future<Response> dioV2Get(Dio dio, String path) {
  return dio.get(makeUrl(path),
    options: Options(headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $V2_TOKEN"
    }, validateStatus: (statusCode){
      if(statusCode == null){
        return false;
      }
      if(statusCode == 400||statusCode == 405||statusCode == 500){ // your http status code
        return true;
      }else{
        return statusCode >= 200 && statusCode < 300;
      }
    },),);
}


Future<String> getFilePath(String filename) async {
  String dir = "";
  // if(Platform.isAndroid) {
  //   dir = "/storage/emulated/0/Download";
  // } else if(Platform.isIOS) {
  //   dir = (await getApplicationDocumentsDirectory()).path;
  // }
  dir = (await getApplicationDocumentsDirectory()).path;
  String filePath = '$dir/$filename'; // 3
  //String filePath = '$filename'; // 3
  //print('art filePath=$filePath');
  return filePath;
}

void writeFile(String str, String filename) async {
  print('art DB writeFile=$str');
  File file = File(await getFilePath(filename)); // 1
  //file.writeAsString(str, mode:FileMode.append); // 2
  file.writeAsString(str); // 2
}

//Id	deviceId	faceId	faceTypeId	time
extension Qoo on WebSocketFace {
  String toString2() {
    var date = DateTime.fromMillisecondsSinceEpoch(start_time!);
    return "\"${identity!}\",\"${device_id!}\",\"${face_id!}\",\"${type_id ?? ""}\",\"${formatDateTime(date)}\"\n";
  }
}