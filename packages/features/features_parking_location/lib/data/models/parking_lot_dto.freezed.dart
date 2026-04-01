// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_lot_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParkingLotDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'description') String? get description;@JsonKey(name: 'parkingZoneId') int? get parkingZoneId;@JsonKey(name: 'maxCapacity') int? get maxCapacity;@JsonKey(name: 'currentOccupied') int? get currentOccupied;
/// Create a copy of ParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingLotDtoCopyWith<ParkingLotDto> get copyWith => _$ParkingLotDtoCopyWithImpl<ParkingLotDto>(this as ParkingLotDto, _$identity);

  /// Serializes this ParkingLotDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingLotDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.parkingZoneId, parkingZoneId) || other.parkingZoneId == parkingZoneId)&&(identical(other.maxCapacity, maxCapacity) || other.maxCapacity == maxCapacity)&&(identical(other.currentOccupied, currentOccupied) || other.currentOccupied == currentOccupied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,parkingZoneId,maxCapacity,currentOccupied);

@override
String toString() {
  return 'ParkingLotDto(id: $id, name: $name, description: $description, parkingZoneId: $parkingZoneId, maxCapacity: $maxCapacity, currentOccupied: $currentOccupied)';
}


}

/// @nodoc
abstract mixin class $ParkingLotDtoCopyWith<$Res>  {
  factory $ParkingLotDtoCopyWith(ParkingLotDto value, $Res Function(ParkingLotDto) _then) = _$ParkingLotDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'description') String? description,@JsonKey(name: 'parkingZoneId') int? parkingZoneId,@JsonKey(name: 'maxCapacity') int? maxCapacity,@JsonKey(name: 'currentOccupied') int? currentOccupied
});




}
/// @nodoc
class _$ParkingLotDtoCopyWithImpl<$Res>
    implements $ParkingLotDtoCopyWith<$Res> {
  _$ParkingLotDtoCopyWithImpl(this._self, this._then);

  final ParkingLotDto _self;
  final $Res Function(ParkingLotDto) _then;

/// Create a copy of ParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? parkingZoneId = freezed,Object? maxCapacity = freezed,Object? currentOccupied = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,parkingZoneId: freezed == parkingZoneId ? _self.parkingZoneId : parkingZoneId // ignore: cast_nullable_to_non_nullable
as int?,maxCapacity: freezed == maxCapacity ? _self.maxCapacity : maxCapacity // ignore: cast_nullable_to_non_nullable
as int?,currentOccupied: freezed == currentOccupied ? _self.currentOccupied : currentOccupied // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ParkingLotDto].
extension ParkingLotDtoPatterns on ParkingLotDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParkingLotDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParkingLotDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParkingLotDto value)  $default,){
final _that = this;
switch (_that) {
case _ParkingLotDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParkingLotDto value)?  $default,){
final _that = this;
switch (_that) {
case _ParkingLotDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'parkingZoneId')  int? parkingZoneId, @JsonKey(name: 'maxCapacity')  int? maxCapacity, @JsonKey(name: 'currentOccupied')  int? currentOccupied)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParkingLotDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.parkingZoneId,_that.maxCapacity,_that.currentOccupied);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'parkingZoneId')  int? parkingZoneId, @JsonKey(name: 'maxCapacity')  int? maxCapacity, @JsonKey(name: 'currentOccupied')  int? currentOccupied)  $default,) {final _that = this;
switch (_that) {
case _ParkingLotDto():
return $default(_that.id,_that.name,_that.description,_that.parkingZoneId,_that.maxCapacity,_that.currentOccupied);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'parkingZoneId')  int? parkingZoneId, @JsonKey(name: 'maxCapacity')  int? maxCapacity, @JsonKey(name: 'currentOccupied')  int? currentOccupied)?  $default,) {final _that = this;
switch (_that) {
case _ParkingLotDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.parkingZoneId,_that.maxCapacity,_that.currentOccupied);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParkingLotDto implements ParkingLotDto {
  const _ParkingLotDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'description') this.description, @JsonKey(name: 'parkingZoneId') this.parkingZoneId, @JsonKey(name: 'maxCapacity') this.maxCapacity, @JsonKey(name: 'currentOccupied') this.currentOccupied});
  factory _ParkingLotDto.fromJson(Map<String, dynamic> json) => _$ParkingLotDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'description') final  String? description;
@override@JsonKey(name: 'parkingZoneId') final  int? parkingZoneId;
@override@JsonKey(name: 'maxCapacity') final  int? maxCapacity;
@override@JsonKey(name: 'currentOccupied') final  int? currentOccupied;

/// Create a copy of ParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkingLotDtoCopyWith<_ParkingLotDto> get copyWith => __$ParkingLotDtoCopyWithImpl<_ParkingLotDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParkingLotDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingLotDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.parkingZoneId, parkingZoneId) || other.parkingZoneId == parkingZoneId)&&(identical(other.maxCapacity, maxCapacity) || other.maxCapacity == maxCapacity)&&(identical(other.currentOccupied, currentOccupied) || other.currentOccupied == currentOccupied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,parkingZoneId,maxCapacity,currentOccupied);

@override
String toString() {
  return 'ParkingLotDto(id: $id, name: $name, description: $description, parkingZoneId: $parkingZoneId, maxCapacity: $maxCapacity, currentOccupied: $currentOccupied)';
}


}

/// @nodoc
abstract mixin class _$ParkingLotDtoCopyWith<$Res> implements $ParkingLotDtoCopyWith<$Res> {
  factory _$ParkingLotDtoCopyWith(_ParkingLotDto value, $Res Function(_ParkingLotDto) _then) = __$ParkingLotDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'description') String? description,@JsonKey(name: 'parkingZoneId') int? parkingZoneId,@JsonKey(name: 'maxCapacity') int? maxCapacity,@JsonKey(name: 'currentOccupied') int? currentOccupied
});




}
/// @nodoc
class __$ParkingLotDtoCopyWithImpl<$Res>
    implements _$ParkingLotDtoCopyWith<$Res> {
  __$ParkingLotDtoCopyWithImpl(this._self, this._then);

  final _ParkingLotDto _self;
  final $Res Function(_ParkingLotDto) _then;

/// Create a copy of ParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? parkingZoneId = freezed,Object? maxCapacity = freezed,Object? currentOccupied = freezed,}) {
  return _then(_ParkingLotDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,parkingZoneId: freezed == parkingZoneId ? _self.parkingZoneId : parkingZoneId // ignore: cast_nullable_to_non_nullable
as int?,maxCapacity: freezed == maxCapacity ? _self.maxCapacity : maxCapacity // ignore: cast_nullable_to_non_nullable
as int?,currentOccupied: freezed == currentOccupied ? _self.currentOccupied : currentOccupied // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
