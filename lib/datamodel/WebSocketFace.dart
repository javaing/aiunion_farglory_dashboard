// To parse this JSON data, do
//
//     final webSocketFace = webSocketFaceFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

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
    int? endT_time,
    bool? enabled,
    bool? fever,
    int? last_update,
    String? photo_string,
  }) = _WebSocketFace;

  factory WebSocketFace.fromJson(Map<String, dynamic> json) => _$WebSocketFaceFromJson(json);
}
