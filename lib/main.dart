
import 'package:far_glory_construction_gashboard/service/mqtt_service.dart';
import 'package:far_glory_construction_gashboard/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'DemoMain1.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((value) => runApp(MyApp()));

  setupServiceLocator();
  MQTTService _myService = getIt<MQTTService>();
  _myService.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Far Golary Dasboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: VideoPlayerExample( rtspUrl: 'rtsp://admin:ai123456@192.168.0.21:554/cam/realmonitor?channel=1&subtype=0',),
      //home: TencentPlayer( rtspUrl: 'rtsp://admin:ai123456@192.168.0.21:554/cam/realmonitor?channel=1&subtype=1'), // BLANK!
      home: DemoMain1(),
    );
  }
}


