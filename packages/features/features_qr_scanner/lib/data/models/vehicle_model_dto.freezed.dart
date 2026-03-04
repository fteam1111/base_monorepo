// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParkingZoneDto {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'description') String get description;@JsonKey(name: 'isActive') bool get isActive;@JsonKey(name: 'factoryId') int get factoryId;
/// Create a copy of ParkingZoneDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingZoneDtoCopyWith<ParkingZoneDto> get copyWith => _$ParkingZoneDtoCopyWithImpl<ParkingZoneDto>(this as ParkingZoneDto, _$identity);

  /// Serializes this ParkingZoneDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingZoneDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,isActive,factoryId);

@override
String toString() {
  return 'ParkingZoneDto(id: $id, name: $name, description: $description, isActive: $isActive, factoryId: $factoryId)';
}


}

/// @nodoc
abstract mixin class $ParkingZoneDtoCopyWith<$Res>  {
  factory $ParkingZoneDtoCopyWith(ParkingZoneDto value, $Res Function(ParkingZoneDto) _then) = _$ParkingZoneDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'isActive') bool isActive,@JsonKey(name: 'factoryId') int factoryId
});




}
/// @nodoc
class _$ParkingZoneDtoCopyWithImpl<$Res>
    implements $ParkingZoneDtoCopyWith<$Res> {
  _$ParkingZoneDtoCopyWithImpl(this._self, this._then);

  final ParkingZoneDto _self;
  final $Res Function(ParkingZoneDto) _then;

/// Create a copy of ParkingZoneDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? isActive = null,Object? factoryId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,factoryId: null == factoryId ? _self.factoryId : factoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ParkingZoneDto].
extension ParkingZoneDtoPatterns on ParkingZoneDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParkingZoneDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParkingZoneDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParkingZoneDto value)  $default,){
final _that = this;
switch (_that) {
case _ParkingZoneDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParkingZoneDto value)?  $default,){
final _that = this;
switch (_that) {
case _ParkingZoneDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'isActive')  bool isActive, @JsonKey(name: 'factoryId')  int factoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParkingZoneDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.isActive,_that.factoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'isActive')  bool isActive, @JsonKey(name: 'factoryId')  int factoryId)  $default,) {final _that = this;
switch (_that) {
case _ParkingZoneDto():
return $default(_that.id,_that.name,_that.description,_that.isActive,_that.factoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'isActive')  bool isActive, @JsonKey(name: 'factoryId')  int factoryId)?  $default,) {final _that = this;
switch (_that) {
case _ParkingZoneDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.isActive,_that.factoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParkingZoneDto implements ParkingZoneDto {
  const _ParkingZoneDto({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'description') required this.description, @JsonKey(name: 'isActive') required this.isActive, @JsonKey(name: 'factoryId') required this.factoryId});
  factory _ParkingZoneDto.fromJson(Map<String, dynamic> json) => _$ParkingZoneDtoFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'description') final  String description;
@override@JsonKey(name: 'isActive') final  bool isActive;
@override@JsonKey(name: 'factoryId') final  int factoryId;

/// Create a copy of ParkingZoneDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkingZoneDtoCopyWith<_ParkingZoneDto> get copyWith => __$ParkingZoneDtoCopyWithImpl<_ParkingZoneDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParkingZoneDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingZoneDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,isActive,factoryId);

@override
String toString() {
  return 'ParkingZoneDto(id: $id, name: $name, description: $description, isActive: $isActive, factoryId: $factoryId)';
}


}

/// @nodoc
abstract mixin class _$ParkingZoneDtoCopyWith<$Res> implements $ParkingZoneDtoCopyWith<$Res> {
  factory _$ParkingZoneDtoCopyWith(_ParkingZoneDto value, $Res Function(_ParkingZoneDto) _then) = __$ParkingZoneDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'isActive') bool isActive,@JsonKey(name: 'factoryId') int factoryId
});




}
/// @nodoc
class __$ParkingZoneDtoCopyWithImpl<$Res>
    implements _$ParkingZoneDtoCopyWith<$Res> {
  __$ParkingZoneDtoCopyWithImpl(this._self, this._then);

  final _ParkingZoneDto _self;
  final $Res Function(_ParkingZoneDto) _then;

/// Create a copy of ParkingZoneDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? isActive = null,Object? factoryId = null,}) {
  return _then(_ParkingZoneDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,factoryId: null == factoryId ? _self.factoryId : factoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ParkingLotDto {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'description') String get description;@JsonKey(name: 'parkingZoneId') int get parkingZoneId;@JsonKey(name: 'parkingZone') ParkingZoneDto get parkingZone;@JsonKey(name: 'maxCapacity') int get maxCapacity;@JsonKey(name: 'currentOccupied') int get currentOccupied;
/// Create a copy of ParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingLotDtoCopyWith<ParkingLotDto> get copyWith => _$ParkingLotDtoCopyWithImpl<ParkingLotDto>(this as ParkingLotDto, _$identity);

  /// Serializes this ParkingLotDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingLotDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.parkingZoneId, parkingZoneId) || other.parkingZoneId == parkingZoneId)&&(identical(other.parkingZone, parkingZone) || other.parkingZone == parkingZone)&&(identical(other.maxCapacity, maxCapacity) || other.maxCapacity == maxCapacity)&&(identical(other.currentOccupied, currentOccupied) || other.currentOccupied == currentOccupied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,parkingZoneId,parkingZone,maxCapacity,currentOccupied);

@override
String toString() {
  return 'ParkingLotDto(id: $id, name: $name, description: $description, parkingZoneId: $parkingZoneId, parkingZone: $parkingZone, maxCapacity: $maxCapacity, currentOccupied: $currentOccupied)';
}


}

/// @nodoc
abstract mixin class $ParkingLotDtoCopyWith<$Res>  {
  factory $ParkingLotDtoCopyWith(ParkingLotDto value, $Res Function(ParkingLotDto) _then) = _$ParkingLotDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'parkingZoneId') int parkingZoneId,@JsonKey(name: 'parkingZone') ParkingZoneDto parkingZone,@JsonKey(name: 'maxCapacity') int maxCapacity,@JsonKey(name: 'currentOccupied') int currentOccupied
});


$ParkingZoneDtoCopyWith<$Res> get parkingZone;

}
/// @nodoc
class _$ParkingLotDtoCopyWithImpl<$Res>
    implements $ParkingLotDtoCopyWith<$Res> {
  _$ParkingLotDtoCopyWithImpl(this._self, this._then);

  final ParkingLotDto _self;
  final $Res Function(ParkingLotDto) _then;

/// Create a copy of ParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? parkingZoneId = null,Object? parkingZone = null,Object? maxCapacity = null,Object? currentOccupied = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parkingZoneId: null == parkingZoneId ? _self.parkingZoneId : parkingZoneId // ignore: cast_nullable_to_non_nullable
as int,parkingZone: null == parkingZone ? _self.parkingZone : parkingZone // ignore: cast_nullable_to_non_nullable
as ParkingZoneDto,maxCapacity: null == maxCapacity ? _self.maxCapacity : maxCapacity // ignore: cast_nullable_to_non_nullable
as int,currentOccupied: null == currentOccupied ? _self.currentOccupied : currentOccupied // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParkingZoneDtoCopyWith<$Res> get parkingZone {
  
  return $ParkingZoneDtoCopyWith<$Res>(_self.parkingZone, (value) {
    return _then(_self.copyWith(parkingZone: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'parkingZoneId')  int parkingZoneId, @JsonKey(name: 'parkingZone')  ParkingZoneDto parkingZone, @JsonKey(name: 'maxCapacity')  int maxCapacity, @JsonKey(name: 'currentOccupied')  int currentOccupied)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParkingLotDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.parkingZoneId,_that.parkingZone,_that.maxCapacity,_that.currentOccupied);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'parkingZoneId')  int parkingZoneId, @JsonKey(name: 'parkingZone')  ParkingZoneDto parkingZone, @JsonKey(name: 'maxCapacity')  int maxCapacity, @JsonKey(name: 'currentOccupied')  int currentOccupied)  $default,) {final _that = this;
switch (_that) {
case _ParkingLotDto():
return $default(_that.id,_that.name,_that.description,_that.parkingZoneId,_that.parkingZone,_that.maxCapacity,_that.currentOccupied);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'parkingZoneId')  int parkingZoneId, @JsonKey(name: 'parkingZone')  ParkingZoneDto parkingZone, @JsonKey(name: 'maxCapacity')  int maxCapacity, @JsonKey(name: 'currentOccupied')  int currentOccupied)?  $default,) {final _that = this;
switch (_that) {
case _ParkingLotDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.parkingZoneId,_that.parkingZone,_that.maxCapacity,_that.currentOccupied);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParkingLotDto implements ParkingLotDto {
  const _ParkingLotDto({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'description') required this.description, @JsonKey(name: 'parkingZoneId') required this.parkingZoneId, @JsonKey(name: 'parkingZone') required this.parkingZone, @JsonKey(name: 'maxCapacity') required this.maxCapacity, @JsonKey(name: 'currentOccupied') required this.currentOccupied});
  factory _ParkingLotDto.fromJson(Map<String, dynamic> json) => _$ParkingLotDtoFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'description') final  String description;
@override@JsonKey(name: 'parkingZoneId') final  int parkingZoneId;
@override@JsonKey(name: 'parkingZone') final  ParkingZoneDto parkingZone;
@override@JsonKey(name: 'maxCapacity') final  int maxCapacity;
@override@JsonKey(name: 'currentOccupied') final  int currentOccupied;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingLotDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.parkingZoneId, parkingZoneId) || other.parkingZoneId == parkingZoneId)&&(identical(other.parkingZone, parkingZone) || other.parkingZone == parkingZone)&&(identical(other.maxCapacity, maxCapacity) || other.maxCapacity == maxCapacity)&&(identical(other.currentOccupied, currentOccupied) || other.currentOccupied == currentOccupied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,parkingZoneId,parkingZone,maxCapacity,currentOccupied);

@override
String toString() {
  return 'ParkingLotDto(id: $id, name: $name, description: $description, parkingZoneId: $parkingZoneId, parkingZone: $parkingZone, maxCapacity: $maxCapacity, currentOccupied: $currentOccupied)';
}


}

/// @nodoc
abstract mixin class _$ParkingLotDtoCopyWith<$Res> implements $ParkingLotDtoCopyWith<$Res> {
  factory _$ParkingLotDtoCopyWith(_ParkingLotDto value, $Res Function(_ParkingLotDto) _then) = __$ParkingLotDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'parkingZoneId') int parkingZoneId,@JsonKey(name: 'parkingZone') ParkingZoneDto parkingZone,@JsonKey(name: 'maxCapacity') int maxCapacity,@JsonKey(name: 'currentOccupied') int currentOccupied
});


@override $ParkingZoneDtoCopyWith<$Res> get parkingZone;

}
/// @nodoc
class __$ParkingLotDtoCopyWithImpl<$Res>
    implements _$ParkingLotDtoCopyWith<$Res> {
  __$ParkingLotDtoCopyWithImpl(this._self, this._then);

  final _ParkingLotDto _self;
  final $Res Function(_ParkingLotDto) _then;

/// Create a copy of ParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? parkingZoneId = null,Object? parkingZone = null,Object? maxCapacity = null,Object? currentOccupied = null,}) {
  return _then(_ParkingLotDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parkingZoneId: null == parkingZoneId ? _self.parkingZoneId : parkingZoneId // ignore: cast_nullable_to_non_nullable
as int,parkingZone: null == parkingZone ? _self.parkingZone : parkingZone // ignore: cast_nullable_to_non_nullable
as ParkingZoneDto,maxCapacity: null == maxCapacity ? _self.maxCapacity : maxCapacity // ignore: cast_nullable_to_non_nullable
as int,currentOccupied: null == currentOccupied ? _self.currentOccupied : currentOccupied // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParkingZoneDtoCopyWith<$Res> get parkingZone {
  
  return $ParkingZoneDtoCopyWith<$Res>(_self.parkingZone, (value) {
    return _then(_self.copyWith(parkingZone: value));
  });
}
}


/// @nodoc
mixin _$VehicleFactoryDto {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'address') String get address;
/// Create a copy of VehicleFactoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleFactoryDtoCopyWith<VehicleFactoryDto> get copyWith => _$VehicleFactoryDtoCopyWithImpl<VehicleFactoryDto>(this as VehicleFactoryDto, _$identity);

  /// Serializes this VehicleFactoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleFactoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address);

@override
String toString() {
  return 'VehicleFactoryDto(id: $id, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class $VehicleFactoryDtoCopyWith<$Res>  {
  factory $VehicleFactoryDtoCopyWith(VehicleFactoryDto value, $Res Function(VehicleFactoryDto) _then) = _$VehicleFactoryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'address') String address
});




}
/// @nodoc
class _$VehicleFactoryDtoCopyWithImpl<$Res>
    implements $VehicleFactoryDtoCopyWith<$Res> {
  _$VehicleFactoryDtoCopyWithImpl(this._self, this._then);

  final VehicleFactoryDto _self;
  final $Res Function(VehicleFactoryDto) _then;

/// Create a copy of VehicleFactoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleFactoryDto].
extension VehicleFactoryDtoPatterns on VehicleFactoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleFactoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleFactoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleFactoryDto value)  $default,){
final _that = this;
switch (_that) {
case _VehicleFactoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleFactoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleFactoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'address')  String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleFactoryDto() when $default != null:
return $default(_that.id,_that.name,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'address')  String address)  $default,) {final _that = this;
switch (_that) {
case _VehicleFactoryDto():
return $default(_that.id,_that.name,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'address')  String address)?  $default,) {final _that = this;
switch (_that) {
case _VehicleFactoryDto() when $default != null:
return $default(_that.id,_that.name,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleFactoryDto implements VehicleFactoryDto {
  const _VehicleFactoryDto({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'address') required this.address});
  factory _VehicleFactoryDto.fromJson(Map<String, dynamic> json) => _$VehicleFactoryDtoFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'address') final  String address;

/// Create a copy of VehicleFactoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleFactoryDtoCopyWith<_VehicleFactoryDto> get copyWith => __$VehicleFactoryDtoCopyWithImpl<_VehicleFactoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleFactoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleFactoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address);

@override
String toString() {
  return 'VehicleFactoryDto(id: $id, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class _$VehicleFactoryDtoCopyWith<$Res> implements $VehicleFactoryDtoCopyWith<$Res> {
  factory _$VehicleFactoryDtoCopyWith(_VehicleFactoryDto value, $Res Function(_VehicleFactoryDto) _then) = __$VehicleFactoryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'address') String address
});




}
/// @nodoc
class __$VehicleFactoryDtoCopyWithImpl<$Res>
    implements _$VehicleFactoryDtoCopyWith<$Res> {
  __$VehicleFactoryDtoCopyWithImpl(this._self, this._then);

  final _VehicleFactoryDto _self;
  final $Res Function(_VehicleFactoryDto) _then;

/// Create a copy of VehicleFactoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,}) {
  return _then(_VehicleFactoryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$VehicleDto {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'serialNumber') String get serialNumber;@JsonKey(name: 'materialCode') String get materialCode;@JsonKey(name: 'model') String get model;@JsonKey(name: 'manufacturingDate') String get manufacturingDate;@JsonKey(name: 'color') String get color;@JsonKey(name: 'status') int get status;@JsonKey(name: 'statusLabel') String get statusLabel;@JsonKey(name: 'warehouseImportedAt') String get warehouseImportedAt;@JsonKey(name: 'storageDays') int get storageDays;@JsonKey(name: 'exportedAt') String? get exportedAt;@JsonKey(name: 'qcDefectDescription') String? get qcDefectDescription;@JsonKey(name: 'factory') VehicleFactoryDto? get factory;@JsonKey(name: 'parkingLot') ParkingLotDto? get parkingLot;
/// Create a copy of VehicleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleDtoCopyWith<VehicleDto> get copyWith => _$VehicleDtoCopyWithImpl<VehicleDto>(this as VehicleDto, _$identity);

  /// Serializes this VehicleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.materialCode, materialCode) || other.materialCode == materialCode)&&(identical(other.model, model) || other.model == model)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.warehouseImportedAt, warehouseImportedAt) || other.warehouseImportedAt == warehouseImportedAt)&&(identical(other.storageDays, storageDays) || other.storageDays == storageDays)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&(identical(other.qcDefectDescription, qcDefectDescription) || other.qcDefectDescription == qcDefectDescription)&&(identical(other.factory, factory) || other.factory == factory)&&(identical(other.parkingLot, parkingLot) || other.parkingLot == parkingLot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serialNumber,materialCode,model,manufacturingDate,color,status,statusLabel,warehouseImportedAt,storageDays,exportedAt,qcDefectDescription,factory,parkingLot);

@override
String toString() {
  return 'VehicleDto(id: $id, serialNumber: $serialNumber, materialCode: $materialCode, model: $model, manufacturingDate: $manufacturingDate, color: $color, status: $status, statusLabel: $statusLabel, warehouseImportedAt: $warehouseImportedAt, storageDays: $storageDays, exportedAt: $exportedAt, qcDefectDescription: $qcDefectDescription, factory: $factory, parkingLot: $parkingLot)';
}


}

/// @nodoc
abstract mixin class $VehicleDtoCopyWith<$Res>  {
  factory $VehicleDtoCopyWith(VehicleDto value, $Res Function(VehicleDto) _then) = _$VehicleDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'serialNumber') String serialNumber,@JsonKey(name: 'materialCode') String materialCode,@JsonKey(name: 'model') String model,@JsonKey(name: 'manufacturingDate') String manufacturingDate,@JsonKey(name: 'color') String color,@JsonKey(name: 'status') int status,@JsonKey(name: 'statusLabel') String statusLabel,@JsonKey(name: 'warehouseImportedAt') String warehouseImportedAt,@JsonKey(name: 'storageDays') int storageDays,@JsonKey(name: 'exportedAt') String? exportedAt,@JsonKey(name: 'qcDefectDescription') String? qcDefectDescription,@JsonKey(name: 'factory') VehicleFactoryDto? factory,@JsonKey(name: 'parkingLot') ParkingLotDto? parkingLot
});


$VehicleFactoryDtoCopyWith<$Res>? get factory;$ParkingLotDtoCopyWith<$Res>? get parkingLot;

}
/// @nodoc
class _$VehicleDtoCopyWithImpl<$Res>
    implements $VehicleDtoCopyWith<$Res> {
  _$VehicleDtoCopyWithImpl(this._self, this._then);

  final VehicleDto _self;
  final $Res Function(VehicleDto) _then;

/// Create a copy of VehicleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serialNumber = null,Object? materialCode = null,Object? model = null,Object? manufacturingDate = null,Object? color = null,Object? status = null,Object? statusLabel = null,Object? warehouseImportedAt = null,Object? storageDays = null,Object? exportedAt = freezed,Object? qcDefectDescription = freezed,Object? factory = freezed,Object? parkingLot = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serialNumber: null == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String,materialCode: null == materialCode ? _self.materialCode : materialCode // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,manufacturingDate: null == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,warehouseImportedAt: null == warehouseImportedAt ? _self.warehouseImportedAt : warehouseImportedAt // ignore: cast_nullable_to_non_nullable
as String,storageDays: null == storageDays ? _self.storageDays : storageDays // ignore: cast_nullable_to_non_nullable
as int,exportedAt: freezed == exportedAt ? _self.exportedAt : exportedAt // ignore: cast_nullable_to_non_nullable
as String?,qcDefectDescription: freezed == qcDefectDescription ? _self.qcDefectDescription : qcDefectDescription // ignore: cast_nullable_to_non_nullable
as String?,factory: freezed == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as VehicleFactoryDto?,parkingLot: freezed == parkingLot ? _self.parkingLot : parkingLot // ignore: cast_nullable_to_non_nullable
as ParkingLotDto?,
  ));
}
/// Create a copy of VehicleDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleFactoryDtoCopyWith<$Res>? get factory {
    if (_self.factory == null) {
    return null;
  }

  return $VehicleFactoryDtoCopyWith<$Res>(_self.factory!, (value) {
    return _then(_self.copyWith(factory: value));
  });
}/// Create a copy of VehicleDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParkingLotDtoCopyWith<$Res>? get parkingLot {
    if (_self.parkingLot == null) {
    return null;
  }

  return $ParkingLotDtoCopyWith<$Res>(_self.parkingLot!, (value) {
    return _then(_self.copyWith(parkingLot: value));
  });
}
}


/// Adds pattern-matching-related methods to [VehicleDto].
extension VehicleDtoPatterns on VehicleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleDto value)  $default,){
final _that = this;
switch (_that) {
case _VehicleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleDto value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'serialNumber')  String serialNumber, @JsonKey(name: 'materialCode')  String materialCode, @JsonKey(name: 'model')  String model, @JsonKey(name: 'manufacturingDate')  String manufacturingDate, @JsonKey(name: 'color')  String color, @JsonKey(name: 'status')  int status, @JsonKey(name: 'statusLabel')  String statusLabel, @JsonKey(name: 'warehouseImportedAt')  String warehouseImportedAt, @JsonKey(name: 'storageDays')  int storageDays, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription, @JsonKey(name: 'factory')  VehicleFactoryDto? factory, @JsonKey(name: 'parkingLot')  ParkingLotDto? parkingLot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleDto() when $default != null:
return $default(_that.id,_that.serialNumber,_that.materialCode,_that.model,_that.manufacturingDate,_that.color,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.storageDays,_that.exportedAt,_that.qcDefectDescription,_that.factory,_that.parkingLot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'serialNumber')  String serialNumber, @JsonKey(name: 'materialCode')  String materialCode, @JsonKey(name: 'model')  String model, @JsonKey(name: 'manufacturingDate')  String manufacturingDate, @JsonKey(name: 'color')  String color, @JsonKey(name: 'status')  int status, @JsonKey(name: 'statusLabel')  String statusLabel, @JsonKey(name: 'warehouseImportedAt')  String warehouseImportedAt, @JsonKey(name: 'storageDays')  int storageDays, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription, @JsonKey(name: 'factory')  VehicleFactoryDto? factory, @JsonKey(name: 'parkingLot')  ParkingLotDto? parkingLot)  $default,) {final _that = this;
switch (_that) {
case _VehicleDto():
return $default(_that.id,_that.serialNumber,_that.materialCode,_that.model,_that.manufacturingDate,_that.color,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.storageDays,_that.exportedAt,_that.qcDefectDescription,_that.factory,_that.parkingLot);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'serialNumber')  String serialNumber, @JsonKey(name: 'materialCode')  String materialCode, @JsonKey(name: 'model')  String model, @JsonKey(name: 'manufacturingDate')  String manufacturingDate, @JsonKey(name: 'color')  String color, @JsonKey(name: 'status')  int status, @JsonKey(name: 'statusLabel')  String statusLabel, @JsonKey(name: 'warehouseImportedAt')  String warehouseImportedAt, @JsonKey(name: 'storageDays')  int storageDays, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription, @JsonKey(name: 'factory')  VehicleFactoryDto? factory, @JsonKey(name: 'parkingLot')  ParkingLotDto? parkingLot)?  $default,) {final _that = this;
switch (_that) {
case _VehicleDto() when $default != null:
return $default(_that.id,_that.serialNumber,_that.materialCode,_that.model,_that.manufacturingDate,_that.color,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.storageDays,_that.exportedAt,_that.qcDefectDescription,_that.factory,_that.parkingLot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleDto implements VehicleDto {
  const _VehicleDto({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'serialNumber') required this.serialNumber, @JsonKey(name: 'materialCode') required this.materialCode, @JsonKey(name: 'model') required this.model, @JsonKey(name: 'manufacturingDate') required this.manufacturingDate, @JsonKey(name: 'color') required this.color, @JsonKey(name: 'status') required this.status, @JsonKey(name: 'statusLabel') required this.statusLabel, @JsonKey(name: 'warehouseImportedAt') required this.warehouseImportedAt, @JsonKey(name: 'storageDays') this.storageDays = 0, @JsonKey(name: 'exportedAt') this.exportedAt, @JsonKey(name: 'qcDefectDescription') this.qcDefectDescription, @JsonKey(name: 'factory') this.factory, @JsonKey(name: 'parkingLot') this.parkingLot});
  factory _VehicleDto.fromJson(Map<String, dynamic> json) => _$VehicleDtoFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'serialNumber') final  String serialNumber;
@override@JsonKey(name: 'materialCode') final  String materialCode;
@override@JsonKey(name: 'model') final  String model;
@override@JsonKey(name: 'manufacturingDate') final  String manufacturingDate;
@override@JsonKey(name: 'color') final  String color;
@override@JsonKey(name: 'status') final  int status;
@override@JsonKey(name: 'statusLabel') final  String statusLabel;
@override@JsonKey(name: 'warehouseImportedAt') final  String warehouseImportedAt;
@override@JsonKey(name: 'storageDays') final  int storageDays;
@override@JsonKey(name: 'exportedAt') final  String? exportedAt;
@override@JsonKey(name: 'qcDefectDescription') final  String? qcDefectDescription;
@override@JsonKey(name: 'factory') final  VehicleFactoryDto? factory;
@override@JsonKey(name: 'parkingLot') final  ParkingLotDto? parkingLot;

/// Create a copy of VehicleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleDtoCopyWith<_VehicleDto> get copyWith => __$VehicleDtoCopyWithImpl<_VehicleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.materialCode, materialCode) || other.materialCode == materialCode)&&(identical(other.model, model) || other.model == model)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.warehouseImportedAt, warehouseImportedAt) || other.warehouseImportedAt == warehouseImportedAt)&&(identical(other.storageDays, storageDays) || other.storageDays == storageDays)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&(identical(other.qcDefectDescription, qcDefectDescription) || other.qcDefectDescription == qcDefectDescription)&&(identical(other.factory, factory) || other.factory == factory)&&(identical(other.parkingLot, parkingLot) || other.parkingLot == parkingLot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serialNumber,materialCode,model,manufacturingDate,color,status,statusLabel,warehouseImportedAt,storageDays,exportedAt,qcDefectDescription,factory,parkingLot);

@override
String toString() {
  return 'VehicleDto(id: $id, serialNumber: $serialNumber, materialCode: $materialCode, model: $model, manufacturingDate: $manufacturingDate, color: $color, status: $status, statusLabel: $statusLabel, warehouseImportedAt: $warehouseImportedAt, storageDays: $storageDays, exportedAt: $exportedAt, qcDefectDescription: $qcDefectDescription, factory: $factory, parkingLot: $parkingLot)';
}


}

/// @nodoc
abstract mixin class _$VehicleDtoCopyWith<$Res> implements $VehicleDtoCopyWith<$Res> {
  factory _$VehicleDtoCopyWith(_VehicleDto value, $Res Function(_VehicleDto) _then) = __$VehicleDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'serialNumber') String serialNumber,@JsonKey(name: 'materialCode') String materialCode,@JsonKey(name: 'model') String model,@JsonKey(name: 'manufacturingDate') String manufacturingDate,@JsonKey(name: 'color') String color,@JsonKey(name: 'status') int status,@JsonKey(name: 'statusLabel') String statusLabel,@JsonKey(name: 'warehouseImportedAt') String warehouseImportedAt,@JsonKey(name: 'storageDays') int storageDays,@JsonKey(name: 'exportedAt') String? exportedAt,@JsonKey(name: 'qcDefectDescription') String? qcDefectDescription,@JsonKey(name: 'factory') VehicleFactoryDto? factory,@JsonKey(name: 'parkingLot') ParkingLotDto? parkingLot
});


@override $VehicleFactoryDtoCopyWith<$Res>? get factory;@override $ParkingLotDtoCopyWith<$Res>? get parkingLot;

}
/// @nodoc
class __$VehicleDtoCopyWithImpl<$Res>
    implements _$VehicleDtoCopyWith<$Res> {
  __$VehicleDtoCopyWithImpl(this._self, this._then);

  final _VehicleDto _self;
  final $Res Function(_VehicleDto) _then;

/// Create a copy of VehicleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serialNumber = null,Object? materialCode = null,Object? model = null,Object? manufacturingDate = null,Object? color = null,Object? status = null,Object? statusLabel = null,Object? warehouseImportedAt = null,Object? storageDays = null,Object? exportedAt = freezed,Object? qcDefectDescription = freezed,Object? factory = freezed,Object? parkingLot = freezed,}) {
  return _then(_VehicleDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serialNumber: null == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String,materialCode: null == materialCode ? _self.materialCode : materialCode // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,manufacturingDate: null == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,warehouseImportedAt: null == warehouseImportedAt ? _self.warehouseImportedAt : warehouseImportedAt // ignore: cast_nullable_to_non_nullable
as String,storageDays: null == storageDays ? _self.storageDays : storageDays // ignore: cast_nullable_to_non_nullable
as int,exportedAt: freezed == exportedAt ? _self.exportedAt : exportedAt // ignore: cast_nullable_to_non_nullable
as String?,qcDefectDescription: freezed == qcDefectDescription ? _self.qcDefectDescription : qcDefectDescription // ignore: cast_nullable_to_non_nullable
as String?,factory: freezed == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as VehicleFactoryDto?,parkingLot: freezed == parkingLot ? _self.parkingLot : parkingLot // ignore: cast_nullable_to_non_nullable
as ParkingLotDto?,
  ));
}

/// Create a copy of VehicleDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleFactoryDtoCopyWith<$Res>? get factory {
    if (_self.factory == null) {
    return null;
  }

  return $VehicleFactoryDtoCopyWith<$Res>(_self.factory!, (value) {
    return _then(_self.copyWith(factory: value));
  });
}/// Create a copy of VehicleDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParkingLotDtoCopyWith<$Res>? get parkingLot {
    if (_self.parkingLot == null) {
    return null;
  }

  return $ParkingLotDtoCopyWith<$Res>(_self.parkingLot!, (value) {
    return _then(_self.copyWith(parkingLot: value));
  });
}
}

// dart format on
