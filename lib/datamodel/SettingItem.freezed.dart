// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SettingItem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingData _$SettingDataFromJson(Map<String, dynamic> json) {
  return _SettingData.fromJson(json);
}

/// @nodoc
mixin _$SettingData {
  int? get page => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  List<SettingItem>? get result => throw _privateConstructorUsedError;
  int? get PageSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingDataCopyWith<SettingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingDataCopyWith<$Res> {
  factory $SettingDataCopyWith(
          SettingData value, $Res Function(SettingData) then) =
      _$SettingDataCopyWithImpl<$Res, SettingData>;
  @useResult
  $Res call({int? page, int? total, List<SettingItem>? result, int? PageSize});
}

/// @nodoc
class _$SettingDataCopyWithImpl<$Res, $Val extends SettingData>
    implements $SettingDataCopyWith<$Res> {
  _$SettingDataCopyWithImpl(this._value, this._then);

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
    Object? PageSize = freezed,
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
              as List<SettingItem>?,
      PageSize: freezed == PageSize
          ? _value.PageSize
          : PageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingDataCopyWith<$Res>
    implements $SettingDataCopyWith<$Res> {
  factory _$$_SettingDataCopyWith(
          _$_SettingData value, $Res Function(_$_SettingData) then) =
      __$$_SettingDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? page, int? total, List<SettingItem>? result, int? PageSize});
}

/// @nodoc
class __$$_SettingDataCopyWithImpl<$Res>
    extends _$SettingDataCopyWithImpl<$Res, _$_SettingData>
    implements _$$_SettingDataCopyWith<$Res> {
  __$$_SettingDataCopyWithImpl(
      _$_SettingData _value, $Res Function(_$_SettingData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? total = freezed,
    Object? result = freezed,
    Object? PageSize = freezed,
  }) {
    return _then(_$_SettingData(
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
              as List<SettingItem>?,
      PageSize: freezed == PageSize
          ? _value.PageSize
          : PageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingData with DiagnosticableTreeMixin implements _SettingData {
  const _$_SettingData(
      {this.page, this.total, final List<SettingItem>? result, this.PageSize})
      : _result = result;

  factory _$_SettingData.fromJson(Map<String, dynamic> json) =>
      _$$_SettingDataFromJson(json);

  @override
  final int? page;
  @override
  final int? total;
  final List<SettingItem>? _result;
  @override
  List<SettingItem>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? PageSize;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingData(page: $page, total: $total, result: $result, PageSize: $PageSize)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingData'))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('result', result))
      ..add(DiagnosticsProperty('PageSize', PageSize));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingData &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            (identical(other.PageSize, PageSize) ||
                other.PageSize == PageSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, total,
      const DeepCollectionEquality().hash(_result), PageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingDataCopyWith<_$_SettingData> get copyWith =>
      __$$_SettingDataCopyWithImpl<_$_SettingData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingDataToJson(
      this,
    );
  }
}

abstract class _SettingData implements SettingData {
  const factory _SettingData(
      {final int? page,
      final int? total,
      final List<SettingItem>? result,
      final int? PageSize}) = _$_SettingData;

  factory _SettingData.fromJson(Map<String, dynamic> json) =
      _$_SettingData.fromJson;

  @override
  int? get page;
  @override
  int? get total;
  @override
  List<SettingItem>? get result;
  @override
  int? get PageSize;
  @override
  @JsonKey(ignore: true)
  _$$_SettingDataCopyWith<_$_SettingData> get copyWith =>
      throw _privateConstructorUsedError;
}

SettingItem _$SettingItemFromJson(Map<String, dynamic> json) {
  return _SettingItem.fromJson(json);
}

/// @nodoc
mixin _$SettingItem {
  int? get id => throw _privateConstructorUsedError;
  String? get resultVar => throw _privateConstructorUsedError;
  String? get val => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingItemCopyWith<SettingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingItemCopyWith<$Res> {
  factory $SettingItemCopyWith(
          SettingItem value, $Res Function(SettingItem) then) =
      _$SettingItemCopyWithImpl<$Res, SettingItem>;
  @useResult
  $Res call(
      {int? id,
      String? resultVar,
      String? val,
      String? type,
      String? name,
      String? memo});
}

/// @nodoc
class _$SettingItemCopyWithImpl<$Res, $Val extends SettingItem>
    implements $SettingItemCopyWith<$Res> {
  _$SettingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? resultVar = freezed,
    Object? val = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? memo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      resultVar: freezed == resultVar
          ? _value.resultVar
          : resultVar // ignore: cast_nullable_to_non_nullable
              as String?,
      val: freezed == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingItemCopyWith<$Res>
    implements $SettingItemCopyWith<$Res> {
  factory _$$_SettingItemCopyWith(
          _$_SettingItem value, $Res Function(_$_SettingItem) then) =
      __$$_SettingItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? resultVar,
      String? val,
      String? type,
      String? name,
      String? memo});
}

/// @nodoc
class __$$_SettingItemCopyWithImpl<$Res>
    extends _$SettingItemCopyWithImpl<$Res, _$_SettingItem>
    implements _$$_SettingItemCopyWith<$Res> {
  __$$_SettingItemCopyWithImpl(
      _$_SettingItem _value, $Res Function(_$_SettingItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? resultVar = freezed,
    Object? val = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? memo = freezed,
  }) {
    return _then(_$_SettingItem(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      resultVar: freezed == resultVar
          ? _value.resultVar
          : resultVar // ignore: cast_nullable_to_non_nullable
              as String?,
      val: freezed == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingItem with DiagnosticableTreeMixin implements _SettingItem {
  const _$_SettingItem(
      {this.id, this.resultVar, this.val, this.type, this.name, this.memo});

  factory _$_SettingItem.fromJson(Map<String, dynamic> json) =>
      _$$_SettingItemFromJson(json);

  @override
  final int? id;
  @override
  final String? resultVar;
  @override
  final String? val;
  @override
  final String? type;
  @override
  final String? name;
  @override
  final String? memo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingItem(id: $id, resultVar: $resultVar, val: $val, type: $type, name: $name, memo: $memo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingItem'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('resultVar', resultVar))
      ..add(DiagnosticsProperty('val', val))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('memo', memo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.resultVar, resultVar) ||
                other.resultVar == resultVar) &&
            (identical(other.val, val) || other.val == val) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, resultVar, val, type, name, memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingItemCopyWith<_$_SettingItem> get copyWith =>
      __$$_SettingItemCopyWithImpl<_$_SettingItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingItemToJson(
      this,
    );
  }
}

abstract class _SettingItem implements SettingItem {
  const factory _SettingItem(
      {final int? id,
      final String? resultVar,
      final String? val,
      final String? type,
      final String? name,
      final String? memo}) = _$_SettingItem;

  factory _SettingItem.fromJson(Map<String, dynamic> json) =
      _$_SettingItem.fromJson;

  @override
  int? get id;
  @override
  String? get resultVar;
  @override
  String? get val;
  @override
  String? get type;
  @override
  String? get name;
  @override
  String? get memo;
  @override
  @JsonKey(ignore: true)
  _$$_SettingItemCopyWith<_$_SettingItem> get copyWith =>
      throw _privateConstructorUsedError;
}
