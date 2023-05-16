// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WebSocketFace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebSocketFace _$$_WebSocketFaceFromJson(Map<String, dynamic> json) =>
    _$_WebSocketFace(
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      type_id: json['type_id'] as String?,
      identity: json['identity'] as String?,
      serialNo: json['serialNo'] as String?,
      cardSerialNo: json['cardSerialNo'] as String?,
      device_id: json['device_id'] as String?,
      temperature: json['temperature'] as String?,
      face_id: json['face_id'] as int?,
      start_time: json['start_time'] as int?,
      endT_time: json['endT_time'] as int?,
      enabled: json['enabled'] as bool?,
      fever: json['fever'] as bool?,
      last_update: json['last_update'] as int?,
      photo_string: json['photo_string'] as String?,
      snapshot_uri: json['snapshot_uri'] as String?,
    );

Map<String, dynamic> _$$_WebSocketFaceToJson(_$_WebSocketFace instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photo': instance.photo,
      'type_id': instance.type_id,
      'identity': instance.identity,
      'serialNo': instance.serialNo,
      'cardSerialNo': instance.cardSerialNo,
      'device_id': instance.device_id,
      'temperature': instance.temperature,
      'face_id': instance.face_id,
      'start_time': instance.start_time,
      'endT_time': instance.endT_time,
      'enabled': instance.enabled,
      'fever': instance.fever,
      'last_update': instance.last_update,
      'photo_string': instance.photo_string,
      'snapshot_uri': instance.snapshot_uri,
    };
