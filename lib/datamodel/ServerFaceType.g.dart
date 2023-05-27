// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServerFaceType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServerFaceType _$$_ServerFaceTypeFromJson(Map<String, dynamic> json) =>
    _$_ServerFaceType(
      page: json['page'] as int?,
      total: json['total'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => FaceType.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageSize: json['pageSize'] as int?,
    );

Map<String, dynamic> _$$_ServerFaceTypeToJson(_$_ServerFaceType instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total': instance.total,
      'result': instance.result,
      'pageSize': instance.pageSize,
    };

_$_FaceType _$$_FaceTypeFromJson(Map<String, dynamic> json) => _$_FaceType(
      id: json['id'] as int?,
      name: json['name'] as String?,
      threshold: (json['threshold'] as num?)?.toDouble(),
      description: json['description'],
      faceCount: json['faceCount'] as int?,
      photoCount: json['photoCount'] as int?,
      rtcEnabled: json['rtcEnabled'] as bool?,
      resultDynamic: json['resultDynamic'] as bool?,
    );

Map<String, dynamic> _$$_FaceTypeToJson(_$_FaceType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'threshold': instance.threshold,
      'description': instance.description,
      'faceCount': instance.faceCount,
      'photoCount': instance.photoCount,
      'rtcEnabled': instance.rtcEnabled,
      'resultDynamic': instance.resultDynamic,
    };
