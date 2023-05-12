// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Weather36Hr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Weather36Hr _$Weather36HrFromJson(Map<String, dynamic> json) {
  return _Weather36Hr.fromJson(json);
}

/// @nodoc
mixin _$Weather36Hr {
  String? get success => throw _privateConstructorUsedError; //WResult? result,
  Records? get records => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Weather36HrCopyWith<Weather36Hr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Weather36HrCopyWith<$Res> {
  factory $Weather36HrCopyWith(
          Weather36Hr value, $Res Function(Weather36Hr) then) =
      _$Weather36HrCopyWithImpl<$Res, Weather36Hr>;
  @useResult
  $Res call({String? success, Records? records});

  $RecordsCopyWith<$Res>? get records;
}

/// @nodoc
class _$Weather36HrCopyWithImpl<$Res, $Val extends Weather36Hr>
    implements $Weather36HrCopyWith<$Res> {
  _$Weather36HrCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? records = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String?,
      records: freezed == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as Records?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecordsCopyWith<$Res>? get records {
    if (_value.records == null) {
      return null;
    }

    return $RecordsCopyWith<$Res>(_value.records!, (value) {
      return _then(_value.copyWith(records: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_Weather36HrCopyWith<$Res>
    implements $Weather36HrCopyWith<$Res> {
  factory _$$_Weather36HrCopyWith(
          _$_Weather36Hr value, $Res Function(_$_Weather36Hr) then) =
      __$$_Weather36HrCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? success, Records? records});

  @override
  $RecordsCopyWith<$Res>? get records;
}

/// @nodoc
class __$$_Weather36HrCopyWithImpl<$Res>
    extends _$Weather36HrCopyWithImpl<$Res, _$_Weather36Hr>
    implements _$$_Weather36HrCopyWith<$Res> {
  __$$_Weather36HrCopyWithImpl(
      _$_Weather36Hr _value, $Res Function(_$_Weather36Hr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? records = freezed,
  }) {
    return _then(_$_Weather36Hr(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String?,
      records: freezed == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as Records?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Weather36Hr implements _Weather36Hr {
  const _$_Weather36Hr({this.success, this.records});

  factory _$_Weather36Hr.fromJson(Map<String, dynamic> json) =>
      _$$_Weather36HrFromJson(json);

  @override
  final String? success;
//WResult? result,
  @override
  final Records? records;

  @override
  String toString() {
    return 'Weather36Hr(success: $success, records: $records)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Weather36Hr &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.records, records) || other.records == records));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, records);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Weather36HrCopyWith<_$_Weather36Hr> get copyWith =>
      __$$_Weather36HrCopyWithImpl<_$_Weather36Hr>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Weather36HrToJson(
      this,
    );
  }
}

abstract class _Weather36Hr implements Weather36Hr {
  const factory _Weather36Hr({final String? success, final Records? records}) =
      _$_Weather36Hr;

  factory _Weather36Hr.fromJson(Map<String, dynamic> json) =
      _$_Weather36Hr.fromJson;

  @override
  String? get success;
  @override //WResult? result,
  Records? get records;
  @override
  @JsonKey(ignore: true)
  _$$_Weather36HrCopyWith<_$_Weather36Hr> get copyWith =>
      throw _privateConstructorUsedError;
}

Records _$RecordsFromJson(Map<String, dynamic> json) {
  return _Records.fromJson(json);
}

/// @nodoc
mixin _$Records {
  List<RecordsLocation>? get locations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordsCopyWith<Records> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordsCopyWith<$Res> {
  factory $RecordsCopyWith(Records value, $Res Function(Records) then) =
      _$RecordsCopyWithImpl<$Res, Records>;
  @useResult
  $Res call({List<RecordsLocation>? locations});
}

/// @nodoc
class _$RecordsCopyWithImpl<$Res, $Val extends Records>
    implements $RecordsCopyWith<$Res> {
  _$RecordsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = freezed,
  }) {
    return _then(_value.copyWith(
      locations: freezed == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<RecordsLocation>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecordsCopyWith<$Res> implements $RecordsCopyWith<$Res> {
  factory _$$_RecordsCopyWith(
          _$_Records value, $Res Function(_$_Records) then) =
      __$$_RecordsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RecordsLocation>? locations});
}

/// @nodoc
class __$$_RecordsCopyWithImpl<$Res>
    extends _$RecordsCopyWithImpl<$Res, _$_Records>
    implements _$$_RecordsCopyWith<$Res> {
  __$$_RecordsCopyWithImpl(_$_Records _value, $Res Function(_$_Records) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = freezed,
  }) {
    return _then(_$_Records(
      locations: freezed == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<RecordsLocation>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Records implements _Records {
  const _$_Records({final List<RecordsLocation>? locations})
      : _locations = locations;

  factory _$_Records.fromJson(Map<String, dynamic> json) =>
      _$$_RecordsFromJson(json);

  final List<RecordsLocation>? _locations;
  @override
  List<RecordsLocation>? get locations {
    final value = _locations;
    if (value == null) return null;
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Records(locations: $locations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Records &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_locations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecordsCopyWith<_$_Records> get copyWith =>
      __$$_RecordsCopyWithImpl<_$_Records>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecordsToJson(
      this,
    );
  }
}

abstract class _Records implements Records {
  const factory _Records({final List<RecordsLocation>? locations}) = _$_Records;

  factory _Records.fromJson(Map<String, dynamic> json) = _$_Records.fromJson;

  @override
  List<RecordsLocation>? get locations;
  @override
  @JsonKey(ignore: true)
  _$$_RecordsCopyWith<_$_Records> get copyWith =>
      throw _privateConstructorUsedError;
}

RecordsLocation _$RecordsLocationFromJson(Map<String, dynamic> json) {
  return _RecordsLocation.fromJson(json);
}

/// @nodoc
mixin _$RecordsLocation {
  String? get datasetDescription => throw _privateConstructorUsedError;
  String? get locationsName => throw _privateConstructorUsedError;
  String? get dataid => throw _privateConstructorUsedError;
  List<LocationLocation>? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordsLocationCopyWith<RecordsLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordsLocationCopyWith<$Res> {
  factory $RecordsLocationCopyWith(
          RecordsLocation value, $Res Function(RecordsLocation) then) =
      _$RecordsLocationCopyWithImpl<$Res, RecordsLocation>;
  @useResult
  $Res call(
      {String? datasetDescription,
      String? locationsName,
      String? dataid,
      List<LocationLocation>? location});
}

/// @nodoc
class _$RecordsLocationCopyWithImpl<$Res, $Val extends RecordsLocation>
    implements $RecordsLocationCopyWith<$Res> {
  _$RecordsLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datasetDescription = freezed,
    Object? locationsName = freezed,
    Object? dataid = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      datasetDescription: freezed == datasetDescription
          ? _value.datasetDescription
          : datasetDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      locationsName: freezed == locationsName
          ? _value.locationsName
          : locationsName // ignore: cast_nullable_to_non_nullable
              as String?,
      dataid: freezed == dataid
          ? _value.dataid
          : dataid // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<LocationLocation>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecordsLocationCopyWith<$Res>
    implements $RecordsLocationCopyWith<$Res> {
  factory _$$_RecordsLocationCopyWith(
          _$_RecordsLocation value, $Res Function(_$_RecordsLocation) then) =
      __$$_RecordsLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? datasetDescription,
      String? locationsName,
      String? dataid,
      List<LocationLocation>? location});
}

/// @nodoc
class __$$_RecordsLocationCopyWithImpl<$Res>
    extends _$RecordsLocationCopyWithImpl<$Res, _$_RecordsLocation>
    implements _$$_RecordsLocationCopyWith<$Res> {
  __$$_RecordsLocationCopyWithImpl(
      _$_RecordsLocation _value, $Res Function(_$_RecordsLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datasetDescription = freezed,
    Object? locationsName = freezed,
    Object? dataid = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_RecordsLocation(
      datasetDescription: freezed == datasetDescription
          ? _value.datasetDescription
          : datasetDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      locationsName: freezed == locationsName
          ? _value.locationsName
          : locationsName // ignore: cast_nullable_to_non_nullable
              as String?,
      dataid: freezed == dataid
          ? _value.dataid
          : dataid // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as List<LocationLocation>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecordsLocation implements _RecordsLocation {
  const _$_RecordsLocation(
      {this.datasetDescription,
      this.locationsName,
      this.dataid,
      final List<LocationLocation>? location})
      : _location = location;

  factory _$_RecordsLocation.fromJson(Map<String, dynamic> json) =>
      _$$_RecordsLocationFromJson(json);

  @override
  final String? datasetDescription;
  @override
  final String? locationsName;
  @override
  final String? dataid;
  final List<LocationLocation>? _location;
  @override
  List<LocationLocation>? get location {
    final value = _location;
    if (value == null) return null;
    if (_location is EqualUnmodifiableListView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RecordsLocation(datasetDescription: $datasetDescription, locationsName: $locationsName, dataid: $dataid, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordsLocation &&
            (identical(other.datasetDescription, datasetDescription) ||
                other.datasetDescription == datasetDescription) &&
            (identical(other.locationsName, locationsName) ||
                other.locationsName == locationsName) &&
            (identical(other.dataid, dataid) || other.dataid == dataid) &&
            const DeepCollectionEquality().equals(other._location, _location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, datasetDescription,
      locationsName, dataid, const DeepCollectionEquality().hash(_location));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecordsLocationCopyWith<_$_RecordsLocation> get copyWith =>
      __$$_RecordsLocationCopyWithImpl<_$_RecordsLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecordsLocationToJson(
      this,
    );
  }
}

abstract class _RecordsLocation implements RecordsLocation {
  const factory _RecordsLocation(
      {final String? datasetDescription,
      final String? locationsName,
      final String? dataid,
      final List<LocationLocation>? location}) = _$_RecordsLocation;

  factory _RecordsLocation.fromJson(Map<String, dynamic> json) =
      _$_RecordsLocation.fromJson;

  @override
  String? get datasetDescription;
  @override
  String? get locationsName;
  @override
  String? get dataid;
  @override
  List<LocationLocation>? get location;
  @override
  @JsonKey(ignore: true)
  _$$_RecordsLocationCopyWith<_$_RecordsLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationLocation _$LocationLocationFromJson(Map<String, dynamic> json) {
  return _LocationLocation.fromJson(json);
}

/// @nodoc
mixin _$LocationLocation {
  String? get locationName => throw _privateConstructorUsedError;
  String? get geocode => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  String? get lon => throw _privateConstructorUsedError;
  List<WeatherElement>? get weatherElement =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationLocationCopyWith<LocationLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationLocationCopyWith<$Res> {
  factory $LocationLocationCopyWith(
          LocationLocation value, $Res Function(LocationLocation) then) =
      _$LocationLocationCopyWithImpl<$Res, LocationLocation>;
  @useResult
  $Res call(
      {String? locationName,
      String? geocode,
      String? lat,
      String? lon,
      List<WeatherElement>? weatherElement});
}

/// @nodoc
class _$LocationLocationCopyWithImpl<$Res, $Val extends LocationLocation>
    implements $LocationLocationCopyWith<$Res> {
  _$LocationLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationName = freezed,
    Object? geocode = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? weatherElement = freezed,
  }) {
    return _then(_value.copyWith(
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      geocode: freezed == geocode
          ? _value.geocode
          : geocode // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      weatherElement: freezed == weatherElement
          ? _value.weatherElement
          : weatherElement // ignore: cast_nullable_to_non_nullable
              as List<WeatherElement>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationLocationCopyWith<$Res>
    implements $LocationLocationCopyWith<$Res> {
  factory _$$_LocationLocationCopyWith(
          _$_LocationLocation value, $Res Function(_$_LocationLocation) then) =
      __$$_LocationLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? locationName,
      String? geocode,
      String? lat,
      String? lon,
      List<WeatherElement>? weatherElement});
}

/// @nodoc
class __$$_LocationLocationCopyWithImpl<$Res>
    extends _$LocationLocationCopyWithImpl<$Res, _$_LocationLocation>
    implements _$$_LocationLocationCopyWith<$Res> {
  __$$_LocationLocationCopyWithImpl(
      _$_LocationLocation _value, $Res Function(_$_LocationLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationName = freezed,
    Object? geocode = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? weatherElement = freezed,
  }) {
    return _then(_$_LocationLocation(
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      geocode: freezed == geocode
          ? _value.geocode
          : geocode // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      weatherElement: freezed == weatherElement
          ? _value._weatherElement
          : weatherElement // ignore: cast_nullable_to_non_nullable
              as List<WeatherElement>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocationLocation implements _LocationLocation {
  const _$_LocationLocation(
      {this.locationName,
      this.geocode,
      this.lat,
      this.lon,
      final List<WeatherElement>? weatherElement})
      : _weatherElement = weatherElement;

  factory _$_LocationLocation.fromJson(Map<String, dynamic> json) =>
      _$$_LocationLocationFromJson(json);

  @override
  final String? locationName;
  @override
  final String? geocode;
  @override
  final String? lat;
  @override
  final String? lon;
  final List<WeatherElement>? _weatherElement;
  @override
  List<WeatherElement>? get weatherElement {
    final value = _weatherElement;
    if (value == null) return null;
    if (_weatherElement is EqualUnmodifiableListView) return _weatherElement;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LocationLocation(locationName: $locationName, geocode: $geocode, lat: $lat, lon: $lon, weatherElement: $weatherElement)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationLocation &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.geocode, geocode) || other.geocode == geocode) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            const DeepCollectionEquality()
                .equals(other._weatherElement, _weatherElement));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, locationName, geocode, lat, lon,
      const DeepCollectionEquality().hash(_weatherElement));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationLocationCopyWith<_$_LocationLocation> get copyWith =>
      __$$_LocationLocationCopyWithImpl<_$_LocationLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationLocationToJson(
      this,
    );
  }
}

abstract class _LocationLocation implements LocationLocation {
  const factory _LocationLocation(
      {final String? locationName,
      final String? geocode,
      final String? lat,
      final String? lon,
      final List<WeatherElement>? weatherElement}) = _$_LocationLocation;

  factory _LocationLocation.fromJson(Map<String, dynamic> json) =
      _$_LocationLocation.fromJson;

  @override
  String? get locationName;
  @override
  String? get geocode;
  @override
  String? get lat;
  @override
  String? get lon;
  @override
  List<WeatherElement>? get weatherElement;
  @override
  @JsonKey(ignore: true)
  _$$_LocationLocationCopyWith<_$_LocationLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherElement _$WeatherElementFromJson(Map<String, dynamic> json) {
  return _WeatherElement.fromJson(json);
}

/// @nodoc
mixin _$WeatherElement {
  String? get elementName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<Time>? get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherElementCopyWith<WeatherElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherElementCopyWith<$Res> {
  factory $WeatherElementCopyWith(
          WeatherElement value, $Res Function(WeatherElement) then) =
      _$WeatherElementCopyWithImpl<$Res, WeatherElement>;
  @useResult
  $Res call({String? elementName, String? description, List<Time>? time});
}

/// @nodoc
class _$WeatherElementCopyWithImpl<$Res, $Val extends WeatherElement>
    implements $WeatherElementCopyWith<$Res> {
  _$WeatherElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elementName = freezed,
    Object? description = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      elementName: freezed == elementName
          ? _value.elementName
          : elementName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as List<Time>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherElementCopyWith<$Res>
    implements $WeatherElementCopyWith<$Res> {
  factory _$$_WeatherElementCopyWith(
          _$_WeatherElement value, $Res Function(_$_WeatherElement) then) =
      __$$_WeatherElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? elementName, String? description, List<Time>? time});
}

/// @nodoc
class __$$_WeatherElementCopyWithImpl<$Res>
    extends _$WeatherElementCopyWithImpl<$Res, _$_WeatherElement>
    implements _$$_WeatherElementCopyWith<$Res> {
  __$$_WeatherElementCopyWithImpl(
      _$_WeatherElement _value, $Res Function(_$_WeatherElement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elementName = freezed,
    Object? description = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_WeatherElement(
      elementName: freezed == elementName
          ? _value.elementName
          : elementName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value._time
          : time // ignore: cast_nullable_to_non_nullable
              as List<Time>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherElement implements _WeatherElement {
  const _$_WeatherElement(
      {this.elementName, this.description, final List<Time>? time})
      : _time = time;

  factory _$_WeatherElement.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherElementFromJson(json);

  @override
  final String? elementName;
  @override
  final String? description;
  final List<Time>? _time;
  @override
  List<Time>? get time {
    final value = _time;
    if (value == null) return null;
    if (_time is EqualUnmodifiableListView) return _time;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WeatherElement(elementName: $elementName, description: $description, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherElement &&
            (identical(other.elementName, elementName) ||
                other.elementName == elementName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._time, _time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, elementName, description,
      const DeepCollectionEquality().hash(_time));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherElementCopyWith<_$_WeatherElement> get copyWith =>
      __$$_WeatherElementCopyWithImpl<_$_WeatherElement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherElementToJson(
      this,
    );
  }
}

abstract class _WeatherElement implements WeatherElement {
  const factory _WeatherElement(
      {final String? elementName,
      final String? description,
      final List<Time>? time}) = _$_WeatherElement;

  factory _WeatherElement.fromJson(Map<String, dynamic> json) =
      _$_WeatherElement.fromJson;

  @override
  String? get elementName;
  @override
  String? get description;
  @override
  List<Time>? get time;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherElementCopyWith<_$_WeatherElement> get copyWith =>
      throw _privateConstructorUsedError;
}

Time _$TimeFromJson(Map<String, dynamic> json) {
  return _Time.fromJson(json);
}

/// @nodoc
mixin _$Time {
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  List<ElementValue>? get elementValue => throw _privateConstructorUsedError;
  DateTime? get dataTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeCopyWith<Time> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeCopyWith<$Res> {
  factory $TimeCopyWith(Time value, $Res Function(Time) then) =
      _$TimeCopyWithImpl<$Res, Time>;
  @useResult
  $Res call(
      {DateTime? startTime,
      DateTime? endTime,
      List<ElementValue>? elementValue,
      DateTime? dataTime});
}

/// @nodoc
class _$TimeCopyWithImpl<$Res, $Val extends Time>
    implements $TimeCopyWith<$Res> {
  _$TimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? elementValue = freezed,
    Object? dataTime = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      elementValue: freezed == elementValue
          ? _value.elementValue
          : elementValue // ignore: cast_nullable_to_non_nullable
              as List<ElementValue>?,
      dataTime: freezed == dataTime
          ? _value.dataTime
          : dataTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeCopyWith<$Res> implements $TimeCopyWith<$Res> {
  factory _$$_TimeCopyWith(_$_Time value, $Res Function(_$_Time) then) =
      __$$_TimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startTime,
      DateTime? endTime,
      List<ElementValue>? elementValue,
      DateTime? dataTime});
}

/// @nodoc
class __$$_TimeCopyWithImpl<$Res> extends _$TimeCopyWithImpl<$Res, _$_Time>
    implements _$$_TimeCopyWith<$Res> {
  __$$_TimeCopyWithImpl(_$_Time _value, $Res Function(_$_Time) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? elementValue = freezed,
    Object? dataTime = freezed,
  }) {
    return _then(_$_Time(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      elementValue: freezed == elementValue
          ? _value._elementValue
          : elementValue // ignore: cast_nullable_to_non_nullable
              as List<ElementValue>?,
      dataTime: freezed == dataTime
          ? _value.dataTime
          : dataTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Time implements _Time {
  const _$_Time(
      {this.startTime,
      this.endTime,
      final List<ElementValue>? elementValue,
      this.dataTime})
      : _elementValue = elementValue;

  factory _$_Time.fromJson(Map<String, dynamic> json) => _$$_TimeFromJson(json);

  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  final List<ElementValue>? _elementValue;
  @override
  List<ElementValue>? get elementValue {
    final value = _elementValue;
    if (value == null) return null;
    if (_elementValue is EqualUnmodifiableListView) return _elementValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? dataTime;

  @override
  String toString() {
    return 'Time(startTime: $startTime, endTime: $endTime, elementValue: $elementValue, dataTime: $dataTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Time &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality()
                .equals(other._elementValue, _elementValue) &&
            (identical(other.dataTime, dataTime) ||
                other.dataTime == dataTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime,
      const DeepCollectionEquality().hash(_elementValue), dataTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeCopyWith<_$_Time> get copyWith =>
      __$$_TimeCopyWithImpl<_$_Time>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeToJson(
      this,
    );
  }
}

abstract class _Time implements Time {
  const factory _Time(
      {final DateTime? startTime,
      final DateTime? endTime,
      final List<ElementValue>? elementValue,
      final DateTime? dataTime}) = _$_Time;

  factory _Time.fromJson(Map<String, dynamic> json) = _$_Time.fromJson;

  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override
  List<ElementValue>? get elementValue;
  @override
  DateTime? get dataTime;
  @override
  @JsonKey(ignore: true)
  _$$_TimeCopyWith<_$_Time> get copyWith => throw _privateConstructorUsedError;
}

ElementValue _$ElementValueFromJson(Map<String, dynamic> json) {
  return _ElementValue.fromJson(json);
}

/// @nodoc
mixin _$ElementValue {
  String? get value => throw _privateConstructorUsedError;
  String? get measures => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElementValueCopyWith<ElementValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElementValueCopyWith<$Res> {
  factory $ElementValueCopyWith(
          ElementValue value, $Res Function(ElementValue) then) =
      _$ElementValueCopyWithImpl<$Res, ElementValue>;
  @useResult
  $Res call({String? value, String? measures});
}

/// @nodoc
class _$ElementValueCopyWithImpl<$Res, $Val extends ElementValue>
    implements $ElementValueCopyWith<$Res> {
  _$ElementValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? measures = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      measures: freezed == measures
          ? _value.measures
          : measures // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ElementValueCopyWith<$Res>
    implements $ElementValueCopyWith<$Res> {
  factory _$$_ElementValueCopyWith(
          _$_ElementValue value, $Res Function(_$_ElementValue) then) =
      __$$_ElementValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? value, String? measures});
}

/// @nodoc
class __$$_ElementValueCopyWithImpl<$Res>
    extends _$ElementValueCopyWithImpl<$Res, _$_ElementValue>
    implements _$$_ElementValueCopyWith<$Res> {
  __$$_ElementValueCopyWithImpl(
      _$_ElementValue _value, $Res Function(_$_ElementValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? measures = freezed,
  }) {
    return _then(_$_ElementValue(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      measures: freezed == measures
          ? _value.measures
          : measures // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ElementValue implements _ElementValue {
  const _$_ElementValue({this.value, this.measures});

  factory _$_ElementValue.fromJson(Map<String, dynamic> json) =>
      _$$_ElementValueFromJson(json);

  @override
  final String? value;
  @override
  final String? measures;

  @override
  String toString() {
    return 'ElementValue(value: $value, measures: $measures)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ElementValue &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.measures, measures) ||
                other.measures == measures));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, measures);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ElementValueCopyWith<_$_ElementValue> get copyWith =>
      __$$_ElementValueCopyWithImpl<_$_ElementValue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ElementValueToJson(
      this,
    );
  }
}

abstract class _ElementValue implements ElementValue {
  const factory _ElementValue({final String? value, final String? measures}) =
      _$_ElementValue;

  factory _ElementValue.fromJson(Map<String, dynamic> json) =
      _$_ElementValue.fromJson;

  @override
  String? get value;
  @override
  String? get measures;
  @override
  @JsonKey(ignore: true)
  _$$_ElementValueCopyWith<_$_ElementValue> get copyWith =>
      throw _privateConstructorUsedError;
}

Field _$FieldFromJson(Map<String, dynamic> json) {
  return _Field.fromJson(json);
}

/// @nodoc
mixin _$Field {
  String? get id => throw _privateConstructorUsedError;
  Type? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldCopyWith<Field> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldCopyWith<$Res> {
  factory $FieldCopyWith(Field value, $Res Function(Field) then) =
      _$FieldCopyWithImpl<$Res, Field>;
  @useResult
  $Res call({String? id, Type? type});
}

/// @nodoc
class _$FieldCopyWithImpl<$Res, $Val extends Field>
    implements $FieldCopyWith<$Res> {
  _$FieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldCopyWith<$Res> implements $FieldCopyWith<$Res> {
  factory _$$_FieldCopyWith(_$_Field value, $Res Function(_$_Field) then) =
      __$$_FieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, Type? type});
}

/// @nodoc
class __$$_FieldCopyWithImpl<$Res> extends _$FieldCopyWithImpl<$Res, _$_Field>
    implements _$$_FieldCopyWith<$Res> {
  __$$_FieldCopyWithImpl(_$_Field _value, $Res Function(_$_Field) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_Field(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Field implements _Field {
  const _$_Field({this.id, this.type});

  factory _$_Field.fromJson(Map<String, dynamic> json) =>
      _$$_FieldFromJson(json);

  @override
  final String? id;
  @override
  final Type? type;

  @override
  String toString() {
    return 'Field(id: $id, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Field &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FieldCopyWith<_$_Field> get copyWith =>
      __$$_FieldCopyWithImpl<_$_Field>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FieldToJson(
      this,
    );
  }
}

abstract class _Field implements Field {
  const factory _Field({final String? id, final Type? type}) = _$_Field;

  factory _Field.fromJson(Map<String, dynamic> json) = _$_Field.fromJson;

  @override
  String? get id;
  @override
  Type? get type;
  @override
  @JsonKey(ignore: true)
  _$$_FieldCopyWith<_$_Field> get copyWith =>
      throw _privateConstructorUsedError;
}
