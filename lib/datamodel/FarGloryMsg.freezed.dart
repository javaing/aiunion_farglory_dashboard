// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'FarGloryMsg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FarGloryMsg _$FarGloryMsgFromJson(Map<String, dynamic> json) {
  return _FarGloryMsg.fromJson(json);
}

/// @nodoc
mixin _$FarGloryMsg {
  String? get id => throw _privateConstructorUsedError;
  String? get action => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get worktype => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FarGloryMsgCopyWith<FarGloryMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarGloryMsgCopyWith<$Res> {
  factory $FarGloryMsgCopyWith(
          FarGloryMsg value, $Res Function(FarGloryMsg) then) =
      _$FarGloryMsgCopyWithImpl<$Res, FarGloryMsg>;
  @useResult
  $Res call(
      {String? id,
      String? action,
      String? company,
      String? worktype,
      String? imgUrl});
}

/// @nodoc
class _$FarGloryMsgCopyWithImpl<$Res, $Val extends FarGloryMsg>
    implements $FarGloryMsgCopyWith<$Res> {
  _$FarGloryMsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? action = freezed,
    Object? company = freezed,
    Object? worktype = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      worktype: freezed == worktype
          ? _value.worktype
          : worktype // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FarGloryMsgCopyWith<$Res>
    implements $FarGloryMsgCopyWith<$Res> {
  factory _$$_FarGloryMsgCopyWith(
          _$_FarGloryMsg value, $Res Function(_$_FarGloryMsg) then) =
      __$$_FarGloryMsgCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? action,
      String? company,
      String? worktype,
      String? imgUrl});
}

/// @nodoc
class __$$_FarGloryMsgCopyWithImpl<$Res>
    extends _$FarGloryMsgCopyWithImpl<$Res, _$_FarGloryMsg>
    implements _$$_FarGloryMsgCopyWith<$Res> {
  __$$_FarGloryMsgCopyWithImpl(
      _$_FarGloryMsg _value, $Res Function(_$_FarGloryMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? action = freezed,
    Object? company = freezed,
    Object? worktype = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_$_FarGloryMsg(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      worktype: freezed == worktype
          ? _value.worktype
          : worktype // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FarGloryMsg implements _FarGloryMsg {
  const _$_FarGloryMsg(
      {this.id, this.action, this.company, this.worktype, this.imgUrl});

  factory _$_FarGloryMsg.fromJson(Map<String, dynamic> json) =>
      _$$_FarGloryMsgFromJson(json);

  @override
  final String? id;
  @override
  final String? action;
  @override
  final String? company;
  @override
  final String? worktype;
  @override
  final String? imgUrl;

  @override
  String toString() {
    return 'FarGloryMsg(id: $id, action: $action, company: $company, worktype: $worktype, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FarGloryMsg &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.worktype, worktype) ||
                other.worktype == worktype) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, action, company, worktype, imgUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FarGloryMsgCopyWith<_$_FarGloryMsg> get copyWith =>
      __$$_FarGloryMsgCopyWithImpl<_$_FarGloryMsg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FarGloryMsgToJson(
      this,
    );
  }
}

abstract class _FarGloryMsg implements FarGloryMsg {
  const factory _FarGloryMsg(
      {final String? id,
      final String? action,
      final String? company,
      final String? worktype,
      final String? imgUrl}) = _$_FarGloryMsg;

  factory _FarGloryMsg.fromJson(Map<String, dynamic> json) =
      _$_FarGloryMsg.fromJson;

  @override
  String? get id;
  @override
  String? get action;
  @override
  String? get company;
  @override
  String? get worktype;
  @override
  String? get imgUrl;
  @override
  @JsonKey(ignore: true)
  _$$_FarGloryMsgCopyWith<_$_FarGloryMsg> get copyWith =>
      throw _privateConstructorUsedError;
}
