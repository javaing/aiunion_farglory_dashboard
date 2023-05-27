// To parse this JSON data, do
//
//     final serverFaceType = serverFaceTypeFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'ServerFaceType.freezed.dart';
part 'ServerFaceType.g.dart';

ServerFaceType serverFaceTypeFromJson(String str) => ServerFaceType.fromJson(json.decode(str));

String serverFaceTypeToJson(ServerFaceType data) => json.encode(data.toJson());

@freezed
class ServerFaceType with _$ServerFaceType {
  const factory ServerFaceType({
    int? page,
    int? total,
    List<FaceType>? result,
    int? pageSize,
  }) = _ServerFaceType;

  factory ServerFaceType.fromJson(Map<String, dynamic> json) => _$ServerFaceTypeFromJson(json);
}

@freezed
class FaceType with _$FaceType {
  const factory FaceType({
    int? id,
    String? name,
    double? threshold,
    dynamic? description,
    int? faceCount,
    int? photoCount,
    bool? rtcEnabled,
    bool? resultDynamic,
  }) = _FaceType;

  factory FaceType.fromJson(Map<String, dynamic> json) => _$FaceTypeFromJson(json);
}
