// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Weather36Hr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather36Hr _$$_Weather36HrFromJson(Map<String, dynamic> json) =>
    _$_Weather36Hr(
      success: json['success'] as String?,
      records: json['records'] == null
          ? null
          : Records.fromJson(json['records'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_Weather36HrToJson(_$_Weather36Hr instance) =>
    <String, dynamic>{
      'success': instance.success,
      'records': instance.records,
    };

_$_Records _$$_RecordsFromJson(Map<String, dynamic> json) => _$_Records(
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => RecordsLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecordsToJson(_$_Records instance) =>
    <String, dynamic>{
      'locations': instance.locations,
    };

_$_RecordsLocation _$$_RecordsLocationFromJson(Map<String, dynamic> json) =>
    _$_RecordsLocation(
      datasetDescription: json['datasetDescription'] as String?,
      locationsName: json['locationsName'] as String?,
      dataid: json['dataid'] as String?,
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => LocationLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecordsLocationToJson(_$_RecordsLocation instance) =>
    <String, dynamic>{
      'datasetDescription': instance.datasetDescription,
      'locationsName': instance.locationsName,
      'dataid': instance.dataid,
      'location': instance.location,
    };

_$_LocationLocation _$$_LocationLocationFromJson(Map<String, dynamic> json) =>
    _$_LocationLocation(
      locationName: json['locationName'] as String?,
      geocode: json['geocode'] as String?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      weatherElement: (json['weatherElement'] as List<dynamic>?)
          ?.map((e) => WeatherElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LocationLocationToJson(_$_LocationLocation instance) =>
    <String, dynamic>{
      'locationName': instance.locationName,
      'geocode': instance.geocode,
      'lat': instance.lat,
      'lon': instance.lon,
      'weatherElement': instance.weatherElement,
    };

_$_WeatherElement _$$_WeatherElementFromJson(Map<String, dynamic> json) =>
    _$_WeatherElement(
      elementName: json['elementName'] as String?,
      description: json['description'] as String?,
      time: (json['time'] as List<dynamic>?)
          ?.map((e) => Time.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WeatherElementToJson(_$_WeatherElement instance) =>
    <String, dynamic>{
      'elementName': instance.elementName,
      'description': instance.description,
      'time': instance.time,
    };

_$_Time _$$_TimeFromJson(Map<String, dynamic> json) => _$_Time(
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      elementValue: (json['elementValue'] as List<dynamic>?)
          ?.map((e) => ElementValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataTime: json['dataTime'] == null
          ? null
          : DateTime.parse(json['dataTime'] as String),
    );

Map<String, dynamic> _$$_TimeToJson(_$_Time instance) => <String, dynamic>{
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'elementValue': instance.elementValue,
      'dataTime': instance.dataTime?.toIso8601String(),
    };

_$_ElementValue _$$_ElementValueFromJson(Map<String, dynamic> json) =>
    _$_ElementValue(
      value: json['value'] as String?,
      measures: json['measures'] as String?,
    );

Map<String, dynamic> _$$_ElementValueToJson(_$_ElementValue instance) =>
    <String, dynamic>{
      'value': instance.value,
      'measures': instance.measures,
    };

_$_Field _$$_FieldFromJson(Map<String, dynamic> json) => _$_Field(
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$TypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_FieldToJson(_$_Field instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$TypeEnumMap[instance.type],
    };

const _$TypeEnumMap = {
  Type.STRING: 'STRING',
  Type.DOUBLE: 'DOUBLE',
  Type.TIMESTAMP: 'TIMESTAMP',
};
