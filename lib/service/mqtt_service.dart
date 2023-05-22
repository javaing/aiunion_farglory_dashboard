
import 'dart:typed_data';

import 'package:far_glory_construction_dashboard/service/AbstractService.dart';

import '../Constants.dart';
import '../datamodel/FarGloryMsg.dart';
import '../datamodel/Profile.dart';
import '../util/MqttUtil.dart';
import '../viewmodel/TableScreenViewModel.dart';
import 'notification_service.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MQTTService extends AbstractService {
  NotificationService notificationService = NotificationService();
  late void Function(FarGloryMsg) callback;

  void setCallback(cb) {
    callback = cb;
  }

  @override
  Future<void> init() async {
    print('----------------------mqqt init------------------------');
    initMQTT();
    notificationService.initNotifications();
  }

  Future<void> initMQTT() async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    //连接
    MqttUtil.getInstance()?.connect(MQTT_SERVER, MQTT_PORT, deviceId ?? DateTime
        .now()
        .microsecondsSinceEpoch
        .toString());
    //MqttUtil.getInstance()?.subscribeMessage("hello/world");
    MqttUtil.getInstance()?.updates()!.listen((
        List<MqttReceivedMessage<MqttMessage>> mqttMessageList) async {
      print('----------------------mqqt 消息监听------------------------');
      final publishMessage = mqttMessageList[0].payload as MqttPublishMessage;
      final jsonStr = MqttPublishPayload.bytesToStringAsString(
          publishMessage.payload.message);

      final notifyMsg = farGloryMsgFromJson(jsonStr);
      //final action = notifyMsg.action ?? "action";
      // final imageUrl =  HttpService.baseUrl + (firstMsg?.photo ?? "");

      print('art mqtt =:${jsonStr}');
      doAction(notifyMsg);
    });
  }

  Future<void> doAction(FarGloryMsg msg) async {
    //showMsg(context, action);
    //print('art 0320 ${msg.action!}');
    if(callback!=null) {
      callback(msg);
    }
    if(msg.action=="helmet")
      notificationService.showNotification(1, 2);
  }
}