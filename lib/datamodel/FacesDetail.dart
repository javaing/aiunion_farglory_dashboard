// To parse this JSON data, do
//
//     final facesDetail = facesDetailFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'FacesDetail.freezed.dart';
part 'FacesDetail.g.dart';

FacesDetail facesDetailFromJson(String str) => FacesDetail.fromJson(json.decode(str));

String facesDetailToJson(FacesDetail data) => json.encode(data.toJson());

@freezed
class FacesDetail with _$FacesDetail {
  const factory FacesDetail({
    int? code,
    Result? result,
    dynamic? msg,
  }) = _FacesDetail;

  factory FacesDetail.fromJson(Map<String, dynamic> json) => _$FacesDetailFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    String? identity,
    List<Photo>? photos,
    String? photo,
    String? passDevices,
    String? passCategories,
    String? phone,
    String? email,
    String? company,
    String? title,
    int? passStartedAt,
    int? passEndedAt,
    String? hostName,
    String? hostTel,
    String? hostEngName,
    String? hostDepartment,
    bool? enabled,
    int? attendanceGroupId,
    String? customize,
    String? serialNo,
    String? cardSerialNo,
    int? autoid,
    String? person,
    int? typeId,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Photo with _$Photo {
  const factory Photo({
    int? id,
    String? photo,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
