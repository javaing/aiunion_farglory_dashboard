// To parse this JSON data, do
//
//     final webSocketFace = webSocketFaceFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../util/Utils.dart';

part 'WebSocketFace.freezed.dart';
part 'WebSocketFace.g.dart';

WebSocketFace webSocketFaceFromJson(String str) => WebSocketFace.fromJson(json.decode(str));

String webSocketFaceToJson(WebSocketFace data) => json.encode(data.toJson());

@freezed
class WebSocketFace with _$WebSocketFace {
  const factory WebSocketFace({
    String? name,
    String? photo,
    String? type_id,
    String? identity,
    String? serialNo,
    String? cardSerialNo,
    String? device_id,
    String? temperature,
    int? face_id,
    int? start_time,
    int? end_time,
    bool? enabled,
    bool? fever,
    int? last_update,
    String? photo_string,
    String? snapshot_uri,
  }) = _WebSocketFace;

  // //Id	deviceId	faceId	faceTypeId	time
  // String toString() {
  //   return "\"${identity!}\",\"${device_id!}\",\"${face_id!}\",\"${type_id ?? ""}\",\"${formatDateTime(DateTime(start_time!))  }\"\n";
  // }

  factory WebSocketFace.fromJson(Map<String, dynamic> json) => _$WebSocketFaceFromJson(json);
}
