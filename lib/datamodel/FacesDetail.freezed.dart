// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'FacesDetail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacesDetail _$FacesDetailFromJson(Map<String, dynamic> json) {
  return _FacesDetail.fromJson(json);
}

/// @nodoc
mixin _$FacesDetail {
  int? get code => throw _privateConstructorUsedError;
  Result? get result => throw _privateConstructorUsedError;
  dynamic? get msg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacesDetailCopyWith<FacesDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacesDetailCopyWith<$Res> {
  factory $FacesDetailCopyWith(
          FacesDetail value, $Res Function(FacesDetail) then) =
      _$FacesDetailCopyWithImpl<$Res, FacesDetail>;
  @useResult
  $Res call({int? code, Result? result, dynamic? msg});

  $ResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$FacesDetailCopyWithImpl<$Res, $Val extends FacesDetail>
    implements $FacesDetailCopyWith<$Res> {
  _$FacesDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? result = freezed,
    Object? msg = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $ResultCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FacesDetailCopyWith<$Res>
    implements $FacesDetailCopyWith<$Res> {
  factory _$$_FacesDetailCopyWith(
          _$_FacesDetail value, $Res Function(_$_FacesDetail) then) =
      __$$_FacesDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, Result? result, dynamic? msg});

  @override
  $ResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$$_FacesDetailCopyWithImpl<$Res>
    extends _$FacesDetailCopyWithImpl<$Res, _$_FacesDetail>
    implements _$$_FacesDetailCopyWith<$Res> {
  __$$_FacesDetailCopyWithImpl(
      _$_FacesDetail _value, $Res Function(_$_FacesDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? result = freezed,
    Object? msg = freezed,
  }) {
    return _then(_$_FacesDetail(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacesDetail implements _FacesDetail {
  const _$_FacesDetail({this.code, this.result, this.msg});

  factory _$_FacesDetail.fromJson(Map<String, dynamic> json) =>
      _$$_FacesDetailFromJson(json);

  @override
  final int? code;
  @override
  final Result? result;
  @override
  final dynamic? msg;

  @override
  String toString() {
    return 'FacesDetail(code: $code, result: $result, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacesDetail &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, result, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FacesDetailCopyWith<_$_FacesDetail> get copyWith =>
      __$$_FacesDetailCopyWithImpl<_$_FacesDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacesDetailToJson(
      this,
    );
  }
}

abstract class _FacesDetail implements FacesDetail {
  const factory _FacesDetail(
      {final int? code,
      final Result? result,
      final dynamic? msg}) = _$_FacesDetail;

  factory _FacesDetail.fromJson(Map<String, dynamic> json) =
      _$_FacesDetail.fromJson;

  @override
  int? get code;
  @override
  Result? get result;
  @override
  dynamic? get msg;
  @override
  @JsonKey(ignore: true)
  _$$_FacesDetailCopyWith<_$_FacesDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  String? get identity => throw _privateConstructorUsedError;
  List<Photo>? get photos => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String? get passDevices => throw _privateConstructorUsedError;
  String? get passCategories => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get passStartedAt => throw _privateConstructorUsedError;
  int? get passEndedAt => throw _privateConstructorUsedError;
  String? get hostName => throw _privateConstructorUsedError;
  String? get hostTel => throw _privateConstructorUsedError;
  String? get hostEngName => throw _privateConstructorUsedError;
  String? get hostDepartment => throw _privateConstructorUsedError;
  bool? get enabled => throw _privateConstructorUsedError;
  int? get attendanceGroupId => throw _privateConstructorUsedError;
  String? get customize => throw _privateConstructorUsedError;
  String? get serialNo => throw _privateConstructorUsedError;
  String? get cardSerialNo => throw _privateConstructorUsedError;
  int? get autoid => throw _privateConstructorUsedError;
  String? get person => throw _privateConstructorUsedError;
  int? get typeId => throw _privateConstructorUsedError;

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
      {String? identity,
      List<Photo>? photos,
      String? photo,
      String? passDevices,
      String? passCategories,
      String? phone,
      String? email,
      String? company,
      String? title,
      int? passStartedAt,
      int? passEndedAt,
      String? hostName,
      String? hostTel,
      String? hostEngName,
      String? hostDepartment,
      bool? enabled,
      int? attendanceGroupId,
      String? customize,
      String? serialNo,
      String? cardSerialNo,
      int? autoid,
      String? person,
      int? typeId});
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
    Object? identity = freezed,
    Object? photos = freezed,
    Object? photo = freezed,
    Object? passDevices = freezed,
    Object? passCategories = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? company = freezed,
    Object? title = freezed,
    Object? passStartedAt = freezed,
    Object? passEndedAt = freezed,
    Object? hostName = freezed,
    Object? hostTel = freezed,
    Object? hostEngName = freezed,
    Object? hostDepartment = freezed,
    Object? enabled = freezed,
    Object? attendanceGroupId = freezed,
    Object? customize = freezed,
    Object? serialNo = freezed,
    Object? cardSerialNo = freezed,
    Object? autoid = freezed,
    Object? person = freezed,
    Object? typeId = freezed,
  }) {
    return _then(_value.copyWith(
      identity: freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      passDevices: freezed == passDevices
          ? _value.passDevices
          : passDevices // ignore: cast_nullable_to_non_nullable
              as String?,
      passCategories: freezed == passCategories
          ? _value.passCategories
          : passCategories // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      passStartedAt: freezed == passStartedAt
          ? _value.passStartedAt
          : passStartedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      passEndedAt: freezed == passEndedAt
          ? _value.passEndedAt
          : passEndedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      hostName: freezed == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String?,
      hostTel: freezed == hostTel
          ? _value.hostTel
          : hostTel // ignore: cast_nullable_to_non_nullable
              as String?,
      hostEngName: freezed == hostEngName
          ? _value.hostEngName
          : hostEngName // ignore: cast_nullable_to_non_nullable
              as String?,
      hostDepartment: freezed == hostDepartment
          ? _value.hostDepartment
          : hostDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      attendanceGroupId: freezed == attendanceGroupId
          ? _value.attendanceGroupId
          : attendanceGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      customize: freezed == customize
          ? _value.customize
          : customize // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNo: freezed == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as String?,
      cardSerialNo: freezed == cardSerialNo
          ? _value.cardSerialNo
          : cardSerialNo // ignore: cast_nullable_to_non_nullable
              as String?,
      autoid: freezed == autoid
          ? _value.autoid
          : autoid // ignore: cast_nullable_to_non_nullable
              as int?,
      person: freezed == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as String?,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {String? identity,
      List<Photo>? photos,
      String? photo,
      String? passDevices,
      String? passCategories,
      String? phone,
      String? email,
      String? company,
      String? title,
      int? passStartedAt,
      int? passEndedAt,
      String? hostName,
      String? hostTel,
      String? hostEngName,
      String? hostDepartment,
      bool? enabled,
      int? attendanceGroupId,
      String? customize,
      String? serialNo,
      String? cardSerialNo,
      int? autoid,
      String? person,
      int? typeId});
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
    Object? identity = freezed,
    Object? photos = freezed,
    Object? photo = freezed,
    Object? passDevices = freezed,
    Object? passCategories = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? company = freezed,
    Object? title = freezed,
    Object? passStartedAt = freezed,
    Object? passEndedAt = freezed,
    Object? hostName = freezed,
    Object? hostTel = freezed,
    Object? hostEngName = freezed,
    Object? hostDepartment = freezed,
    Object? enabled = freezed,
    Object? attendanceGroupId = freezed,
    Object? customize = freezed,
    Object? serialNo = freezed,
    Object? cardSerialNo = freezed,
    Object? autoid = freezed,
    Object? person = freezed,
    Object? typeId = freezed,
  }) {
    return _then(_$_Result(
      identity: freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      passDevices: freezed == passDevices
          ? _value.passDevices
          : passDevices // ignore: cast_nullable_to_non_nullable
              as String?,
      passCategories: freezed == passCategories
          ? _value.passCategories
          : passCategories // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      passStartedAt: freezed == passStartedAt
          ? _value.passStartedAt
          : passStartedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      passEndedAt: freezed == passEndedAt
          ? _value.passEndedAt
          : passEndedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      hostName: freezed == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String?,
      hostTel: freezed == hostTel
          ? _value.hostTel
          : hostTel // ignore: cast_nullable_to_non_nullable
              as String?,
      hostEngName: freezed == hostEngName
          ? _value.hostEngName
          : hostEngName // ignore: cast_nullable_to_non_nullable
              as String?,
      hostDepartment: freezed == hostDepartment
          ? _value.hostDepartment
          : hostDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      attendanceGroupId: freezed == attendanceGroupId
          ? _value.attendanceGroupId
          : attendanceGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      customize: freezed == customize
          ? _value.customize
          : customize // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNo: freezed == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as String?,
      cardSerialNo: freezed == cardSerialNo
          ? _value.cardSerialNo
          : cardSerialNo // ignore: cast_nullable_to_non_nullable
              as String?,
      autoid: freezed == autoid
          ? _value.autoid
          : autoid // ignore: cast_nullable_to_non_nullable
              as int?,
      person: freezed == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as String?,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result(
      {this.identity,
      final List<Photo>? photos,
      this.photo,
      this.passDevices,
      this.passCategories,
      this.phone,
      this.email,
      this.company,
      this.title,
      this.passStartedAt,
      this.passEndedAt,
      this.hostName,
      this.hostTel,
      this.hostEngName,
      this.hostDepartment,
      this.enabled,
      this.attendanceGroupId,
      this.customize,
      this.serialNo,
      this.cardSerialNo,
      this.autoid,
      this.person,
      this.typeId})
      : _photos = photos;

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final String? identity;
  final List<Photo>? _photos;
  @override
  List<Photo>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? photo;
  @override
  final String? passDevices;
  @override
  final String? passCategories;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? company;
  @override
  final String? title;
  @override
  final int? passStartedAt;
  @override
  final int? passEndedAt;
  @override
  final String? hostName;
  @override
  final String? hostTel;
  @override
  final String? hostEngName;
  @override
  final String? hostDepartment;
  @override
  final bool? enabled;
  @override
  final int? attendanceGroupId;
  @override
  final String? customize;
  @override
  final String? serialNo;
  @override
  final String? cardSerialNo;
  @override
  final int? autoid;
  @override
  final String? person;
  @override
  final int? typeId;

  @override
  String toString() {
    return 'Result(identity: $identity, photos: $photos, photo: $photo, passDevices: $passDevices, passCategories: $passCategories, phone: $phone, email: $email, company: $company, title: $title, passStartedAt: $passStartedAt, passEndedAt: $passEndedAt, hostName: $hostName, hostTel: $hostTel, hostEngName: $hostEngName, hostDepartment: $hostDepartment, enabled: $enabled, attendanceGroupId: $attendanceGroupId, customize: $customize, serialNo: $serialNo, cardSerialNo: $cardSerialNo, autoid: $autoid, person: $person, typeId: $typeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.identity, identity) ||
                other.identity == identity) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.passDevices, passDevices) ||
                other.passDevices == passDevices) &&
            (identical(other.passCategories, passCategories) ||
                other.passCategories == passCategories) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.passStartedAt, passStartedAt) ||
                other.passStartedAt == passStartedAt) &&
            (identical(other.passEndedAt, passEndedAt) ||
                other.passEndedAt == passEndedAt) &&
            (identical(other.hostName, hostName) ||
                other.hostName == hostName) &&
            (identical(other.hostTel, hostTel) || other.hostTel == hostTel) &&
            (identical(other.hostEngName, hostEngName) ||
                other.hostEngName == hostEngName) &&
            (identical(other.hostDepartment, hostDepartment) ||
                other.hostDepartment == hostDepartment) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.attendanceGroupId, attendanceGroupId) ||
                other.attendanceGroupId == attendanceGroupId) &&
            (identical(other.customize, customize) ||
                other.customize == customize) &&
            (identical(other.serialNo, serialNo) ||
                other.serialNo == serialNo) &&
            (identical(other.cardSerialNo, cardSerialNo) ||
                other.cardSerialNo == cardSerialNo) &&
            (identical(other.autoid, autoid) || other.autoid == autoid) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.typeId, typeId) || other.typeId == typeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        identity,
        const DeepCollectionEquality().hash(_photos),
        photo,
        passDevices,
        passCategories,
        phone,
        email,
        company,
        title,
        passStartedAt,
        passEndedAt,
        hostName,
        hostTel,
        hostEngName,
        hostDepartment,
        enabled,
        attendanceGroupId,
        customize,
        serialNo,
        cardSerialNo,
        autoid,
        person,
        typeId
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
      {final String? identity,
      final List<Photo>? photos,
      final String? photo,
      final String? passDevices,
      final String? passCategories,
      final String? phone,
      final String? email,
      final String? company,
      final String? title,
      final int? passStartedAt,
      final int? passEndedAt,
      final String? hostName,
      final String? hostTel,
      final String? hostEngName,
      final String? hostDepartment,
      final bool? enabled,
      final int? attendanceGroupId,
      final String? customize,
      final String? serialNo,
      final String? cardSerialNo,
      final int? autoid,
      final String? person,
      final int? typeId}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  String? get identity;
  @override
  List<Photo>? get photos;
  @override
  String? get photo;
  @override
  String? get passDevices;
  @override
  String? get passCategories;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get company;
  @override
  String? get title;
  @override
  int? get passStartedAt;
  @override
  int? get passEndedAt;
  @override
  String? get hostName;
  @override
  String? get hostTel;
  @override
  String? get hostEngName;
  @override
  String? get hostDepartment;
  @override
  bool? get enabled;
  @override
  int? get attendanceGroupId;
  @override
  String? get customize;
  @override
  String? get serialNo;
  @override
  String? get cardSerialNo;
  @override
  int? get autoid;
  @override
  String? get person;
  @override
  int? get typeId;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return _Photo.fromJson(json);
}

/// @nodoc
mixin _$Photo {
  int? get id => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoCopyWith<Photo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoCopyWith<$Res> {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) then) =
      _$PhotoCopyWithImpl<$Res, Photo>;
  @useResult
  $Res call({int? id, String? photo});
}

/// @nodoc
class _$PhotoCopyWithImpl<$Res, $Val extends Photo>
    implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhotoCopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$$_PhotoCopyWith(_$_Photo value, $Res Function(_$_Photo) then) =
      __$$_PhotoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? photo});
}

/// @nodoc
class __$$_PhotoCopyWithImpl<$Res> extends _$PhotoCopyWithImpl<$Res, _$_Photo>
    implements _$$_PhotoCopyWith<$Res> {
  __$$_PhotoCopyWithImpl(_$_Photo _value, $Res Function(_$_Photo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? photo = freezed,
  }) {
    return _then(_$_Photo(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Photo implements _Photo {
  const _$_Photo({this.id, this.photo});

  factory _$_Photo.fromJson(Map<String, dynamic> json) =>
      _$$_PhotoFromJson(json);

  @override
  final int? id;
  @override
  final String? photo;

  @override
  String toString() {
    return 'Photo(id: $id, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Photo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhotoCopyWith<_$_Photo> get copyWith =>
      __$$_PhotoCopyWithImpl<_$_Photo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhotoToJson(
      this,
    );
  }
}

abstract class _Photo implements Photo {
  const factory _Photo({final int? id, final String? photo}) = _$_Photo;

  factory _Photo.fromJson(Map<String, dynamic> json) = _$_Photo.fromJson;

  @override
  int? get id;
  @override
  String? get photo;
  @override
  @JsonKey(ignore: true)
  _$$_PhotoCopyWith<_$_Photo> get copyWith =>
      throw _privateConstructorUsedError;
}
