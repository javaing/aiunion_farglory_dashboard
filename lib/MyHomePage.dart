import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/MqttUtil.dart';
import '../../datamodel/SettingItem.dart';
import '../service/HttpService.dart';
import '../util/Utils.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.imagePath});
  final String imagePath;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late Image _imageToShow = getAssetImage('aiunion_icon.png');
  late String _timeString;
  late Timer _timer;


  @override
  void initState() {
    super.initState();

    _timeString = formatDateTime(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());

    //_imageToShow = getAssetImage('aiunion_icon.png');
    print('art 0223 initState() image=${widget.imagePath}');
    if(widget.imagePath.isNotEmpty)
      _imageToShow = getUrlImage(widget.imagePath);
  }


  @override
  void deactivate() {
    super.deactivate();
    _timer.cancel();
  }


  void _incrementCounter() {
    setState(() {
      //fetchData(); //Test Rest API+ JSON parse
      _counter++;
      testMqttSend(_counter); //TEst MQTT
    });
  }

  void testMqttSend(int count) {
    var msg = "from app $count";
    msg = '{"page":1,"total":18,"result":[{"photo":"/static/captures/photo/9/8a/518/4f97/cb16cbd4ce2ea35e00b016.jpg","faceId":null,"person":null,"identity":null,"serialNo":null,"cardSerialNo":null,"company":null,"faceTypeId":0,"faceTypeName":null,"similarity":0.00,"temperature":0.0,"capturedAt":1676876145000,"deviceId":1,"deviceName":"21(FC20)","categoryName":"1F","temperatureThreshold":0.0,"background":"","deviceType":"fc20","title":null,"createdAt":null,"filePath":null,"isFever":0,"isStranger":1,"isWhitelist":0,"isBlacklist":0,"isGuest":0,"isVip":0,"noface":false,"deny":false,"fever":false,"memo":","}],"pageSize":1}';
    MqttUtil.getInstance()?.publishMessage("hello/world", msg);
  }


  Future<List<SettingItem>?> fetchData() async {
    HttpService httpService = HttpService();
    final response = await httpService.get('api/v2/settings?pageSize=9999');
    final jsonStr = json.encode(response.data);
    final result = settingDataFromJson(jsonStr);
    //print(result.page);
    //print(result.total);
    print(result.result?[0]);
    return result.result;
  }

  Widget getBody() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:0, bottom: 0, right: 0, top:20),
          ),
          SizedBox(
              width: double.infinity,
              child: Text(
              textAlign: TextAlign.right,
                style: TextStyle(fontSize: 25),
                formatDateTime(DateTime.now()),
              )
          ),
          Expanded(
            child: getCenter(),
          ),
        ],
    );
  }

  Widget getCenter() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            style: TextStyle(fontSize: 25),
            '秀通知的圖',
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 2)),
            child: _imageToShow,
          ),
          SizedBox(
            height: 50,
          ),
          // Text(
          //   'count:$_counter',
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('顯示時刻,收推播'),
      ),
      body: getBody(),
      // floatingActionButton: Container(
      //   height: 100.0,
      //   width: 100.0,
      //   child: FittedBox(
      //     child: FloatingActionButton(
      //       onPressed: _incrementCounter,
      //       tooltip: 'Increment',
      //       backgroundColor: Colors.orangeAccent,
      //       child: const Icon(Icons.add),
      //     ),
      //   ),
      // ),
    );
  }

  void _getTime() {
    //in setState() UI才會更新
    setState(() {
      _timeString = getformatNow();
    });
  }


}