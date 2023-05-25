import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Constants.dart';


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

String formatDateTime(DateTime dateTime) {
  return DateFormat('yyyy/MM/dd hh:mm:ss').format(dateTime);
}

String getformatNow() {
  final DateTime now = DateTime.now();
  return formatDateTime(now);
}

String getHHMM() {
  final DateTime now = DateTime.now();
  return DateFormat('hh:mm').format(now);
}

String formatDateTimeDashBoard(DateTime now) {
  String name = getLocaleWeekDay(now.weekday);
  return DateFormat('yyyy/MM/dd hh:mm:ss')
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
  List<String> name = ['', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六','星期日'];
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
  return "http://$WS_SERVER$path";
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