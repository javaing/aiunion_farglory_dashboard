// To parse this JSON data, do
//
//     final weather36Hr = weather36HrFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'Weather36Hr.freezed.dart';
part 'Weather36Hr.g.dart';

Weather36Hr weather36HrFromJson(String str) => Weather36Hr.fromJson(json.decode(str));

String weather36HrToJson(Weather36Hr data) => json.encode(data.toJson());

@freezed
class Weather36Hr with _$Weather36Hr {
  const factory Weather36Hr({
    String? success,
    //WResult? result,
    Records? records,
  }) = _Weather36Hr;

  factory Weather36Hr.fromJson(Map<String, dynamic> json) => _$Weather36HrFromJson(json);
}

@freezed
class Records with _$Records {
  const factory Records({
    List<RecordsLocation>? locations,
  }) = _Records;

  factory Records.fromJson(Map<String, dynamic> json) => _$RecordsFromJson(json);
}

@freezed
class RecordsLocation with _$RecordsLocation {
  const factory RecordsLocation({
    String? datasetDescription,
    String? locationsName,
    String? dataid,
    List<LocationLocation>? location,
  }) = _RecordsLocation;

  factory RecordsLocation.fromJson(Map<String, dynamic> json) => _$RecordsLocationFromJson(json);
}

@freezed
class LocationLocation with _$LocationLocation {
  const factory LocationLocation({
    String? locationName,
    String? geocode,
    String? lat,
    String? lon,
    List<WeatherElement>? weatherElement,
  }) = _LocationLocation;

  factory LocationLocation.fromJson(Map<String, dynamic> json) => _$LocationLocationFromJson(json);
}

@freezed
class WeatherElement with _$WeatherElement {
  const factory WeatherElement({
    String? elementName,
    String? description,
    List<Time>? time,
  }) = _WeatherElement;

  factory WeatherElement.fromJson(Map<String, dynamic> json) => _$WeatherElementFromJson(json);
}

@freezed
class Time with _$Time {
  const factory Time({
    DateTime? startTime,
    DateTime? endTime,
    List<ElementValue>? elementValue,
    DateTime? dataTime,
  }) = _Time;

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
}

@freezed
class ElementValue with _$ElementValue {
  const factory ElementValue({
    String? value,
    String? measures,
  }) = _ElementValue;

  factory ElementValue.fromJson(Map<String, dynamic> json) => _$ElementValueFromJson(json);
}

// @freezed
// class WResult with _$Result {
//   const factory WResult({
//     String? resourceId,
//     List<Field>? fields,
//   }) = _WResult;
//
//   factory WResult.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
// }

@freezed
class Field with _$Field {
  const factory Field({
    String? id,
    Type? type,
  }) = _Field;

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
}

enum Type { STRING, DOUBLE, TIMESTAMP }

final typeValues = EnumValues({
  "Double": Type.DOUBLE,
  "String": Type.STRING,
  "Timestamp": Type.TIMESTAMP
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
