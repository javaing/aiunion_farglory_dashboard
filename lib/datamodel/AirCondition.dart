// To parse this JSON data, do
//
//     final airCondition = airConditionFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'AirCondition.freezed.dart';
part 'AirCondition.g.dart';

AirCondition airConditionFromJson(String str) => AirCondition.fromJson(json.decode(str));

String airConditionToJson(AirCondition data) => json.encode(data.toJson());

@freezed
class AirCondition with _$AirCondition {
  const factory AirCondition({
    List<Field>? fields,
    String? resourceId,
    Extras? extras,
    bool? includeTotal,
    String? total,
    String? resourceFormat,
    String? limit,
    String? offset,
    Links? links,
    List<Record>? records,
  }) = _AirCondition;

  factory AirCondition.fromJson(Map<String, dynamic> json) => _$AirConditionFromJson(json);
}

@freezed
class Extras with _$Extras {
  const factory Extras({
    String? apiKey,
  }) = _Extras;

  factory Extras.fromJson(Map<String, dynamic> json) => _$ExtrasFromJson(json);
}

@freezed
class Field with _$Field {
  const factory Field({
    String? id,
    String? type,
    Info? info,
  }) = _Field;

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
}

@freezed
class Info with _$Info {
  const factory Info({
    String? label,
  }) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}

// enum Type { TEXT }
//
// final typeValues = EnumValues({
//   "text": Type.TEXT
// });

@freezed
class Links with _$Links {
  const factory Links({
    String? start,
    String? next,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class Record with _$Record {
  const factory Record({
    String? sitename,
    String? county,
    String? aqi,
    String? pollutant,
    String? status,
    String? so2,
    String? co,
    String? o3,
    String? o38Hr,
    String? pm10,
    String? pm25,
    String? no2,
    String? nox,
    String? no,
    String? wind_speed,
    String? wind_direc,
    String? publishtime,
    String? co8Hr,
    String? pm25_avg,
    String? pm10Avg,
    String? so2Avg,
    String? longitude,
    String? latitude,
    String? siteid,
  }) = _Record;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
