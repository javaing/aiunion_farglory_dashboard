// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ServerFaceType.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServerFaceType _$ServerFaceTypeFromJson(Map<String, dynamic> json) {
  return _ServerFaceType.fromJson(json);
}

/// @nodoc
mixin _$ServerFaceType {
  int? get page => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  List<FaceType>? get result => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerFaceTypeCopyWith<ServerFaceType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerFaceTypeCopyWith<$Res> {
  factory $ServerFaceTypeCopyWith(
          ServerFaceType value, $Res Function(ServerFaceType) then) =
      _$ServerFaceTypeCopyWithImpl<$Res, ServerFaceType>;
  @useResult
  $Res call({int? page, int? total, List<FaceType>? result, int? pageSize});
}

/// @nodoc
class _$ServerFaceTypeCopyWithImpl<$Res, $Val extends ServerFaceType>
    implements $ServerFaceTypeCopyWith<$Res> {
  _$ServerFaceTypeCopyWithImpl(this._value, this._then);

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
              as List<FaceType>?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServerFaceTypeCopyWith<$Res>
    implements $ServerFaceTypeCopyWith<$Res> {
  factory _$$_ServerFaceTypeCopyWith(
          _$_ServerFaceType value, $Res Function(_$_ServerFaceType) then) =
      __$$_ServerFaceTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? page, int? total, List<FaceType>? result, int? pageSize});
}

/// @nodoc
class __$$_ServerFaceTypeCopyWithImpl<$Res>
    extends _$ServerFaceTypeCopyWithImpl<$Res, _$_ServerFaceType>
    implements _$$_ServerFaceTypeCopyWith<$Res> {
  __$$_ServerFaceTypeCopyWithImpl(
      _$_ServerFaceType _value, $Res Function(_$_ServerFaceType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? total = freezed,
    Object? result = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_$_ServerFaceType(
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
              as List<FaceType>?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServerFaceType implements _ServerFaceType {
  const _$_ServerFaceType(
      {this.page, this.total, final List<FaceType>? result, this.pageSize})
      : _result = result;

  factory _$_ServerFaceType.fromJson(Map<String, dynamic> json) =>
      _$$_ServerFaceTypeFromJson(json);

  @override
  final int? page;
  @override
  final int? total;
  final List<FaceType>? _result;
  @override
  List<FaceType>? get result {
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
    return 'ServerFaceType(page: $page, total: $total, result: $result, pageSize: $pageSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerFaceType &&
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
  _$$_ServerFaceTypeCopyWith<_$_ServerFaceType> get copyWith =>
      __$$_ServerFaceTypeCopyWithImpl<_$_ServerFaceType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServerFaceTypeToJson(
      this,
    );
  }
}

abstract class _ServerFaceType implements ServerFaceType {
  const factory _ServerFaceType(
      {final int? page,
      final int? total,
      final List<FaceType>? result,
      final int? pageSize}) = _$_ServerFaceType;

  factory _ServerFaceType.fromJson(Map<String, dynamic> json) =
      _$_ServerFaceType.fromJson;

  @override
  int? get page;
  @override
  int? get total;
  @override
  List<FaceType>? get result;
  @override
  int? get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$_ServerFaceTypeCopyWith<_$_ServerFaceType> get copyWith =>
      throw _privateConstructorUsedError;
}

FaceType _$FaceTypeFromJson(Map<String, dynamic> json) {
  return _FaceType.fromJson(json);
}

/// @nodoc
mixin _$FaceType {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get threshold => throw _privateConstructorUsedError;
  dynamic? get description => throw _privateConstructorUsedError;
  int? get faceCount => throw _privateConstructorUsedError;
  int? get photoCount => throw _privateConstructorUsedError;
  bool? get rtcEnabled => throw _privateConstructorUsedError;
  bool? get resultDynamic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FaceTypeCopyWith<FaceType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceTypeCopyWith<$Res> {
  factory $FaceTypeCopyWith(FaceType value, $Res Function(FaceType) then) =
      _$FaceTypeCopyWithImpl<$Res, FaceType>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      double? threshold,
      dynamic? description,
      int? faceCount,
      int? photoCount,
      bool? rtcEnabled,
      bool? resultDynamic});
}

/// @nodoc
class _$FaceTypeCopyWithImpl<$Res, $Val extends FaceType>
    implements $FaceTypeCopyWith<$Res> {
  _$FaceTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? threshold = freezed,
    Object? description = freezed,
    Object? faceCount = freezed,
    Object? photoCount = freezed,
    Object? rtcEnabled = freezed,
    Object? resultDynamic = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      threshold: freezed == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      faceCount: freezed == faceCount
          ? _value.faceCount
          : faceCount // ignore: cast_nullable_to_non_nullable
              as int?,
      photoCount: freezed == photoCount
          ? _value.photoCount
          : photoCount // ignore: cast_nullable_to_non_nullable
              as int?,
      rtcEnabled: freezed == rtcEnabled
          ? _value.rtcEnabled
          : rtcEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      resultDynamic: freezed == resultDynamic
          ? _value.resultDynamic
          : resultDynamic // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FaceTypeCopyWith<$Res> implements $FaceTypeCopyWith<$Res> {
  factory _$$_FaceTypeCopyWith(
          _$_FaceType value, $Res Function(_$_FaceType) then) =
      __$$_FaceTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      double? threshold,
      dynamic? description,
      int? faceCount,
      int? photoCount,
      bool? rtcEnabled,
      bool? resultDynamic});
}

/// @nodoc
class __$$_FaceTypeCopyWithImpl<$Res>
    extends _$FaceTypeCopyWithImpl<$Res, _$_FaceType>
    implements _$$_FaceTypeCopyWith<$Res> {
  __$$_FaceTypeCopyWithImpl(
      _$_FaceType _value, $Res Function(_$_FaceType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? threshold = freezed,
    Object? description = freezed,
    Object? faceCount = freezed,
    Object? photoCount = freezed,
    Object? rtcEnabled = freezed,
    Object? resultDynamic = freezed,
  }) {
    return _then(_$_FaceType(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      threshold: freezed == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      faceCount: freezed == faceCount
          ? _value.faceCount
          : faceCount // ignore: cast_nullable_to_non_nullable
              as int?,
      photoCount: freezed == photoCount
          ? _value.photoCount
          : photoCount // ignore: cast_nullable_to_non_nullable
              as int?,
      rtcEnabled: freezed == rtcEnabled
          ? _value.rtcEnabled
          : rtcEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      resultDynamic: freezed == resultDynamic
          ? _value.resultDynamic
          : resultDynamic // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FaceType implements _FaceType {
  const _$_FaceType(
      {this.id,
      this.name,
      this.threshold,
      this.description,
      this.faceCount,
      this.photoCount,
      this.rtcEnabled,
      this.resultDynamic});

  factory _$_FaceType.fromJson(Map<String, dynamic> json) =>
      _$$_FaceTypeFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final double? threshold;
  @override
  final dynamic? description;
  @override
  final int? faceCount;
  @override
  final int? photoCount;
  @override
  final bool? rtcEnabled;
  @override
  final bool? resultDynamic;

  @override
  String toString() {
    return 'FaceType(id: $id, name: $name, threshold: $threshold, description: $description, faceCount: $faceCount, photoCount: $photoCount, rtcEnabled: $rtcEnabled, resultDynamic: $resultDynamic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FaceType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            (identical(other.faceCount, faceCount) ||
                other.faceCount == faceCount) &&
            (identical(other.photoCount, photoCount) ||
                other.photoCount == photoCount) &&
            (identical(other.rtcEnabled, rtcEnabled) ||
                other.rtcEnabled == rtcEnabled) &&
            (identical(other.resultDynamic, resultDynamic) ||
                other.resultDynamic == resultDynamic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      threshold,
      const DeepCollectionEquality().hash(description),
      faceCount,
      photoCount,
      rtcEnabled,
      resultDynamic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FaceTypeCopyWith<_$_FaceType> get copyWith =>
      __$$_FaceTypeCopyWithImpl<_$_FaceType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FaceTypeToJson(
      this,
    );
  }
}

abstract class _FaceType implements FaceType {
  const factory _FaceType(
      {final int? id,
      final String? name,
      final double? threshold,
      final dynamic? description,
      final int? faceCount,
      final int? photoCount,
      final bool? rtcEnabled,
      final bool? resultDynamic}) = _$_FaceType;

  factory _FaceType.fromJson(Map<String, dynamic> json) = _$_FaceType.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  double? get threshold;
  @override
  dynamic? get description;
  @override
  int? get faceCount;
  @override
  int? get photoCount;
  @override
  bool? get rtcEnabled;
  @override
  bool? get resultDynamic;
  @override
  @JsonKey(ignore: true)
  _$$_FaceTypeCopyWith<_$_FaceType> get copyWith =>
      throw _privateConstructorUsedError;
}
