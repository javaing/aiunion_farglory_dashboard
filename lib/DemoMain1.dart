import 'package:far_glory_construction_gashboard/Constants.dart';
import 'package:far_glory_construction_gashboard/view/TableScreen.dart';

import '../service/notification_service.dart';
import '../util/MqttUtil.dart';
import '../util/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../datamodel/NotifyMsg.dart';
import '../service/HttpService.dart';


import 'MyHomePage.dart';
import 'datamodel/FarGloryMsg.dart';



class DemoMain1 extends StatefulWidget {
  const DemoMain1({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DemoMain1> {

  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    //initMQTT();
    //notificationService.initNotifications();
  }



  @override
  void dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Demo List'),
      // ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left:40, bottom: 0, right: 40, top:20),
          children: <Widget>[
            FunctionItem(index:0),
            FunctionItem(index:1),
          ],
        ),
      ),
    );
  }

}

class FunctionItem extends StatefulWidget {
  const FunctionItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<StatefulWidget> createState() => _SwitchState();
}





class _SwitchState extends State<FunctionItem> {
  var functionName = [
    "TableScreen",
    'Setting',
  ];

  final String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:0, bottom: 0, right: 0, top:20),
      //color: Colors.transparent,
      child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 8,
                  padding: const EdgeInsets.all(20)
              ),
              onPressed: () async {
                switch(widget.index) {
                  case 0:
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TableScreen()),
                    );
                    break;
                  case 1:
                    //showMsg(context, "此功能製作中");
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                      return ImageViewDialog(path: 'aidesk_spec.jpg');
                    });
                    break;

                }

                },
              child: Text(style: TextStyle(fontSize: 25), functionName[widget.index])),
    );

  }
}

class ImageViewDialog extends StatelessWidget {
  final String path;

  ImageViewDialog({required this.path});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset('images/$path'),
      ),
    );
  }
}
