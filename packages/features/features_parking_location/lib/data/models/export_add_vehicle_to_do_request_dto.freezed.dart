// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'export_add_vehicle_to_do_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExportAddVehicleToDoRequestDto {

@JsonKey(name: 'vehicleId') String get vehicleId;
/// Create a copy of ExportAddVehicleToDoRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExportAddVehicleToDoRequestDtoCopyWith<ExportAddVehicleToDoRequestDto> get copyWith => _$ExportAddVehicleToDoRequestDtoCopyWithImpl<ExportAddVehicleToDoRequestDto>(this as ExportAddVehicleToDoRequestDto, _$identity);

  /// Serializes this ExportAddVehicleToDoRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExportAddVehicleToDoRequestDto&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleId);

@override
String toString() {
  return 'ExportAddVehicleToDoRequestDto(vehicleId: $vehicleId)';
}


}

/// @nodoc
abstract mixin class $ExportAddVehicleToDoRequestDtoCopyWith<$Res>  {
  factory $ExportAddVehicleToDoRequestDtoCopyWith(ExportAddVehicleToDoRequestDto value, $Res Function(ExportAddVehicleToDoRequestDto) _then) = _$ExportAddVehicleToDoRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'vehicleId') String vehicleId
});




}
/// @nodoc
class _$ExportAddVehicleToDoRequestDtoCopyWithImpl<$Res>
    implements $ExportAddVehicleToDoRequestDtoCopyWith<$Res> {
  _$ExportAddVehicleToDoRequestDtoCopyWithImpl(this._self, this._then);

  final ExportAddVehicleToDoRequestDto _self;
  final $Res Function(ExportAddVehicleToDoRequestDto) _then;

/// Create a copy of ExportAddVehicleToDoRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicleId = null,}) {
  return _then(_self.copyWith(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExportAddVehicleToDoRequestDto].
extension ExportAddVehicleToDoRequestDtoPatterns on ExportAddVehicleToDoRequestDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExportAddVehicleToDoRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExportAddVehicleToDoRequestDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExportAddVehicleToDoRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _ExportAddVehicleToDoRequestDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExportAddVehicleToDoRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _ExportAddVehicleToDoRequestDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'vehicleId')  String vehicleId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExportAddVehicleToDoRequestDto() when $default != null:
return $default(_that.vehicleId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'vehicleId')  String vehicleId)  $default,) {final _that = this;
switch (_that) {
case _ExportAddVehicleToDoRequestDto():
return $default(_that.vehicleId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'vehicleId')  String vehicleId)?  $default,) {final _that = this;
switch (_that) {
case _ExportAddVehicleToDoRequestDto() when $default != null:
return $default(_that.vehicleId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExportAddVehicleToDoRequestDto implements ExportAddVehicleToDoRequestDto {
  const _ExportAddVehicleToDoRequestDto({@JsonKey(name: 'vehicleId') required this.vehicleId});
  factory _ExportAddVehicleToDoRequestDto.fromJson(Map<String, dynamic> json) => _$ExportAddVehicleToDoRequestDtoFromJson(json);

@override@JsonKey(name: 'vehicleId') final  String vehicleId;

/// Create a copy of ExportAddVehicleToDoRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExportAddVehicleToDoRequestDtoCopyWith<_ExportAddVehicleToDoRequestDto> get copyWith => __$ExportAddVehicleToDoRequestDtoCopyWithImpl<_ExportAddVehicleToDoRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExportAddVehicleToDoRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExportAddVehicleToDoRequestDto&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleId);

@override
String toString() {
  return 'ExportAddVehicleToDoRequestDto(vehicleId: $vehicleId)';
}


}

/// @nodoc
abstract mixin class _$ExportAddVehicleToDoRequestDtoCopyWith<$Res> implements $ExportAddVehicleToDoRequestDtoCopyWith<$Res> {
  factory _$ExportAddVehicleToDoRequestDtoCopyWith(_ExportAddVehicleToDoRequestDto value, $Res Function(_ExportAddVehicleToDoRequestDto) _then) = __$ExportAddVehicleToDoRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'vehicleId') String vehicleId
});




}
/// @nodoc
class __$ExportAddVehicleToDoRequestDtoCopyWithImpl<$Res>
    implements _$ExportAddVehicleToDoRequestDtoCopyWith<$Res> {
  __$ExportAddVehicleToDoRequestDtoCopyWithImpl(this._self, this._then);

  final _ExportAddVehicleToDoRequestDto _self;
  final $Res Function(_ExportAddVehicleToDoRequestDto) _then;

/// Create a copy of ExportAddVehicleToDoRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicleId = null,}) {
  return _then(_ExportAddVehicleToDoRequestDto(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
