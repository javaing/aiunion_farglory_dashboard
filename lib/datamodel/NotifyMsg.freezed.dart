// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'NotifyMsg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotifyMsg _$NotifyMsgFromJson(Map<String, dynamic> json) {
  return _NotifyMsg.fromJson(json);
}

/// @nodoc
mixin _$NotifyMsg {
  int? get page => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  List<Result>? get result => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotifyMsgCopyWith<NotifyMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotifyMsgCopyWith<$Res> {
  factory $NotifyMsgCopyWith(NotifyMsg value, $Res Function(NotifyMsg) then) =
      _$NotifyMsgCopyWithImpl<$Res, NotifyMsg>;
  @useResult
  $Res call({int? page, int? total, List<Result>? result, int? pageSize});
}

/// @nodoc
class _$NotifyMsgCopyWithImpl<$Res, $Val extends NotifyMsg>
    implements $NotifyMsgCopyWith<$Res> {
  _$NotifyMsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? total = freezed,
    Object? result = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotifyMsgCopyWith<$Res> implements $NotifyMsgCopyWith<$Res> {
  factory _$$_NotifyMsgCopyWith(
          _$_NotifyMsg value, $Res Function(_$_NotifyMsg) then) =
      __$$_NotifyMsgCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? page, int? total, List<Result>? result, int? pageSize});
}

/// @nodoc
class __$$_NotifyMsgCopyWithImpl<$Res>
    extends _$NotifyMsgCopyWithImpl<$Res, _$_NotifyMsg>
    implements _$$_NotifyMsgCopyWith<$Res> {
  __$$_NotifyMsgCopyWithImpl(
      _$_NotifyMsg _value, $Res Function(_$_NotifyMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? total = freezed,
    Object? result = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_$_NotifyMsg(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotifyMsg implements _NotifyMsg {
  const _$_NotifyMsg(
      {this.page, this.total, final List<Result>? result, this.pageSize})
      : _result = result;

  factory _$_NotifyMsg.fromJson(Map<String, dynamic> json) =>
      _$$_NotifyMsgFromJson(json);

  @override
  final int? page;
  @override
  final int? total;
  final List<Result>? _result;
  @override
  List<Result>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? pageSize;

  @override
  String toString() {
    return 'NotifyMsg(page: $page, total: $total, result: $result, pageSize: $pageSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotifyMsg &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, total,
      const DeepCollectionEquality().hash(_result), pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotifyMsgCopyWith<_$_NotifyMsg> get copyWith =>
      __$$_NotifyMsgCopyWithImpl<_$_NotifyMsg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotifyMsgToJson(
      this,
    );
  }
}

abstract class _NotifyMsg implements NotifyMsg {
  const factory _NotifyMsg(
      {final int? page,
      final int? total,
      final List<Result>? result,
      final int? pageSize}) = _$_NotifyMsg;

  factory _NotifyMsg.fromJson(Map<String, dynamic> json) =
      _$_NotifyMsg.fromJson;

  @override
  int? get page;
  @override
  int? get total;
  @override
  List<Result>? get result;
  @override
  int? get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$_NotifyMsgCopyWith<_$_NotifyMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  String? get photo => throw _privateConstructorUsedError;
  dynamic? get faceId => throw _privateConstructorUsedError;
  dynamic? get person => throw _privateConstructorUsedError;
  dynamic? get identity => throw _privateConstructorUsedError;
  dynamic? get serialNo => throw _privateConstructorUsedError;
  dynamic? get cardSerialNo => throw _privateConstructorUsedError;
  dynamic? get company => throw _privateConstructorUsedError;
  int? get faceTypeId => throw _privateConstructorUsedError;
  dynamic? get faceTypeName => throw _privateConstructorUsedError;
  double? get similarity => throw _privateConstructorUsedError;
  double? get temperature => throw _privateConstructorUsedError;
  int? get capturedAt => throw _privateConstructorUsedError;
  int? get deviceId => throw _privateConstructorUsedError;
  String? get deviceName => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  double? get temperatureThreshold => throw _privateConstructorUsedError;
  String? get background => throw _privateConstructorUsedError;
  String? get deviceType => throw _privateConstructorUsedError;
  dynamic? get title => throw _privateConstructorUsedError;
  dynamic? get createdAt => throw _privateConstructorUsedError;
  dynamic? get filePath => throw _privateConstructorUsedError;
  int? get isFever => throw _privateConstructorUsedError;
  int? get isStranger => throw _privateConstructorUsedError;
  int? get isWhitelist => throw _privateConstructorUsedError;
  int? get isBlacklist => throw _privateConstructorUsedError;
  int? get isGuest => throw _privateConstructorUsedError;
  int? get isVip => throw _privateConstructorUsedError;
  bool? get noface => throw _privateConstructorUsedError;
  bool? get deny => throw _privateConstructorUsedError;
  bool? get fever => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call(
      {String? photo,
      dynamic? faceId,
      dynamic? person,
      dynamic? identity,
      dynamic? serialNo,
      dynamic? cardSerialNo,
      dynamic? company,
      int? faceTypeId,
      dynamic? faceTypeName,
      double? similarity,
      double? temperature,
      int? capturedAt,
      int? deviceId,
      String? deviceName,
      String? categoryName,
      double? temperatureThreshold,
      String? background,
      String? deviceType,
      dynamic? title,
      dynamic? createdAt,
      dynamic? filePath,
      int? isFever,
      int? isStranger,
      int? isWhitelist,
      int? isBlacklist,
      int? isGuest,
      int? isVip,
      bool? noface,
      bool? deny,
      bool? fever,
      String? memo});
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo = freezed,
    Object? faceId = freezed,
    Object? person = freezed,
    Object? identity = freezed,
    Object? serialNo = freezed,
    Object? cardSerialNo = freezed,
    Object? company = freezed,
    Object? faceTypeId = freezed,
    Object? faceTypeName = freezed,
    Object? similarity = freezed,
    Object? temperature = freezed,
    Object? capturedAt = freezed,
    Object? deviceId = freezed,
    Object? deviceName = freezed,
    Object? categoryName = freezed,
    Object? temperatureThreshold = freezed,
    Object? background = freezed,
    Object? deviceType = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? filePath = freezed,
    Object? isFever = freezed,
    Object? isStranger = freezed,
    Object? isWhitelist = freezed,
    Object? isBlacklist = freezed,
    Object? isGuest = freezed,
    Object? isVip = freezed,
    Object? noface = freezed,
    Object? deny = freezed,
    Object? fever = freezed,
    Object? memo = freezed,
  }) {
    return _then(_value.copyWith(
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      faceId: freezed == faceId
          ? _value.faceId
          : faceId // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      person: freezed == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      identity: freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      serialNo: freezed == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      cardSerialNo: freezed == cardSerialNo
          ? _value.cardSerialNo
          : cardSerialNo // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      faceTypeId: freezed == faceTypeId
          ? _value.faceTypeId
          : faceTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      faceTypeName: freezed == faceTypeName
          ? _value.faceTypeName
          : faceTypeName // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      similarity: freezed == similarity
          ? _value.similarity
          : similarity // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      capturedAt: freezed == capturedAt
          ? _value.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      temperatureThreshold: freezed == temperatureThreshold
          ? _value.temperatureThreshold
          : temperatureThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      isFever: freezed == isFever
          ? _value.isFever
          : isFever // ignore: cast_nullable_to_non_nullable
              as int?,
      isStranger: freezed == isStranger
          ? _value.isStranger
          : isStranger // ignore: cast_nullable_to_non_nullable
              as int?,
      isWhitelist: freezed == isWhitelist
          ? _value.isWhitelist
          : isWhitelist // ignore: cast_nullable_to_non_nullable
              as int?,
      isBlacklist: freezed == isBlacklist
          ? _value.isBlacklist
          : isBlacklist // ignore: cast_nullable_to_non_nullable
              as int?,
      isGuest: freezed == isGuest
          ? _value.isGuest
          : isGuest // ignore: cast_nullable_to_non_nullable
              as int?,
      isVip: freezed == isVip
          ? _value.isVip
          : isVip // ignore: cast_nullable_to_non_nullable
              as int?,
      noface: freezed == noface
          ? _value.noface
          : noface // ignore: cast_nullable_to_non_nullable
              as bool?,
      deny: freezed == deny
          ? _value.deny
          : deny // ignore: cast_nullable_to_non_nullable
              as bool?,
      fever: freezed == fever
          ? _value.fever
          : fever // ignore: cast_nullable_to_non_nullable
              as bool?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$_ResultCopyWith(_$_Result value, $Res Function(_$_Result) then) =
      __$$_ResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? photo,
      dynamic? faceId,
      dynamic? person,
      dynamic? identity,
      dynamic? serialNo,
      dynamic? cardSerialNo,
      dynamic? company,
      int? faceTypeId,
      dynamic? faceTypeName,
      double? similarity,
      double? temperature,
      int? capturedAt,
      int? deviceId,
      String? deviceName,
      String? categoryName,
      double? temperatureThreshold,
      String? background,
      String? deviceType,
      dynamic? title,
      dynamic? createdAt,
      dynamic? filePath,
      int? isFever,
      int? isStranger,
      int? isWhitelist,
      int? isBlacklist,
      int? isGuest,
      int? isVip,
      bool? noface,
      bool? deny,
      bool? fever,
      String? memo});
}

/// @nodoc
class __$$_ResultCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$_Result>
    implements _$$_ResultCopyWith<$Res> {
  __$$_ResultCopyWithImpl(_$_Result _value, $Res Function(_$_Result) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo = freezed,
    Object? faceId = freezed,
    Object? person = freezed,
    Object? identity = freezed,
    Object? serialNo = freezed,
    Object? cardSerialNo = freezed,
    Object? company = freezed,
    Object? faceTypeId = freezed,
    Object? faceTypeName = freezed,
    Object? similarity = freezed,
    Object? temperature = freezed,
    Object? capturedAt = freezed,
    Object? deviceId = freezed,
    Object? deviceName = freezed,
    Object? categoryName = freezed,
    Object? temperatureThreshold = freezed,
    Object? background = freezed,
    Object? deviceType = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? filePath = freezed,
    Object? isFever = freezed,
    Object? isStranger = freezed,
    Object? isWhitelist = freezed,
    Object? isBlacklist = freezed,
    Object? isGuest = freezed,
    Object? isVip = freezed,
    Object? noface = freezed,
    Object? deny = freezed,
    Object? fever = freezed,
    Object? memo = freezed,
  }) {
    return _then(_$_Result(
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      faceId: freezed == faceId
          ? _value.faceId
          : faceId // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      person: freezed == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      identity: freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      serialNo: freezed == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      cardSerialNo: freezed == cardSerialNo
          ? _value.cardSerialNo
          : cardSerialNo // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      faceTypeId: freezed == faceTypeId
          ? _value.faceTypeId
          : faceTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      faceTypeName: freezed == faceTypeName
          ? _value.faceTypeName
          : faceTypeName // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      similarity: freezed == similarity
          ? _value.similarity
          : similarity // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      capturedAt: freezed == capturedAt
          ? _value.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      temperatureThreshold: freezed == temperatureThreshold
          ? _value.temperatureThreshold
          : temperatureThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      isFever: freezed == isFever
          ? _value.isFever
          : isFever // ignore: cast_nullable_to_non_nullable
              as int?,
      isStranger: freezed == isStranger
          ? _value.isStranger
          : isStranger // ignore: cast_nullable_to_non_nullable
              as int?,
      isWhitelist: freezed == isWhitelist
          ? _value.isWhitelist
          : isWhitelist // ignore: cast_nullable_to_non_nullable
              as int?,
      isBlacklist: freezed == isBlacklist
          ? _value.isBlacklist
          : isBlacklist // ignore: cast_nullable_to_non_nullable
              as int?,
      isGuest: freezed == isGuest
          ? _value.isGuest
          : isGuest // ignore: cast_nullable_to_non_nullable
              as int?,
      isVip: freezed == isVip
          ? _value.isVip
          : isVip // ignore: cast_nullable_to_non_nullable
              as int?,
      noface: freezed == noface
          ? _value.noface
          : noface // ignore: cast_nullable_to_non_nullable
              as bool?,
      deny: freezed == deny
          ? _value.deny
          : deny // ignore: cast_nullable_to_non_nullable
              as bool?,
      fever: freezed == fever
          ? _value.fever
          : fever // ignore: cast_nullable_to_non_nullable
              as bool?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result(
      {this.photo,
      this.faceId,
      this.person,
      this.identity,
      this.serialNo,
      this.cardSerialNo,
      this.company,
      this.faceTypeId,
      this.faceTypeName,
      this.similarity,
      this.temperature,
      this.capturedAt,
      this.deviceId,
      this.deviceName,
      this.categoryName,
      this.temperatureThreshold,
      this.background,
      this.deviceType,
      this.title,
      this.createdAt,
      this.filePath,
      this.isFever,
      this.isStranger,
      this.isWhitelist,
      this.isBlacklist,
      this.isGuest,
      this.isVip,
      this.noface,
      this.deny,
      this.fever,
      this.memo});

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final String? photo;
  @override
  final dynamic? faceId;
  @override
  final dynamic? person;
  @override
  final dynamic? identity;
  @override
  final dynamic? serialNo;
  @override
  final dynamic? cardSerialNo;
  @override
  final dynamic? company;
  @override
  final int? faceTypeId;
  @override
  final dynamic? faceTypeName;
  @override
  final double? similarity;
  @override
  final double? temperature;
  @override
  final int? capturedAt;
  @override
  final int? deviceId;
  @override
  final String? deviceName;
  @override
  final String? categoryName;
  @override
  final double? temperatureThreshold;
  @override
  final String? background;
  @override
  final String? deviceType;
  @override
  final dynamic? title;
  @override
  final dynamic? createdAt;
  @override
  final dynamic? filePath;
  @override
  final int? isFever;
  @override
  final int? isStranger;
  @override
  final int? isWhitelist;
  @override
  final int? isBlacklist;
  @override
  final int? isGuest;
  @override
  final int? isVip;
  @override
  final bool? noface;
  @override
  final bool? deny;
  @override
  final bool? fever;
  @override
  final String? memo;

  @override
  String toString() {
    return 'Result(photo: $photo, faceId: $faceId, person: $person, identity: $identity, serialNo: $serialNo, cardSerialNo: $cardSerialNo, company: $company, faceTypeId: $faceTypeId, faceTypeName: $faceTypeName, similarity: $similarity, temperature: $temperature, capturedAt: $capturedAt, deviceId: $deviceId, deviceName: $deviceName, categoryName: $categoryName, temperatureThreshold: $temperatureThreshold, background: $background, deviceType: $deviceType, title: $title, createdAt: $createdAt, filePath: $filePath, isFever: $isFever, isStranger: $isStranger, isWhitelist: $isWhitelist, isBlacklist: $isBlacklist, isGuest: $isGuest, isVip: $isVip, noface: $noface, deny: $deny, fever: $fever, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.photo, photo) || other.photo == photo) &&
            const DeepCollectionEquality().equals(other.faceId, faceId) &&
            const DeepCollectionEquality().equals(other.person, person) &&
            const DeepCollectionEquality().equals(other.identity, identity) &&
            const DeepCollectionEquality().equals(other.serialNo, serialNo) &&
            const DeepCollectionEquality()
                .equals(other.cardSerialNo, cardSerialNo) &&
            const DeepCollectionEquality().equals(other.company, company) &&
            (identical(other.faceTypeId, faceTypeId) ||
                other.faceTypeId == faceTypeId) &&
            const DeepCollectionEquality()
                .equals(other.faceTypeName, faceTypeName) &&
            (identical(other.similarity, similarity) ||
                other.similarity == similarity) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.temperatureThreshold, temperatureThreshold) ||
                other.temperatureThreshold == temperatureThreshold) &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.filePath, filePath) &&
            (identical(other.isFever, isFever) || other.isFever == isFever) &&
            (identical(other.isStranger, isStranger) ||
                other.isStranger == isStranger) &&
            (identical(other.isWhitelist, isWhitelist) ||
                other.isWhitelist == isWhitelist) &&
            (identical(other.isBlacklist, isBlacklist) ||
                other.isBlacklist == isBlacklist) &&
            (identical(other.isGuest, isGuest) || other.isGuest == isGuest) &&
            (identical(other.isVip, isVip) || other.isVip == isVip) &&
            (identical(other.noface, noface) || other.noface == noface) &&
            (identical(other.deny, deny) || other.deny == deny) &&
            (identical(other.fever, fever) || other.fever == fever) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        photo,
        const DeepCollectionEquality().hash(faceId),
        const DeepCollectionEquality().hash(person),
        const DeepCollectionEquality().hash(identity),
        const DeepCollectionEquality().hash(serialNo),
        const DeepCollectionEquality().hash(cardSerialNo),
        const DeepCollectionEquality().hash(company),
        faceTypeId,
        const DeepCollectionEquality().hash(faceTypeName),
        similarity,
        temperature,
        capturedAt,
        deviceId,
        deviceName,
        categoryName,
        temperatureThreshold,
        background,
        deviceType,
        const DeepCollectionEquality().hash(title),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(filePath),
        isFever,
        isStranger,
        isWhitelist,
        isBlacklist,
        isGuest,
        isVip,
        noface,
        deny,
        fever,
        memo
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      __$$_ResultCopyWithImpl<_$_Result>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  const factory _Result(
      {final String? photo,
      final dynamic? faceId,
      final dynamic? person,
      final dynamic? identity,
      final dynamic? serialNo,
      final dynamic? cardSerialNo,
      final dynamic? company,
      final int? faceTypeId,
      final dynamic? faceTypeName,
      final double? similarity,
      final double? temperature,
      final int? capturedAt,
      final int? deviceId,
      final String? deviceName,
      final String? categoryName,
      final double? temperatureThreshold,
      final String? background,
      final String? deviceType,
      final dynamic? title,
      final dynamic? createdAt,
      final dynamic? filePath,
      final int? isFever,
      final int? isStranger,
      final int? isWhitelist,
      final int? isBlacklist,
      final int? isGuest,
      final int? isVip,
      final bool? noface,
      final bool? deny,
      final bool? fever,
      final String? memo}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  String? get photo;
  @override
  dynamic? get faceId;
  @override
  dynamic? get person;
  @override
  dynamic? get identity;
  @override
  dynamic? get serialNo;
  @override
  dynamic? get cardSerialNo;
  @override
  dynamic? get company;
  @override
  int? get faceTypeId;
  @override
  dynamic? get faceTypeName;
  @override
  double? get similarity;
  @override
  double? get temperature;
  @override
  int? get capturedAt;
  @override
  int? get deviceId;
  @override
  String? get deviceName;
  @override
  String? get categoryName;
  @override
  double? get temperatureThreshold;
  @override
  String? get background;
  @override
  String? get deviceType;
  @override
  dynamic? get title;
  @override
  dynamic? get createdAt;
  @override
  dynamic? get filePath;
  @override
  int? get isFever;
  @override
  int? get isStranger;
  @override
  int? get isWhitelist;
  @override
  int? get isBlacklist;
  @override
  int? get isGuest;
  @override
  int? get isVip;
  @override
  bool? get noface;
  @override
  bool? get deny;
  @override
  bool? get fever;
  @override
  String? get memo;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}
