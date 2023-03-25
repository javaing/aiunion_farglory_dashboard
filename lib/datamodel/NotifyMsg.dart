// To parse this JSON data, do
//
//     final notifyMsg = notifyMsgFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'NotifyMsg.freezed.dart';
part 'NotifyMsg.g.dart';

NotifyMsg notifyMsgFromJson(String str) => NotifyMsg.fromJson(json.decode(str));
String notifyMsgToJson(NotifyMsg data) => json.encode(data);

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data);

@freezed
class NotifyMsg with _$NotifyMsg {
  const factory NotifyMsg({
    int? page,
    int? total,
    List<Result>? result,
    int? pageSize,
  }) = _NotifyMsg;

  factory NotifyMsg.fromJson(Map<String, dynamic> json) => _$NotifyMsgFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    String? photo,
    dynamic? faceId,
    dynamic? person,
    dynamic? identity,
    dynamic? serialNo,
    dynamic? cardSerialNo,
    dynamic? company,
    int? faceTypeId,
    dynamic? faceTypeName,
    double? similarity,
    double? temperature,
    int? capturedAt,
    int? deviceId,
    String? deviceName,
    String? categoryName,
    double? temperatureThreshold,
    String? background,
    String? deviceType,
    dynamic? title,
    dynamic? createdAt,
    dynamic? filePath,
    int? isFever,
    int? isStranger,
    int? isWhitelist,
    int? isBlacklist,
    int? isGuest,
    int? isVip,
    bool? noface,
    bool? deny,
    bool? fever,
    String? memo,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
