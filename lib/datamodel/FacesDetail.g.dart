// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FacesDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacesDetail _$$_FacesDetailFromJson(Map<String, dynamic> json) =>
    _$_FacesDetail(
      code: json['code'] as int?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      msg: json['msg'],
    );

Map<String, dynamic> _$$_FacesDetailToJson(_$_FacesDetail instance) =>
    <String, dynamic>{
      'code': instance.code,
      'result': instance.result,
      'msg': instance.msg,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      identity: json['identity'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      photo: json['photo'] as String?,
      passDevices: json['passDevices'] as String?,
      passCategories: json['passCategories'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      company: json['company'] as String?,
      title: json['title'] as String?,
      passStartedAt: json['passStartedAt'] as int?,
      passEndedAt: json['passEndedAt'] as int?,
      hostName: json['hostName'] as String?,
      hostTel: json['hostTel'] as String?,
      hostEngName: json['hostEngName'] as String?,
      hostDepartment: json['hostDepartment'] as String?,
      enabled: json['enabled'] as bool?,
      attendanceGroupId: json['attendanceGroupId'] as int?,
      customize: json['customize'] as String?,
      serialNo: json['serialNo'] as String?,
      cardSerialNo: json['cardSerialNo'] as String?,
      autoid: json['autoid'] as int?,
      person: json['person'] as String?,
      typeId: json['typeId'] as int?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'identity': instance.identity,
      'photos': instance.photos,
      'photo': instance.photo,
      'passDevices': instance.passDevices,
      'passCategories': instance.passCategories,
      'phone': instance.phone,
      'email': instance.email,
      'company': instance.company,
      'title': instance.title,
      'passStartedAt': instance.passStartedAt,
      'passEndedAt': instance.passEndedAt,
      'hostName': instance.hostName,
      'hostTel': instance.hostTel,
      'hostEngName': instance.hostEngName,
      'hostDepartment': instance.hostDepartment,
      'enabled': instance.enabled,
      'attendanceGroupId': instance.attendanceGroupId,
      'customize': instance.customize,
      'serialNo': instance.serialNo,
      'cardSerialNo': instance.cardSerialNo,
      'autoid': instance.autoid,
      'person': instance.person,
      'typeId': instance.typeId,
    };

_$_Photo _$$_PhotoFromJson(Map<String, dynamic> json) => _$_Photo(
      id: json['id'] as int?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$_PhotoToJson(_$_Photo instance) => <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
    };
