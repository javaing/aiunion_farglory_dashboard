// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SettingItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingData _$$_SettingDataFromJson(Map<String, dynamic> json) =>
    _$_SettingData(
      page: json['page'] as int?,
      total: json['total'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => SettingItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      PageSize: json['PageSize'] as int?,
    );

Map<String, dynamic> _$$_SettingDataToJson(_$_SettingData instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total': instance.total,
      'result': instance.result,
      'PageSize': instance.PageSize,
    };

_$_SettingItem _$$_SettingItemFromJson(Map<String, dynamic> json) =>
    _$_SettingItem(
      id: json['id'] as int?,
      resultVar: json['resultVar'] as String?,
      val: json['val'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$$_SettingItemToJson(_$_SettingItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resultVar': instance.resultVar,
      'val': instance.val,
      'type': instance.type,
      'name': instance.name,
      'memo': instance.memo,
    };
