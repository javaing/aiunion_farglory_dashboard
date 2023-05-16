// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AirCondition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AirCondition _$$_AirConditionFromJson(Map<String, dynamic> json) =>
    _$_AirCondition(
      fields: (json['fields'] as List<dynamic>?)
          ?.map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceId: json['resourceId'] as String?,
      extras: json['extras'] == null
          ? null
          : Extras.fromJson(json['extras'] as Map<String, dynamic>),
      includeTotal: json['includeTotal'] as bool?,
      total: json['total'] as String?,
      resourceFormat: json['resourceFormat'] as String?,
      limit: json['limit'] as String?,
      offset: json['offset'] as String?,
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      records: (json['records'] as List<dynamic>?)
          ?.map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AirConditionToJson(_$_AirCondition instance) =>
    <String, dynamic>{
      'fields': instance.fields,
      'resourceId': instance.resourceId,
      'extras': instance.extras,
      'includeTotal': instance.includeTotal,
      'total': instance.total,
      'resourceFormat': instance.resourceFormat,
      'limit': instance.limit,
      'offset': instance.offset,
      'links': instance.links,
      'records': instance.records,
    };

_$_Extras _$$_ExtrasFromJson(Map<String, dynamic> json) => _$_Extras(
      apiKey: json['apiKey'] as String?,
    );

Map<String, dynamic> _$$_ExtrasToJson(_$_Extras instance) => <String, dynamic>{
      'apiKey': instance.apiKey,
    };

_$_Field _$$_FieldFromJson(Map<String, dynamic> json) => _$_Field(
      id: json['id'] as String?,
      type: json['type'] as String?,
      info: json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FieldToJson(_$_Field instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'info': instance.info,
    };

_$_Info _$$_InfoFromJson(Map<String, dynamic> json) => _$_Info(
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$_InfoToJson(_$_Info instance) => <String, dynamic>{
      'label': instance.label,
    };

_$_Links _$$_LinksFromJson(Map<String, dynamic> json) => _$_Links(
      start: json['start'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$$_LinksToJson(_$_Links instance) => <String, dynamic>{
      'start': instance.start,
      'next': instance.next,
    };

_$_Record _$$_RecordFromJson(Map<String, dynamic> json) => _$_Record(
      sitename: json['sitename'] as String?,
      county: json['county'] as String?,
      aqi: json['aqi'] as String?,
      pollutant: json['pollutant'] as String?,
      status: json['status'] as String?,
      so2: json['so2'] as String?,
      co: json['co'] as String?,
      o3: json['o3'] as String?,
      o38Hr: json['o38Hr'] as String?,
      pm10: json['pm10'] as String?,
      pm25: json['pm25'] as String?,
      no2: json['no2'] as String?,
      nox: json['nox'] as String?,
      no: json['no'] as String?,
      wind_speed: json['wind_speed'] as String?,
      wind_direc: json['wind_direc'] as String?,
      publishtime: json['publishtime'] as String?,
      co8Hr: json['co8Hr'] as String?,
      pm25_avg: json['pm25_avg'] as String?,
      pm10Avg: json['pm10Avg'] as String?,
      so2Avg: json['so2Avg'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      siteid: json['siteid'] as String?,
    );

Map<String, dynamic> _$$_RecordToJson(_$_Record instance) => <String, dynamic>{
      'sitename': instance.sitename,
      'county': instance.county,
      'aqi': instance.aqi,
      'pollutant': instance.pollutant,
      'status': instance.status,
      'so2': instance.so2,
      'co': instance.co,
      'o3': instance.o3,
      'o38Hr': instance.o38Hr,
      'pm10': instance.pm10,
      'pm25': instance.pm25,
      'no2': instance.no2,
      'nox': instance.nox,
      'no': instance.no,
      'wind_speed': instance.wind_speed,
      'wind_direc': instance.wind_direc,
      'publishtime': instance.publishtime,
      'co8Hr': instance.co8Hr,
      'pm25_avg': instance.pm25_avg,
      'pm10Avg': instance.pm10Avg,
      'so2Avg': instance.so2Avg,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'siteid': instance.siteid,
    };
