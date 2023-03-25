// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotifyMsg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotifyMsg _$$_NotifyMsgFromJson(Map<String, dynamic> json) => _$_NotifyMsg(
      page: json['page'] as int?,
      total: json['total'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageSize: json['pageSize'] as int?,
    );

Map<String, dynamic> _$$_NotifyMsgToJson(_$_NotifyMsg instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total': instance.total,
      'result': instance.result,
      'pageSize': instance.pageSize,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      photo: json['photo'] as String?,
      faceId: json['faceId'],
      person: json['person'],
      identity: json['identity'],
      serialNo: json['serialNo'],
      cardSerialNo: json['cardSerialNo'],
      company: json['company'],
      faceTypeId: json['faceTypeId'] as int?,
      faceTypeName: json['faceTypeName'],
      similarity: (json['similarity'] as num?)?.toDouble(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      capturedAt: json['capturedAt'] as int?,
      deviceId: json['deviceId'] as int?,
      deviceName: json['deviceName'] as String?,
      categoryName: json['categoryName'] as String?,
      temperatureThreshold: (json['temperatureThreshold'] as num?)?.toDouble(),
      background: json['background'] as String?,
      deviceType: json['deviceType'] as String?,
      title: json['title'],
      createdAt: json['createdAt'],
      filePath: json['filePath'],
      isFever: json['isFever'] as int?,
      isStranger: json['isStranger'] as int?,
      isWhitelist: json['isWhitelist'] as int?,
      isBlacklist: json['isBlacklist'] as int?,
      isGuest: json['isGuest'] as int?,
      isVip: json['isVip'] as int?,
      noface: json['noface'] as bool?,
      deny: json['deny'] as bool?,
      fever: json['fever'] as bool?,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'photo': instance.photo,
      'faceId': instance.faceId,
      'person': instance.person,
      'identity': instance.identity,
      'serialNo': instance.serialNo,
      'cardSerialNo': instance.cardSerialNo,
      'company': instance.company,
      'faceTypeId': instance.faceTypeId,
      'faceTypeName': instance.faceTypeName,
      'similarity': instance.similarity,
      'temperature': instance.temperature,
      'capturedAt': instance.capturedAt,
      'deviceId': instance.deviceId,
      'deviceName': instance.deviceName,
      'categoryName': instance.categoryName,
      'temperatureThreshold': instance.temperatureThreshold,
      'background': instance.background,
      'deviceType': instance.deviceType,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'filePath': instance.filePath,
      'isFever': instance.isFever,
      'isStranger': instance.isStranger,
      'isWhitelist': instance.isWhitelist,
      'isBlacklist': instance.isBlacklist,
      'isGuest': instance.isGuest,
      'isVip': instance.isVip,
      'noface': instance.noface,
      'deny': instance.deny,
      'fever': instance.fever,
      'memo': instance.memo,
    };
