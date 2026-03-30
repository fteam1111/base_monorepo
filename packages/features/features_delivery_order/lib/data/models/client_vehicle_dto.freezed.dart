// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_vehicle_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientVehicleFactoryDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'address') String? get address;
/// Create a copy of ClientVehicleFactoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientVehicleFactoryDtoCopyWith<ClientVehicleFactoryDto> get copyWith => _$ClientVehicleFactoryDtoCopyWithImpl<ClientVehicleFactoryDto>(this as ClientVehicleFactoryDto, _$identity);

  /// Serializes this ClientVehicleFactoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientVehicleFactoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address);

@override
String toString() {
  return 'ClientVehicleFactoryDto(id: $id, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class $ClientVehicleFactoryDtoCopyWith<$Res>  {
  factory $ClientVehicleFactoryDtoCopyWith(ClientVehicleFactoryDto value, $Res Function(ClientVehicleFactoryDto) _then) = _$ClientVehicleFactoryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'address') String? address
});




}
/// @nodoc
class _$ClientVehicleFactoryDtoCopyWithImpl<$Res>
    implements $ClientVehicleFactoryDtoCopyWith<$Res> {
  _$ClientVehicleFactoryDtoCopyWithImpl(this._self, this._then);

  final ClientVehicleFactoryDto _self;
  final $Res Function(ClientVehicleFactoryDto) _then;

/// Create a copy of ClientVehicleFactoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? address = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientVehicleFactoryDto].
extension ClientVehicleFactoryDtoPatterns on ClientVehicleFactoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientVehicleFactoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientVehicleFactoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientVehicleFactoryDto value)  $default,){
final _that = this;
switch (_that) {
case _ClientVehicleFactoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientVehicleFactoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _ClientVehicleFactoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'address')  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientVehicleFactoryDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'address')  String? address)  $default,) {final _that = this;
switch (_that) {
case _ClientVehicleFactoryDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'address')  String? address)?  $default,) {final _that = this;
switch (_that) {
case _ClientVehicleFactoryDto() when $default != null:
return $default(_that.id,_that.name,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientVehicleFactoryDto implements ClientVehicleFactoryDto {
  const _ClientVehicleFactoryDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'address') this.address});
  factory _ClientVehicleFactoryDto.fromJson(Map<String, dynamic> json) => _$ClientVehicleFactoryDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'address') final  String? address;

/// Create a copy of ClientVehicleFactoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientVehicleFactoryDtoCopyWith<_ClientVehicleFactoryDto> get copyWith => __$ClientVehicleFactoryDtoCopyWithImpl<_ClientVehicleFactoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientVehicleFactoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientVehicleFactoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address);

@override
String toString() {
  return 'ClientVehicleFactoryDto(id: $id, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class _$ClientVehicleFactoryDtoCopyWith<$Res> implements $ClientVehicleFactoryDtoCopyWith<$Res> {
  factory _$ClientVehicleFactoryDtoCopyWith(_ClientVehicleFactoryDto value, $Res Function(_ClientVehicleFactoryDto) _then) = __$ClientVehicleFactoryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'address') String? address
});




}
/// @nodoc
class __$ClientVehicleFactoryDtoCopyWithImpl<$Res>
    implements _$ClientVehicleFactoryDtoCopyWith<$Res> {
  __$ClientVehicleFactoryDtoCopyWithImpl(this._self, this._then);

  final _ClientVehicleFactoryDto _self;
  final $Res Function(_ClientVehicleFactoryDto) _then;

/// Create a copy of ClientVehicleFactoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? address = freezed,}) {
  return _then(_ClientVehicleFactoryDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ClientVehicleParkingZoneDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'description') String? get description;@JsonKey(name: 'isActive') bool? get isActive;@JsonKey(name: 'factoryId') int? get factoryId;
/// Create a copy of ClientVehicleParkingZoneDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientVehicleParkingZoneDtoCopyWith<ClientVehicleParkingZoneDto> get copyWith => _$ClientVehicleParkingZoneDtoCopyWithImpl<ClientVehicleParkingZoneDto>(this as ClientVehicleParkingZoneDto, _$identity);

  /// Serializes this ClientVehicleParkingZoneDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientVehicleParkingZoneDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,isActive,factoryId);

@override
String toString() {
  return 'ClientVehicleParkingZoneDto(id: $id, name: $name, description: $description, isActive: $isActive, factoryId: $factoryId)';
}


}

/// @nodoc
abstract mixin class $ClientVehicleParkingZoneDtoCopyWith<$Res>  {
  factory $ClientVehicleParkingZoneDtoCopyWith(ClientVehicleParkingZoneDto value, $Res Function(ClientVehicleParkingZoneDto) _then) = _$ClientVehicleParkingZoneDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'description') String? description,@JsonKey(name: 'isActive') bool? isActive,@JsonKey(name: 'factoryId') int? factoryId
});




}
/// @nodoc
class _$ClientVehicleParkingZoneDtoCopyWithImpl<$Res>
    implements $ClientVehicleParkingZoneDtoCopyWith<$Res> {
  _$ClientVehicleParkingZoneDtoCopyWithImpl(this._self, this._then);

  final ClientVehicleParkingZoneDto _self;
  final $Res Function(ClientVehicleParkingZoneDto) _then;

/// Create a copy of ClientVehicleParkingZoneDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? isActive = freezed,Object? factoryId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,factoryId: freezed == factoryId ? _self.factoryId : factoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientVehicleParkingZoneDto].
extension ClientVehicleParkingZoneDtoPatterns on ClientVehicleParkingZoneDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientVehicleParkingZoneDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientVehicleParkingZoneDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientVehicleParkingZoneDto value)  $default,){
final _that = this;
switch (_that) {
case _ClientVehicleParkingZoneDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientVehicleParkingZoneDto value)?  $default,){
final _that = this;
switch (_that) {
case _ClientVehicleParkingZoneDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'isActive')  bool? isActive, @JsonKey(name: 'factoryId')  int? factoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientVehicleParkingZoneDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'isActive')  bool? isActive, @JsonKey(name: 'factoryId')  int? factoryId)  $default,) {final _that = this;
switch (_that) {
case _ClientVehicleParkingZoneDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'isActive')  bool? isActive, @JsonKey(name: 'factoryId')  int? factoryId)?  $default,) {final _that = this;
switch (_that) {
case _ClientVehicleParkingZoneDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.isActive,_that.factoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientVehicleParkingZoneDto implements ClientVehicleParkingZoneDto {
  const _ClientVehicleParkingZoneDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'description') this.description, @JsonKey(name: 'isActive') this.isActive, @JsonKey(name: 'factoryId') this.factoryId});
  factory _ClientVehicleParkingZoneDto.fromJson(Map<String, dynamic> json) => _$ClientVehicleParkingZoneDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'description') final  String? description;
@override@JsonKey(name: 'isActive') final  bool? isActive;
@override@JsonKey(name: 'factoryId') final  int? factoryId;

/// Create a copy of ClientVehicleParkingZoneDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientVehicleParkingZoneDtoCopyWith<_ClientVehicleParkingZoneDto> get copyWith => __$ClientVehicleParkingZoneDtoCopyWithImpl<_ClientVehicleParkingZoneDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientVehicleParkingZoneDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientVehicleParkingZoneDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,isActive,factoryId);

@override
String toString() {
  return 'ClientVehicleParkingZoneDto(id: $id, name: $name, description: $description, isActive: $isActive, factoryId: $factoryId)';
}


}

/// @nodoc
abstract mixin class _$ClientVehicleParkingZoneDtoCopyWith<$Res> implements $ClientVehicleParkingZoneDtoCopyWith<$Res> {
  factory _$ClientVehicleParkingZoneDtoCopyWith(_ClientVehicleParkingZoneDto value, $Res Function(_ClientVehicleParkingZoneDto) _then) = __$ClientVehicleParkingZoneDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'description') String? description,@JsonKey(name: 'isActive') bool? isActive,@JsonKey(name: 'factoryId') int? factoryId
});




}
/// @nodoc
class __$ClientVehicleParkingZoneDtoCopyWithImpl<$Res>
    implements _$ClientVehicleParkingZoneDtoCopyWith<$Res> {
  __$ClientVehicleParkingZoneDtoCopyWithImpl(this._self, this._then);

  final _ClientVehicleParkingZoneDto _self;
  final $Res Function(_ClientVehicleParkingZoneDto) _then;

/// Create a copy of ClientVehicleParkingZoneDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? isActive = freezed,Object? factoryId = freezed,}) {
  return _then(_ClientVehicleParkingZoneDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,factoryId: freezed == factoryId ? _self.factoryId : factoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ClientVehicleParkingLotDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'description') String? get description;@JsonKey(name: 'parkingZoneId') int? get parkingZoneId;@JsonKey(name: 'parkingZone') ClientVehicleParkingZoneDto? get parkingZone;@JsonKey(name: 'maxCapacity') int? get maxCapacity;@JsonKey(name: 'currentOccupied') int? get currentOccupied;
/// Create a copy of ClientVehicleParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientVehicleParkingLotDtoCopyWith<ClientVehicleParkingLotDto> get copyWith => _$ClientVehicleParkingLotDtoCopyWithImpl<ClientVehicleParkingLotDto>(this as ClientVehicleParkingLotDto, _$identity);

  /// Serializes this ClientVehicleParkingLotDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientVehicleParkingLotDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.parkingZoneId, parkingZoneId) || other.parkingZoneId == parkingZoneId)&&(identical(other.parkingZone, parkingZone) || other.parkingZone == parkingZone)&&(identical(other.maxCapacity, maxCapacity) || other.maxCapacity == maxCapacity)&&(identical(other.currentOccupied, currentOccupied) || other.currentOccupied == currentOccupied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,parkingZoneId,parkingZone,maxCapacity,currentOccupied);

@override
String toString() {
  return 'ClientVehicleParkingLotDto(id: $id, name: $name, description: $description, parkingZoneId: $parkingZoneId, parkingZone: $parkingZone, maxCapacity: $maxCapacity, currentOccupied: $currentOccupied)';
}


}

/// @nodoc
abstract mixin class $ClientVehicleParkingLotDtoCopyWith<$Res>  {
  factory $ClientVehicleParkingLotDtoCopyWith(ClientVehicleParkingLotDto value, $Res Function(ClientVehicleParkingLotDto) _then) = _$ClientVehicleParkingLotDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'description') String? description,@JsonKey(name: 'parkingZoneId') int? parkingZoneId,@JsonKey(name: 'parkingZone') ClientVehicleParkingZoneDto? parkingZone,@JsonKey(name: 'maxCapacity') int? maxCapacity,@JsonKey(name: 'currentOccupied') int? currentOccupied
});


$ClientVehicleParkingZoneDtoCopyWith<$Res>? get parkingZone;

}
/// @nodoc
class _$ClientVehicleParkingLotDtoCopyWithImpl<$Res>
    implements $ClientVehicleParkingLotDtoCopyWith<$Res> {
  _$ClientVehicleParkingLotDtoCopyWithImpl(this._self, this._then);

  final ClientVehicleParkingLotDto _self;
  final $Res Function(ClientVehicleParkingLotDto) _then;

/// Create a copy of ClientVehicleParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? parkingZoneId = freezed,Object? parkingZone = freezed,Object? maxCapacity = freezed,Object? currentOccupied = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,parkingZoneId: freezed == parkingZoneId ? _self.parkingZoneId : parkingZoneId // ignore: cast_nullable_to_non_nullable
as int?,parkingZone: freezed == parkingZone ? _self.parkingZone : parkingZone // ignore: cast_nullable_to_non_nullable
as ClientVehicleParkingZoneDto?,maxCapacity: freezed == maxCapacity ? _self.maxCapacity : maxCapacity // ignore: cast_nullable_to_non_nullable
as int?,currentOccupied: freezed == currentOccupied ? _self.currentOccupied : currentOccupied // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ClientVehicleParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientVehicleParkingZoneDtoCopyWith<$Res>? get parkingZone {
    if (_self.parkingZone == null) {
    return null;
  }

  return $ClientVehicleParkingZoneDtoCopyWith<$Res>(_self.parkingZone!, (value) {
    return _then(_self.copyWith(parkingZone: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClientVehicleParkingLotDto].
extension ClientVehicleParkingLotDtoPatterns on ClientVehicleParkingLotDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientVehicleParkingLotDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientVehicleParkingLotDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientVehicleParkingLotDto value)  $default,){
final _that = this;
switch (_that) {
case _ClientVehicleParkingLotDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientVehicleParkingLotDto value)?  $default,){
final _that = this;
switch (_that) {
case _ClientVehicleParkingLotDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'parkingZoneId')  int? parkingZoneId, @JsonKey(name: 'parkingZone')  ClientVehicleParkingZoneDto? parkingZone, @JsonKey(name: 'maxCapacity')  int? maxCapacity, @JsonKey(name: 'currentOccupied')  int? currentOccupied)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientVehicleParkingLotDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'parkingZoneId')  int? parkingZoneId, @JsonKey(name: 'parkingZone')  ClientVehicleParkingZoneDto? parkingZone, @JsonKey(name: 'maxCapacity')  int? maxCapacity, @JsonKey(name: 'currentOccupied')  int? currentOccupied)  $default,) {final _that = this;
switch (_that) {
case _ClientVehicleParkingLotDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'parkingZoneId')  int? parkingZoneId, @JsonKey(name: 'parkingZone')  ClientVehicleParkingZoneDto? parkingZone, @JsonKey(name: 'maxCapacity')  int? maxCapacity, @JsonKey(name: 'currentOccupied')  int? currentOccupied)?  $default,) {final _that = this;
switch (_that) {
case _ClientVehicleParkingLotDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.parkingZoneId,_that.parkingZone,_that.maxCapacity,_that.currentOccupied);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientVehicleParkingLotDto implements ClientVehicleParkingLotDto {
  const _ClientVehicleParkingLotDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'description') this.description, @JsonKey(name: 'parkingZoneId') this.parkingZoneId, @JsonKey(name: 'parkingZone') this.parkingZone, @JsonKey(name: 'maxCapacity') this.maxCapacity, @JsonKey(name: 'currentOccupied') this.currentOccupied});
  factory _ClientVehicleParkingLotDto.fromJson(Map<String, dynamic> json) => _$ClientVehicleParkingLotDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'description') final  String? description;
@override@JsonKey(name: 'parkingZoneId') final  int? parkingZoneId;
@override@JsonKey(name: 'parkingZone') final  ClientVehicleParkingZoneDto? parkingZone;
@override@JsonKey(name: 'maxCapacity') final  int? maxCapacity;
@override@JsonKey(name: 'currentOccupied') final  int? currentOccupied;

/// Create a copy of ClientVehicleParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientVehicleParkingLotDtoCopyWith<_ClientVehicleParkingLotDto> get copyWith => __$ClientVehicleParkingLotDtoCopyWithImpl<_ClientVehicleParkingLotDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientVehicleParkingLotDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientVehicleParkingLotDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.parkingZoneId, parkingZoneId) || other.parkingZoneId == parkingZoneId)&&(identical(other.parkingZone, parkingZone) || other.parkingZone == parkingZone)&&(identical(other.maxCapacity, maxCapacity) || other.maxCapacity == maxCapacity)&&(identical(other.currentOccupied, currentOccupied) || other.currentOccupied == currentOccupied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,parkingZoneId,parkingZone,maxCapacity,currentOccupied);

@override
String toString() {
  return 'ClientVehicleParkingLotDto(id: $id, name: $name, description: $description, parkingZoneId: $parkingZoneId, parkingZone: $parkingZone, maxCapacity: $maxCapacity, currentOccupied: $currentOccupied)';
}


}

/// @nodoc
abstract mixin class _$ClientVehicleParkingLotDtoCopyWith<$Res> implements $ClientVehicleParkingLotDtoCopyWith<$Res> {
  factory _$ClientVehicleParkingLotDtoCopyWith(_ClientVehicleParkingLotDto value, $Res Function(_ClientVehicleParkingLotDto) _then) = __$ClientVehicleParkingLotDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'description') String? description,@JsonKey(name: 'parkingZoneId') int? parkingZoneId,@JsonKey(name: 'parkingZone') ClientVehicleParkingZoneDto? parkingZone,@JsonKey(name: 'maxCapacity') int? maxCapacity,@JsonKey(name: 'currentOccupied') int? currentOccupied
});


@override $ClientVehicleParkingZoneDtoCopyWith<$Res>? get parkingZone;

}
/// @nodoc
class __$ClientVehicleParkingLotDtoCopyWithImpl<$Res>
    implements _$ClientVehicleParkingLotDtoCopyWith<$Res> {
  __$ClientVehicleParkingLotDtoCopyWithImpl(this._self, this._then);

  final _ClientVehicleParkingLotDto _self;
  final $Res Function(_ClientVehicleParkingLotDto) _then;

/// Create a copy of ClientVehicleParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? parkingZoneId = freezed,Object? parkingZone = freezed,Object? maxCapacity = freezed,Object? currentOccupied = freezed,}) {
  return _then(_ClientVehicleParkingLotDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,parkingZoneId: freezed == parkingZoneId ? _self.parkingZoneId : parkingZoneId // ignore: cast_nullable_to_non_nullable
as int?,parkingZone: freezed == parkingZone ? _self.parkingZone : parkingZone // ignore: cast_nullable_to_non_nullable
as ClientVehicleParkingZoneDto?,maxCapacity: freezed == maxCapacity ? _self.maxCapacity : maxCapacity // ignore: cast_nullable_to_non_nullable
as int?,currentOccupied: freezed == currentOccupied ? _self.currentOccupied : currentOccupied // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ClientVehicleParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientVehicleParkingZoneDtoCopyWith<$Res>? get parkingZone {
    if (_self.parkingZone == null) {
    return null;
  }

  return $ClientVehicleParkingZoneDtoCopyWith<$Res>(_self.parkingZone!, (value) {
    return _then(_self.copyWith(parkingZone: value));
  });
}
}


/// @nodoc
mixin _$ClientVehicleDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'serialNumber') String? get serialNumber;@JsonKey(name: 'materialCode') String? get materialCode;@JsonKey(name: 'model') String? get model;@JsonKey(name: 'manufacturingDate') String? get manufacturingDate;@JsonKey(name: 'color') String? get color;@JsonKey(name: 'status') int? get status;@JsonKey(name: 'statusLabel') String? get statusLabel;@JsonKey(name: 'warehouseImportedAt') String? get warehouseImportedAt;@JsonKey(name: 'exportedAt') String? get exportedAt;@JsonKey(name: 'storageDays') int? get storageDays;@JsonKey(name: 'qcDefectDescription') String? get qcDefectDescription;@JsonKey(name: 'factory') ClientVehicleFactoryDto? get factory;@JsonKey(name: 'parkingLot') ClientVehicleParkingLotDto? get parkingLot;
/// Create a copy of ClientVehicleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientVehicleDtoCopyWith<ClientVehicleDto> get copyWith => _$ClientVehicleDtoCopyWithImpl<ClientVehicleDto>(this as ClientVehicleDto, _$identity);

  /// Serializes this ClientVehicleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientVehicleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.materialCode, materialCode) || other.materialCode == materialCode)&&(identical(other.model, model) || other.model == model)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.warehouseImportedAt, warehouseImportedAt) || other.warehouseImportedAt == warehouseImportedAt)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&(identical(other.storageDays, storageDays) || other.storageDays == storageDays)&&(identical(other.qcDefectDescription, qcDefectDescription) || other.qcDefectDescription == qcDefectDescription)&&(identical(other.factory, factory) || other.factory == factory)&&(identical(other.parkingLot, parkingLot) || other.parkingLot == parkingLot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serialNumber,materialCode,model,manufacturingDate,color,status,statusLabel,warehouseImportedAt,exportedAt,storageDays,qcDefectDescription,factory,parkingLot);

@override
String toString() {
  return 'ClientVehicleDto(id: $id, serialNumber: $serialNumber, materialCode: $materialCode, model: $model, manufacturingDate: $manufacturingDate, color: $color, status: $status, statusLabel: $statusLabel, warehouseImportedAt: $warehouseImportedAt, exportedAt: $exportedAt, storageDays: $storageDays, qcDefectDescription: $qcDefectDescription, factory: $factory, parkingLot: $parkingLot)';
}


}

/// @nodoc
abstract mixin class $ClientVehicleDtoCopyWith<$Res>  {
  factory $ClientVehicleDtoCopyWith(ClientVehicleDto value, $Res Function(ClientVehicleDto) _then) = _$ClientVehicleDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'serialNumber') String? serialNumber,@JsonKey(name: 'materialCode') String? materialCode,@JsonKey(name: 'model') String? model,@JsonKey(name: 'manufacturingDate') String? manufacturingDate,@JsonKey(name: 'color') String? color,@JsonKey(name: 'status') int? status,@JsonKey(name: 'statusLabel') String? statusLabel,@JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,@JsonKey(name: 'exportedAt') String? exportedAt,@JsonKey(name: 'storageDays') int? storageDays,@JsonKey(name: 'qcDefectDescription') String? qcDefectDescription,@JsonKey(name: 'factory') ClientVehicleFactoryDto? factory,@JsonKey(name: 'parkingLot') ClientVehicleParkingLotDto? parkingLot
});


$ClientVehicleFactoryDtoCopyWith<$Res>? get factory;$ClientVehicleParkingLotDtoCopyWith<$Res>? get parkingLot;

}
/// @nodoc
class _$ClientVehicleDtoCopyWithImpl<$Res>
    implements $ClientVehicleDtoCopyWith<$Res> {
  _$ClientVehicleDtoCopyWithImpl(this._self, this._then);

  final ClientVehicleDto _self;
  final $Res Function(ClientVehicleDto) _then;

/// Create a copy of ClientVehicleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? serialNumber = freezed,Object? materialCode = freezed,Object? model = freezed,Object? manufacturingDate = freezed,Object? color = freezed,Object? status = freezed,Object? statusLabel = freezed,Object? warehouseImportedAt = freezed,Object? exportedAt = freezed,Object? storageDays = freezed,Object? qcDefectDescription = freezed,Object? factory = freezed,Object? parkingLot = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,materialCode: freezed == materialCode ? _self.materialCode : materialCode // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,warehouseImportedAt: freezed == warehouseImportedAt ? _self.warehouseImportedAt : warehouseImportedAt // ignore: cast_nullable_to_non_nullable
as String?,exportedAt: freezed == exportedAt ? _self.exportedAt : exportedAt // ignore: cast_nullable_to_non_nullable
as String?,storageDays: freezed == storageDays ? _self.storageDays : storageDays // ignore: cast_nullable_to_non_nullable
as int?,qcDefectDescription: freezed == qcDefectDescription ? _self.qcDefectDescription : qcDefectDescription // ignore: cast_nullable_to_non_nullable
as String?,factory: freezed == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as ClientVehicleFactoryDto?,parkingLot: freezed == parkingLot ? _self.parkingLot : parkingLot // ignore: cast_nullable_to_non_nullable
as ClientVehicleParkingLotDto?,
  ));
}
/// Create a copy of ClientVehicleDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientVehicleFactoryDtoCopyWith<$Res>? get factory {
    if (_self.factory == null) {
    return null;
  }

  return $ClientVehicleFactoryDtoCopyWith<$Res>(_self.factory!, (value) {
    return _then(_self.copyWith(factory: value));
  });
}/// Create a copy of ClientVehicleDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientVehicleParkingLotDtoCopyWith<$Res>? get parkingLot {
    if (_self.parkingLot == null) {
    return null;
  }

  return $ClientVehicleParkingLotDtoCopyWith<$Res>(_self.parkingLot!, (value) {
    return _then(_self.copyWith(parkingLot: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClientVehicleDto].
extension ClientVehicleDtoPatterns on ClientVehicleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientVehicleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientVehicleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientVehicleDto value)  $default,){
final _that = this;
switch (_that) {
case _ClientVehicleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientVehicleDto value)?  $default,){
final _that = this;
switch (_that) {
case _ClientVehicleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'manufacturingDate')  String? manufacturingDate, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'storageDays')  int? storageDays, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription, @JsonKey(name: 'factory')  ClientVehicleFactoryDto? factory, @JsonKey(name: 'parkingLot')  ClientVehicleParkingLotDto? parkingLot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientVehicleDto() when $default != null:
return $default(_that.id,_that.serialNumber,_that.materialCode,_that.model,_that.manufacturingDate,_that.color,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.exportedAt,_that.storageDays,_that.qcDefectDescription,_that.factory,_that.parkingLot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'manufacturingDate')  String? manufacturingDate, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'storageDays')  int? storageDays, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription, @JsonKey(name: 'factory')  ClientVehicleFactoryDto? factory, @JsonKey(name: 'parkingLot')  ClientVehicleParkingLotDto? parkingLot)  $default,) {final _that = this;
switch (_that) {
case _ClientVehicleDto():
return $default(_that.id,_that.serialNumber,_that.materialCode,_that.model,_that.manufacturingDate,_that.color,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.exportedAt,_that.storageDays,_that.qcDefectDescription,_that.factory,_that.parkingLot);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'manufacturingDate')  String? manufacturingDate, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'storageDays')  int? storageDays, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription, @JsonKey(name: 'factory')  ClientVehicleFactoryDto? factory, @JsonKey(name: 'parkingLot')  ClientVehicleParkingLotDto? parkingLot)?  $default,) {final _that = this;
switch (_that) {
case _ClientVehicleDto() when $default != null:
return $default(_that.id,_that.serialNumber,_that.materialCode,_that.model,_that.manufacturingDate,_that.color,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.exportedAt,_that.storageDays,_that.qcDefectDescription,_that.factory,_that.parkingLot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientVehicleDto implements ClientVehicleDto {
  const _ClientVehicleDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'serialNumber') this.serialNumber, @JsonKey(name: 'materialCode') this.materialCode, @JsonKey(name: 'model') this.model, @JsonKey(name: 'manufacturingDate') this.manufacturingDate, @JsonKey(name: 'color') this.color, @JsonKey(name: 'status') this.status, @JsonKey(name: 'statusLabel') this.statusLabel, @JsonKey(name: 'warehouseImportedAt') this.warehouseImportedAt, @JsonKey(name: 'exportedAt') this.exportedAt, @JsonKey(name: 'storageDays') this.storageDays, @JsonKey(name: 'qcDefectDescription') this.qcDefectDescription, @JsonKey(name: 'factory') this.factory, @JsonKey(name: 'parkingLot') this.parkingLot});
  factory _ClientVehicleDto.fromJson(Map<String, dynamic> json) => _$ClientVehicleDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'serialNumber') final  String? serialNumber;
@override@JsonKey(name: 'materialCode') final  String? materialCode;
@override@JsonKey(name: 'model') final  String? model;
@override@JsonKey(name: 'manufacturingDate') final  String? manufacturingDate;
@override@JsonKey(name: 'color') final  String? color;
@override@JsonKey(name: 'status') final  int? status;
@override@JsonKey(name: 'statusLabel') final  String? statusLabel;
@override@JsonKey(name: 'warehouseImportedAt') final  String? warehouseImportedAt;
@override@JsonKey(name: 'exportedAt') final  String? exportedAt;
@override@JsonKey(name: 'storageDays') final  int? storageDays;
@override@JsonKey(name: 'qcDefectDescription') final  String? qcDefectDescription;
@override@JsonKey(name: 'factory') final  ClientVehicleFactoryDto? factory;
@override@JsonKey(name: 'parkingLot') final  ClientVehicleParkingLotDto? parkingLot;

/// Create a copy of ClientVehicleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientVehicleDtoCopyWith<_ClientVehicleDto> get copyWith => __$ClientVehicleDtoCopyWithImpl<_ClientVehicleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientVehicleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientVehicleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.materialCode, materialCode) || other.materialCode == materialCode)&&(identical(other.model, model) || other.model == model)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.warehouseImportedAt, warehouseImportedAt) || other.warehouseImportedAt == warehouseImportedAt)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&(identical(other.storageDays, storageDays) || other.storageDays == storageDays)&&(identical(other.qcDefectDescription, qcDefectDescription) || other.qcDefectDescription == qcDefectDescription)&&(identical(other.factory, factory) || other.factory == factory)&&(identical(other.parkingLot, parkingLot) || other.parkingLot == parkingLot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serialNumber,materialCode,model,manufacturingDate,color,status,statusLabel,warehouseImportedAt,exportedAt,storageDays,qcDefectDescription,factory,parkingLot);

@override
String toString() {
  return 'ClientVehicleDto(id: $id, serialNumber: $serialNumber, materialCode: $materialCode, model: $model, manufacturingDate: $manufacturingDate, color: $color, status: $status, statusLabel: $statusLabel, warehouseImportedAt: $warehouseImportedAt, exportedAt: $exportedAt, storageDays: $storageDays, qcDefectDescription: $qcDefectDescription, factory: $factory, parkingLot: $parkingLot)';
}


}

/// @nodoc
abstract mixin class _$ClientVehicleDtoCopyWith<$Res> implements $ClientVehicleDtoCopyWith<$Res> {
  factory _$ClientVehicleDtoCopyWith(_ClientVehicleDto value, $Res Function(_ClientVehicleDto) _then) = __$ClientVehicleDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'serialNumber') String? serialNumber,@JsonKey(name: 'materialCode') String? materialCode,@JsonKey(name: 'model') String? model,@JsonKey(name: 'manufacturingDate') String? manufacturingDate,@JsonKey(name: 'color') String? color,@JsonKey(name: 'status') int? status,@JsonKey(name: 'statusLabel') String? statusLabel,@JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,@JsonKey(name: 'exportedAt') String? exportedAt,@JsonKey(name: 'storageDays') int? storageDays,@JsonKey(name: 'qcDefectDescription') String? qcDefectDescription,@JsonKey(name: 'factory') ClientVehicleFactoryDto? factory,@JsonKey(name: 'parkingLot') ClientVehicleParkingLotDto? parkingLot
});


@override $ClientVehicleFactoryDtoCopyWith<$Res>? get factory;@override $ClientVehicleParkingLotDtoCopyWith<$Res>? get parkingLot;

}
/// @nodoc
class __$ClientVehicleDtoCopyWithImpl<$Res>
    implements _$ClientVehicleDtoCopyWith<$Res> {
  __$ClientVehicleDtoCopyWithImpl(this._self, this._then);

  final _ClientVehicleDto _self;
  final $Res Function(_ClientVehicleDto) _then;

/// Create a copy of ClientVehicleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? serialNumber = freezed,Object? materialCode = freezed,Object? model = freezed,Object? manufacturingDate = freezed,Object? color = freezed,Object? status = freezed,Object? statusLabel = freezed,Object? warehouseImportedAt = freezed,Object? exportedAt = freezed,Object? storageDays = freezed,Object? qcDefectDescription = freezed,Object? factory = freezed,Object? parkingLot = freezed,}) {
  return _then(_ClientVehicleDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,materialCode: freezed == materialCode ? _self.materialCode : materialCode // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,warehouseImportedAt: freezed == warehouseImportedAt ? _self.warehouseImportedAt : warehouseImportedAt // ignore: cast_nullable_to_non_nullable
as String?,exportedAt: freezed == exportedAt ? _self.exportedAt : exportedAt // ignore: cast_nullable_to_non_nullable
as String?,storageDays: freezed == storageDays ? _self.storageDays : storageDays // ignore: cast_nullable_to_non_nullable
as int?,qcDefectDescription: freezed == qcDefectDescription ? _self.qcDefectDescription : qcDefectDescription // ignore: cast_nullable_to_non_nullable
as String?,factory: freezed == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as ClientVehicleFactoryDto?,parkingLot: freezed == parkingLot ? _self.parkingLot : parkingLot // ignore: cast_nullable_to_non_nullable
as ClientVehicleParkingLotDto?,
  ));
}

/// Create a copy of ClientVehicleDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientVehicleFactoryDtoCopyWith<$Res>? get factory {
    if (_self.factory == null) {
    return null;
  }

  return $ClientVehicleFactoryDtoCopyWith<$Res>(_self.factory!, (value) {
    return _then(_self.copyWith(factory: value));
  });
}/// Create a copy of ClientVehicleDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientVehicleParkingLotDtoCopyWith<$Res>? get parkingLot {
    if (_self.parkingLot == null) {
    return null;
  }

  return $ClientVehicleParkingLotDtoCopyWith<$Res>(_self.parkingLot!, (value) {
    return _then(_self.copyWith(parkingLot: value));
  });
}
}

// dart format on
