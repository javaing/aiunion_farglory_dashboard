// To parse this JSON data, do
//
//     final farGloryMsg = farGloryMsgFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'FarGloryMsg.freezed.dart';
part 'FarGloryMsg.g.dart';

FarGloryMsg farGloryMsgFromJson(String str) => FarGloryMsg.fromJson(json.decode(str));

String farGloryMsgToJson(FarGloryMsg data) => json.encode(data.toJson());

@freezed
class FarGloryMsg with _$FarGloryMsg {
  const factory FarGloryMsg({
    String? id,
    String? action,
    String? company,
    String? worktype,
    String? imgUrl,
  }) = _FarGloryMsg;

  factory FarGloryMsg.fromJson(Map<String, dynamic> json) => _$FarGloryMsgFromJson(json);
}
