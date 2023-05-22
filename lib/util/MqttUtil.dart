import 'dart:async';
import 'dart:convert';
import 'package:far_glory_construction_dashboard/Constants.dart';
import 'package:mqtt_client/mqtt_client.dart'; // Mqtt插件
import 'package:mqtt_client/mqtt_server_client.dart'; // Mqtt插件
import 'package:typed_data/typed_buffers.dart';


typedef ConnectedCallback = void Function();

class MqttUtil {
  MqttQos qos = MqttQos.atLeastOnce;
  late MqttServerClient mqttClient;
  static MqttUtil? _instance;

  static MqttUtil? getInstance() {
    _instance ??= MqttUtil();
    return _instance;
  }

  /*
  * 链接服务器
  * */
  Future<MqttClientConnectionStatus?> connect(String server, int port,
      String clientIdentifier, {bool isSsl = false}) {
    mqttClient = MqttServerClient.withPort(server, clientIdentifier, port);
    mqttClient.onConnected = onConnected;
    mqttClient.onSubscribed = _onSubscribed;
    mqttClient.onSubscribeFail = _onSubscribeFail;
    mqttClient.onUnsubscribed = _onUnSubscribed;
    mqttClient.pongCallback = pong; //收到 PING 响应回调
    mqttClient.setProtocolV311();
    mqttClient.logging(on: false);
    if (isSsl) {
      mqttClient.secure = true;
      mqttClient.onBadCertificate = (dynamic a) => true;
    }
    _log("_正在连接中...");
    return mqttClient.connect();
  }

  /*
  * 发送数据
  * */
  int publishMessage(String pTopic, String msg) {
    _log("_发送数据-topic:$pTopic,playLoad:$msg");
    Uint8Buffer uint8buffer = Uint8Buffer();
    var codeUnits = msg.codeUnits;
    uint8buffer.addAll(codeUnits);
    return mqttClient.publishMessage(pTopic, qos, uint8buffer, retain: false);
  }

  /*
  *发送数据
  * */
  int publishRawMessage(String pTopic, List<int> list) {
    _log("_发送数据-topic:$pTopic,playLoad:$list");
    Uint8Buffer uint8buffer = Uint8Buffer();
    //    var codeUnits = msg.codeUnits;
    uint8buffer.addAll(list);
    return mqttClient.publishMessage(pTopic, qos, uint8buffer, retain: false);
  }

  // TODO: 订阅主题
  Subscription? subscribeMessage(String subtopic) {
    return mqttClient.subscribe(subtopic, qos);
  }

  // TODO: 取消订阅
  void unsubscribeMessage(String? unSubtopic) {
    mqttClient.unsubscribe(unSubtopic!);
  }

  // TODO: MQTT状态获取
  MqttClientConnectionStatus? getMqttStatus() {
    return mqttClient.connectionStatus;
  }

  // TODO: 监听MQTT接到的消息
  Stream<List<MqttReceivedMessage<MqttMessage>>>? updates() {
    _log("_监听成功!");
    return mqttClient.updates;
  }

  // TODO: 链接成功
  onConnected() {
    //    mqttClient.onConnected = callback;
    _log("链接成功");
    subscribeMessage(MQTT_TOPIC);
  }

  // TODO: 断开链接
  disconnect() {
    mqttClient.disconnect();
    _log("断开链接");
  }

  // TODO: 连接断开回调
  onDisConnected(ConnectedCallback callback) {
    mqttClient.onDisconnected = callback;
  }

  // TODO: _订阅主题成功
  _onSubscribed(String topic) {
    _log("_订阅主题成功---topic:$topic");
  }

  // TODO: _取消订阅主题成功
  _onUnSubscribed(String? topic) {
    _log("_取消订阅主题成功---topic:$topic");
  }

  // TODO: 订阅失败
  _onSubscribeFail(String topic) {
    _log("_onSubscribeFail");
  }

  // TODO: 收到 PING 响应
  void pong() {
    print('收到 PING 响应');
  }

  _log(String msg) {
    print("MQTT-->$msg");
  }
}