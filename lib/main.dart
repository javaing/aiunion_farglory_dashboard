
import 'package:far_glory_construction_gashboard/Constants.dart';
import 'package:far_glory_construction_gashboard/service/mqtt_service.dart';
import 'package:far_glory_construction_gashboard/service/service_locator.dart';
import 'package:far_glory_construction_gashboard/util/Utils.dart';
import 'package:far_glory_construction_gashboard/view/TableScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs
import 'package:shared_preferences/shared_preferences.dart';
import 'DemoMain1.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight,
  // ]).then((value) => runApp(MyApp()));

  //setupService();
  //MQTTService _myService = getIt<MQTTService>();
  //_myService.init();


  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //若無給初始值
      String setting = prefs.getString(PREF_KEY_WS_SERVER)??"";
      //print('art 05111 a ' + setting);
      if(setting.isEmpty) {
        //print('art 05111 b');
        prefs.setString(PREF_KEY_WS_SERVER, DEFAULT_WS_SERVER);
      }
      //進場設備
      setting = prefs.getString(PREF_KEY_IN_DEVICEIDS)??"";
      if(setting.isEmpty) {
        prefs.setString(PREF_KEY_IN_DEVICEIDS, DEFAULT_IN_DEVICEIDS);
      }
      //出場設備
      setting = prefs.getString(PREF_KEY_OUT_DEVICEIDS)??"";
      if(setting.isEmpty) {
        prefs.setString(PREF_KEY_OUT_DEVICEIDS, DEFAULT_OUT_DEVICEIDS);
      }
      //清場時間
      setting = prefs.getString(PREF_KEY_CLEARUP_TIME)??"";
      if(setting.isEmpty) {
        prefs.setString(PREF_KEY_CLEARUP_TIME, DEFAULT_CLEARUP_TIME);
      }
      //歸零時間
      setting = prefs.getString(PREF_KEY_RESET_TIME)??"";
      if(setting.isEmpty) {
        prefs.setString(PREF_KEY_RESET_TIME, DEFAULT_RESET_TIME);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadPref();
  }


  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   localizationsDelegates: [
    //     GlobalMaterialLocalizations.delegate,
    //     GlobalWidgetsLocalizations.delegate,
    //     GlobalCupertinoLocalizations.delegate,
    //   ],
    //   supportedLocales: [
    //     Locale('en'), // English
    //     Locale.fromSubtags(
    //         languageCode: 'zh',
    //         scriptCode: 'Hant',
    //         countryCode: 'TW'),
    //   ],
    //
    //   debugShowCheckedModeBanner: false,
    //   title: 'Far Golary Dasboard',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   //home: VideoPlayerExample( rtspUrl: 'rtsp://admin:ai123456@192.168.0.21:554/cam/realmonitor?channel=1&subtype=0',),
    //   //home: TencentPlayer( rtspUrl: 'rtsp://admin:ai123456@192.168.0.21:554/cam/realmonitor?channel=1&subtype=1'), // BLANK!
    //   //home: DemoMain1(),
    //   home: TableScreen(),
    // );

    return  TableScreen();
  }


}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//       localizationsDelegates: [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: [
//         Locale('en'), // English
//         Locale.fromSubtags(
//             languageCode: 'zh',
//             scriptCode: 'Hant',
//             countryCode: 'TW'),
//       ],
//
//       debugShowCheckedModeBanner: false,
//       title: 'Far Golary Dasboard',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       //home: VideoPlayerExample( rtspUrl: 'rtsp://admin:ai123456@192.168.0.21:554/cam/realmonitor?channel=1&subtype=0',),
//       //home: TencentPlayer( rtspUrl: 'rtsp://admin:ai123456@192.168.0.21:554/cam/realmonitor?channel=1&subtype=1'), // BLANK!
//       //home: DemoMain1(),
//       home: TableScreen(),
//     );
//   }
// }


