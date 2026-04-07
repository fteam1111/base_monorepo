// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleHistoryDto {

 int get id; String get action; String get performedBy; DateTime? get performedAt; int get status; String? get notes; String? get performedByName; String? get performedByAccount; FactoryRefDto? get factory; AreaRefDto? get area; LocationRefDto? get position; LocationRefDto? get parkingLot; LocationRefDto? get parkingZone; int? get storageDays; DeliveryOrderRefDto? get deliveryOrder;
/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleHistoryDtoCopyWith<VehicleHistoryDto> get copyWith => _$VehicleHistoryDtoCopyWithImpl<VehicleHistoryDto>(this as VehicleHistoryDto, _$identity);

  /// Serializes this VehicleHistoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleHistoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.action, action) || other.action == action)&&(identical(other.performedBy, performedBy) || other.performedBy == performedBy)&&(identical(other.performedAt, performedAt) || other.performedAt == performedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.performedByName, performedByName) || other.performedByName == performedByName)&&(identical(other.performedByAccount, performedByAccount) || other.performedByAccount == performedByAccount)&&(identical(other.factory, factory) || other.factory == factory)&&(identical(other.area, area) || other.area == area)&&(identical(other.position, position) || other.position == position)&&(identical(other.parkingLot, parkingLot) || other.parkingLot == parkingLot)&&(identical(other.parkingZone, parkingZone) || other.parkingZone == parkingZone)&&(identical(other.storageDays, storageDays) || other.storageDays == storageDays)&&(identical(other.deliveryOrder, deliveryOrder) || other.deliveryOrder == deliveryOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,action,performedBy,performedAt,status,notes,performedByName,performedByAccount,factory,area,position,parkingLot,parkingZone,storageDays,deliveryOrder);

@override
String toString() {
  return 'VehicleHistoryDto(id: $id, action: $action, performedBy: $performedBy, performedAt: $performedAt, status: $status, notes: $notes, performedByName: $performedByName, performedByAccount: $performedByAccount, factory: $factory, area: $area, position: $position, parkingLot: $parkingLot, parkingZone: $parkingZone, storageDays: $storageDays, deliveryOrder: $deliveryOrder)';
}


}

/// @nodoc
abstract mixin class $VehicleHistoryDtoCopyWith<$Res>  {
  factory $VehicleHistoryDtoCopyWith(VehicleHistoryDto value, $Res Function(VehicleHistoryDto) _then) = _$VehicleHistoryDtoCopyWithImpl;
@useResult
$Res call({
 int id, String action, String performedBy, DateTime? performedAt, int status, String? notes, String? performedByName, String? performedByAccount, FactoryRefDto? factory, AreaRefDto? area, LocationRefDto? position, LocationRefDto? parkingLot, LocationRefDto? parkingZone, int? storageDays, DeliveryOrderRefDto? deliveryOrder
});


$FactoryRefDtoCopyWith<$Res>? get factory;$AreaRefDtoCopyWith<$Res>? get area;$LocationRefDtoCopyWith<$Res>? get position;$LocationRefDtoCopyWith<$Res>? get parkingLot;$LocationRefDtoCopyWith<$Res>? get parkingZone;$DeliveryOrderRefDtoCopyWith<$Res>? get deliveryOrder;

}
/// @nodoc
class _$VehicleHistoryDtoCopyWithImpl<$Res>
    implements $VehicleHistoryDtoCopyWith<$Res> {
  _$VehicleHistoryDtoCopyWithImpl(this._self, this._then);

  final VehicleHistoryDto _self;
  final $Res Function(VehicleHistoryDto) _then;

/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? action = null,Object? performedBy = null,Object? performedAt = freezed,Object? status = null,Object? notes = freezed,Object? performedByName = freezed,Object? performedByAccount = freezed,Object? factory = freezed,Object? area = freezed,Object? position = freezed,Object? parkingLot = freezed,Object? parkingZone = freezed,Object? storageDays = freezed,Object? deliveryOrder = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,performedBy: null == performedBy ? _self.performedBy : performedBy // ignore: cast_nullable_to_non_nullable
as String,performedAt: freezed == performedAt ? _self.performedAt : performedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,performedByName: freezed == performedByName ? _self.performedByName : performedByName // ignore: cast_nullable_to_non_nullable
as String?,performedByAccount: freezed == performedByAccount ? _self.performedByAccount : performedByAccount // ignore: cast_nullable_to_non_nullable
as String?,factory: freezed == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as FactoryRefDto?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as AreaRefDto?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LocationRefDto?,parkingLot: freezed == parkingLot ? _self.parkingLot : parkingLot // ignore: cast_nullable_to_non_nullable
as LocationRefDto?,parkingZone: freezed == parkingZone ? _self.parkingZone : parkingZone // ignore: cast_nullable_to_non_nullable
as LocationRefDto?,storageDays: freezed == storageDays ? _self.storageDays : storageDays // ignore: cast_nullable_to_non_nullable
as int?,deliveryOrder: freezed == deliveryOrder ? _self.deliveryOrder : deliveryOrder // ignore: cast_nullable_to_non_nullable
as DeliveryOrderRefDto?,
  ));
}
/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FactoryRefDtoCopyWith<$Res>? get factory {
    if (_self.factory == null) {
    return null;
  }

  return $FactoryRefDtoCopyWith<$Res>(_self.factory!, (value) {
    return _then(_self.copyWith(factory: value));
  });
}/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AreaRefDtoCopyWith<$Res>? get area {
    if (_self.area == null) {
    return null;
  }

  return $AreaRefDtoCopyWith<$Res>(_self.area!, (value) {
    return _then(_self.copyWith(area: value));
  });
}/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationRefDtoCopyWith<$Res>? get position {
    if (_self.position == null) {
    return null;
  }

  return $LocationRefDtoCopyWith<$Res>(_self.position!, (value) {
    return _then(_self.copyWith(position: value));
  });
}/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationRefDtoCopyWith<$Res>? get parkingLot {
    if (_self.parkingLot == null) {
    return null;
  }

  return $LocationRefDtoCopyWith<$Res>(_self.parkingLot!, (value) {
    return _then(_self.copyWith(parkingLot: value));
  });
}/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationRefDtoCopyWith<$Res>? get parkingZone {
    if (_self.parkingZone == null) {
    return null;
  }

  return $LocationRefDtoCopyWith<$Res>(_self.parkingZone!, (value) {
    return _then(_self.copyWith(parkingZone: value));
  });
}/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryOrderRefDtoCopyWith<$Res>? get deliveryOrder {
    if (_self.deliveryOrder == null) {
    return null;
  }

  return $DeliveryOrderRefDtoCopyWith<$Res>(_self.deliveryOrder!, (value) {
    return _then(_self.copyWith(deliveryOrder: value));
  });
}
}


/// Adds pattern-matching-related methods to [VehicleHistoryDto].
extension VehicleHistoryDtoPatterns on VehicleHistoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleHistoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleHistoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleHistoryDto value)  $default,){
final _that = this;
switch (_that) {
case _VehicleHistoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleHistoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleHistoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String action,  String performedBy,  DateTime? performedAt,  int status,  String? notes,  String? performedByName,  String? performedByAccount,  FactoryRefDto? factory,  AreaRefDto? area,  LocationRefDto? position,  LocationRefDto? parkingLot,  LocationRefDto? parkingZone,  int? storageDays,  DeliveryOrderRefDto? deliveryOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleHistoryDto() when $default != null:
return $default(_that.id,_that.action,_that.performedBy,_that.performedAt,_that.status,_that.notes,_that.performedByName,_that.performedByAccount,_that.factory,_that.area,_that.position,_that.parkingLot,_that.parkingZone,_that.storageDays,_that.deliveryOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String action,  String performedBy,  DateTime? performedAt,  int status,  String? notes,  String? performedByName,  String? performedByAccount,  FactoryRefDto? factory,  AreaRefDto? area,  LocationRefDto? position,  LocationRefDto? parkingLot,  LocationRefDto? parkingZone,  int? storageDays,  DeliveryOrderRefDto? deliveryOrder)  $default,) {final _that = this;
switch (_that) {
case _VehicleHistoryDto():
return $default(_that.id,_that.action,_that.performedBy,_that.performedAt,_that.status,_that.notes,_that.performedByName,_that.performedByAccount,_that.factory,_that.area,_that.position,_that.parkingLot,_that.parkingZone,_that.storageDays,_that.deliveryOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String action,  String performedBy,  DateTime? performedAt,  int status,  String? notes,  String? performedByName,  String? performedByAccount,  FactoryRefDto? factory,  AreaRefDto? area,  LocationRefDto? position,  LocationRefDto? parkingLot,  LocationRefDto? parkingZone,  int? storageDays,  DeliveryOrderRefDto? deliveryOrder)?  $default,) {final _that = this;
switch (_that) {
case _VehicleHistoryDto() when $default != null:
return $default(_that.id,_that.action,_that.performedBy,_that.performedAt,_that.status,_that.notes,_that.performedByName,_that.performedByAccount,_that.factory,_that.area,_that.position,_that.parkingLot,_that.parkingZone,_that.storageDays,_that.deliveryOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleHistoryDto implements VehicleHistoryDto {
  const _VehicleHistoryDto({required this.id, required this.action, required this.performedBy, required this.performedAt, required this.status, this.notes, this.performedByName, this.performedByAccount, this.factory, this.area, this.position, this.parkingLot, this.parkingZone, this.storageDays, this.deliveryOrder});
  factory _VehicleHistoryDto.fromJson(Map<String, dynamic> json) => _$VehicleHistoryDtoFromJson(json);

@override final  int id;
@override final  String action;
@override final  String performedBy;
@override final  DateTime? performedAt;
@override final  int status;
@override final  String? notes;
@override final  String? performedByName;
@override final  String? performedByAccount;
@override final  FactoryRefDto? factory;
@override final  AreaRefDto? area;
@override final  LocationRefDto? position;
@override final  LocationRefDto? parkingLot;
@override final  LocationRefDto? parkingZone;
@override final  int? storageDays;
@override final  DeliveryOrderRefDto? deliveryOrder;

/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleHistoryDtoCopyWith<_VehicleHistoryDto> get copyWith => __$VehicleHistoryDtoCopyWithImpl<_VehicleHistoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleHistoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleHistoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.action, action) || other.action == action)&&(identical(other.performedBy, performedBy) || other.performedBy == performedBy)&&(identical(other.performedAt, performedAt) || other.performedAt == performedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.performedByName, performedByName) || other.performedByName == performedByName)&&(identical(other.performedByAccount, performedByAccount) || other.performedByAccount == performedByAccount)&&(identical(other.factory, factory) || other.factory == factory)&&(identical(other.area, area) || other.area == area)&&(identical(other.position, position) || other.position == position)&&(identical(other.parkingLot, parkingLot) || other.parkingLot == parkingLot)&&(identical(other.parkingZone, parkingZone) || other.parkingZone == parkingZone)&&(identical(other.storageDays, storageDays) || other.storageDays == storageDays)&&(identical(other.deliveryOrder, deliveryOrder) || other.deliveryOrder == deliveryOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,action,performedBy,performedAt,status,notes,performedByName,performedByAccount,factory,area,position,parkingLot,parkingZone,storageDays,deliveryOrder);

@override
String toString() {
  return 'VehicleHistoryDto(id: $id, action: $action, performedBy: $performedBy, performedAt: $performedAt, status: $status, notes: $notes, performedByName: $performedByName, performedByAccount: $performedByAccount, factory: $factory, area: $area, position: $position, parkingLot: $parkingLot, parkingZone: $parkingZone, storageDays: $storageDays, deliveryOrder: $deliveryOrder)';
}


}

/// @nodoc
abstract mixin class _$VehicleHistoryDtoCopyWith<$Res> implements $VehicleHistoryDtoCopyWith<$Res> {
  factory _$VehicleHistoryDtoCopyWith(_VehicleHistoryDto value, $Res Function(_VehicleHistoryDto) _then) = __$VehicleHistoryDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String action, String performedBy, DateTime? performedAt, int status, String? notes, String? performedByName, String? performedByAccount, FactoryRefDto? factory, AreaRefDto? area, LocationRefDto? position, LocationRefDto? parkingLot, LocationRefDto? parkingZone, int? storageDays, DeliveryOrderRefDto? deliveryOrder
});


@override $FactoryRefDtoCopyWith<$Res>? get factory;@override $AreaRefDtoCopyWith<$Res>? get area;@override $LocationRefDtoCopyWith<$Res>? get position;@override $LocationRefDtoCopyWith<$Res>? get parkingLot;@override $LocationRefDtoCopyWith<$Res>? get parkingZone;@override $DeliveryOrderRefDtoCopyWith<$Res>? get deliveryOrder;

}
/// @nodoc
class __$VehicleHistoryDtoCopyWithImpl<$Res>
    implements _$VehicleHistoryDtoCopyWith<$Res> {
  __$VehicleHistoryDtoCopyWithImpl(this._self, this._then);

  final _VehicleHistoryDto _self;
  final $Res Function(_VehicleHistoryDto) _then;

/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? action = null,Object? performedBy = null,Object? performedAt = freezed,Object? status = null,Object? notes = freezed,Object? performedByName = freezed,Object? performedByAccount = freezed,Object? factory = freezed,Object? area = freezed,Object? position = freezed,Object? parkingLot = freezed,Object? parkingZone = freezed,Object? storageDays = freezed,Object? deliveryOrder = freezed,}) {
  return _then(_VehicleHistoryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,performedBy: null == performedBy ? _self.performedBy : performedBy // ignore: cast_nullable_to_non_nullable
as String,performedAt: freezed == performedAt ? _self.performedAt : performedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,performedByName: freezed == performedByName ? _self.performedByName : performedByName // ignore: cast_nullable_to_non_nullable
as String?,performedByAccount: freezed == performedByAccount ? _self.performedByAccount : performedByAccount // ignore: cast_nullable_to_non_nullable
as String?,factory: freezed == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as FactoryRefDto?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as AreaRefDto?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LocationRefDto?,parkingLot: freezed == parkingLot ? _self.parkingLot : parkingLot // ignore: cast_nullable_to_non_nullable
as LocationRefDto?,parkingZone: freezed == parkingZone ? _self.parkingZone : parkingZone // ignore: cast_nullable_to_non_nullable
as LocationRefDto?,storageDays: freezed == storageDays ? _self.storageDays : storageDays // ignore: cast_nullable_to_non_nullable
as int?,deliveryOrder: freezed == deliveryOrder ? _self.deliveryOrder : deliveryOrder // ignore: cast_nullable_to_non_nullable
as DeliveryOrderRefDto?,
  ));
}

/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FactoryRefDtoCopyWith<$Res>? get factory {
    if (_self.factory == null) {
    return null;
  }

  return $FactoryRefDtoCopyWith<$Res>(_self.factory!, (value) {
    return _then(_self.copyWith(factory: value));
  });
}/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AreaRefDtoCopyWith<$Res>? get area {
    if (_self.area == null) {
    return null;
  }

  return $AreaRefDtoCopyWith<$Res>(_self.area!, (value) {
    return _then(_self.copyWith(area: value));
  });
}/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationRefDtoCopyWith<$Res>? get position {
    if (_self.position == null) {
    return null;
  }

  return $LocationRefDtoCopyWith<$Res>(_self.position!, (value) {
    return _then(_self.copyWith(position: value));
  });
}/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationRefDtoCopyWith<$Res>? get parkingLot {
    if (_self.parkingLot == null) {
    return null;
  }

  return $LocationRefDtoCopyWith<$Res>(_self.parkingLot!, (value) {
    return _then(_self.copyWith(parkingLot: value));
  });
}/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationRefDtoCopyWith<$Res>? get parkingZone {
    if (_self.parkingZone == null) {
    return null;
  }

  return $LocationRefDtoCopyWith<$Res>(_self.parkingZone!, (value) {
    return _then(_self.copyWith(parkingZone: value));
  });
}/// Create a copy of VehicleHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryOrderRefDtoCopyWith<$Res>? get deliveryOrder {
    if (_self.deliveryOrder == null) {
    return null;
  }

  return $DeliveryOrderRefDtoCopyWith<$Res>(_self.deliveryOrder!, (value) {
    return _then(_self.copyWith(deliveryOrder: value));
  });
}
}


/// @nodoc
mixin _$DeliveryOrderRefDto {

 int get id; String get doCode;
/// Create a copy of DeliveryOrderRefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryOrderRefDtoCopyWith<DeliveryOrderRefDto> get copyWith => _$DeliveryOrderRefDtoCopyWithImpl<DeliveryOrderRefDto>(this as DeliveryOrderRefDto, _$identity);

  /// Serializes this DeliveryOrderRefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryOrderRefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.doCode, doCode) || other.doCode == doCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doCode);

@override
String toString() {
  return 'DeliveryOrderRefDto(id: $id, doCode: $doCode)';
}


}

/// @nodoc
abstract mixin class $DeliveryOrderRefDtoCopyWith<$Res>  {
  factory $DeliveryOrderRefDtoCopyWith(DeliveryOrderRefDto value, $Res Function(DeliveryOrderRefDto) _then) = _$DeliveryOrderRefDtoCopyWithImpl;
@useResult
$Res call({
 int id, String doCode
});




}
/// @nodoc
class _$DeliveryOrderRefDtoCopyWithImpl<$Res>
    implements $DeliveryOrderRefDtoCopyWith<$Res> {
  _$DeliveryOrderRefDtoCopyWithImpl(this._self, this._then);

  final DeliveryOrderRefDto _self;
  final $Res Function(DeliveryOrderRefDto) _then;

/// Create a copy of DeliveryOrderRefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? doCode = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,doCode: null == doCode ? _self.doCode : doCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryOrderRefDto].
extension DeliveryOrderRefDtoPatterns on DeliveryOrderRefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryOrderRefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryOrderRefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryOrderRefDto value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryOrderRefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryOrderRefDto value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryOrderRefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String doCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryOrderRefDto() when $default != null:
return $default(_that.id,_that.doCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String doCode)  $default,) {final _that = this;
switch (_that) {
case _DeliveryOrderRefDto():
return $default(_that.id,_that.doCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String doCode)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryOrderRefDto() when $default != null:
return $default(_that.id,_that.doCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryOrderRefDto implements DeliveryOrderRefDto {
  const _DeliveryOrderRefDto({required this.id, required this.doCode});
  factory _DeliveryOrderRefDto.fromJson(Map<String, dynamic> json) => _$DeliveryOrderRefDtoFromJson(json);

@override final  int id;
@override final  String doCode;

/// Create a copy of DeliveryOrderRefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryOrderRefDtoCopyWith<_DeliveryOrderRefDto> get copyWith => __$DeliveryOrderRefDtoCopyWithImpl<_DeliveryOrderRefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryOrderRefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryOrderRefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.doCode, doCode) || other.doCode == doCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doCode);

@override
String toString() {
  return 'DeliveryOrderRefDto(id: $id, doCode: $doCode)';
}


}

/// @nodoc
abstract mixin class _$DeliveryOrderRefDtoCopyWith<$Res> implements $DeliveryOrderRefDtoCopyWith<$Res> {
  factory _$DeliveryOrderRefDtoCopyWith(_DeliveryOrderRefDto value, $Res Function(_DeliveryOrderRefDto) _then) = __$DeliveryOrderRefDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String doCode
});




}
/// @nodoc
class __$DeliveryOrderRefDtoCopyWithImpl<$Res>
    implements _$DeliveryOrderRefDtoCopyWith<$Res> {
  __$DeliveryOrderRefDtoCopyWithImpl(this._self, this._then);

  final _DeliveryOrderRefDto _self;
  final $Res Function(_DeliveryOrderRefDto) _then;

/// Create a copy of DeliveryOrderRefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? doCode = null,}) {
  return _then(_DeliveryOrderRefDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,doCode: null == doCode ? _self.doCode : doCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FactoryRefDto {

 int get id; String get name; String? get address;
/// Create a copy of FactoryRefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FactoryRefDtoCopyWith<FactoryRefDto> get copyWith => _$FactoryRefDtoCopyWithImpl<FactoryRefDto>(this as FactoryRefDto, _$identity);

  /// Serializes this FactoryRefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FactoryRefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address);

@override
String toString() {
  return 'FactoryRefDto(id: $id, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class $FactoryRefDtoCopyWith<$Res>  {
  factory $FactoryRefDtoCopyWith(FactoryRefDto value, $Res Function(FactoryRefDto) _then) = _$FactoryRefDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? address
});




}
/// @nodoc
class _$FactoryRefDtoCopyWithImpl<$Res>
    implements $FactoryRefDtoCopyWith<$Res> {
  _$FactoryRefDtoCopyWithImpl(this._self, this._then);

  final FactoryRefDto _self;
  final $Res Function(FactoryRefDto) _then;

/// Create a copy of FactoryRefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FactoryRefDto].
extension FactoryRefDtoPatterns on FactoryRefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FactoryRefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FactoryRefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FactoryRefDto value)  $default,){
final _that = this;
switch (_that) {
case _FactoryRefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FactoryRefDto value)?  $default,){
final _that = this;
switch (_that) {
case _FactoryRefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FactoryRefDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? address)  $default,) {final _that = this;
switch (_that) {
case _FactoryRefDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _FactoryRefDto() when $default != null:
return $default(_that.id,_that.name,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FactoryRefDto implements FactoryRefDto {
  const _FactoryRefDto({required this.id, required this.name, this.address});
  factory _FactoryRefDto.fromJson(Map<String, dynamic> json) => _$FactoryRefDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? address;

/// Create a copy of FactoryRefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FactoryRefDtoCopyWith<_FactoryRefDto> get copyWith => __$FactoryRefDtoCopyWithImpl<_FactoryRefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FactoryRefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FactoryRefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address);

@override
String toString() {
  return 'FactoryRefDto(id: $id, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class _$FactoryRefDtoCopyWith<$Res> implements $FactoryRefDtoCopyWith<$Res> {
  factory _$FactoryRefDtoCopyWith(_FactoryRefDto value, $Res Function(_FactoryRefDto) _then) = __$FactoryRefDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? address
});




}
/// @nodoc
class __$FactoryRefDtoCopyWithImpl<$Res>
    implements _$FactoryRefDtoCopyWith<$Res> {
  __$FactoryRefDtoCopyWithImpl(this._self, this._then);

  final _FactoryRefDto _self;
  final $Res Function(_FactoryRefDto) _then;

/// Create a copy of FactoryRefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = freezed,}) {
  return _then(_FactoryRefDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AreaRefDto {

 int get id; String get name; String? get type;
/// Create a copy of AreaRefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AreaRefDtoCopyWith<AreaRefDto> get copyWith => _$AreaRefDtoCopyWithImpl<AreaRefDto>(this as AreaRefDto, _$identity);

  /// Serializes this AreaRefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AreaRefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type);

@override
String toString() {
  return 'AreaRefDto(id: $id, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class $AreaRefDtoCopyWith<$Res>  {
  factory $AreaRefDtoCopyWith(AreaRefDto value, $Res Function(AreaRefDto) _then) = _$AreaRefDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? type
});




}
/// @nodoc
class _$AreaRefDtoCopyWithImpl<$Res>
    implements $AreaRefDtoCopyWith<$Res> {
  _$AreaRefDtoCopyWithImpl(this._self, this._then);

  final AreaRefDto _self;
  final $Res Function(AreaRefDto) _then;

/// Create a copy of AreaRefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AreaRefDto].
extension AreaRefDtoPatterns on AreaRefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AreaRefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AreaRefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AreaRefDto value)  $default,){
final _that = this;
switch (_that) {
case _AreaRefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AreaRefDto value)?  $default,){
final _that = this;
switch (_that) {
case _AreaRefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AreaRefDto() when $default != null:
return $default(_that.id,_that.name,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? type)  $default,) {final _that = this;
switch (_that) {
case _AreaRefDto():
return $default(_that.id,_that.name,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? type)?  $default,) {final _that = this;
switch (_that) {
case _AreaRefDto() when $default != null:
return $default(_that.id,_that.name,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AreaRefDto implements AreaRefDto {
  const _AreaRefDto({required this.id, required this.name, this.type});
  factory _AreaRefDto.fromJson(Map<String, dynamic> json) => _$AreaRefDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? type;

/// Create a copy of AreaRefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AreaRefDtoCopyWith<_AreaRefDto> get copyWith => __$AreaRefDtoCopyWithImpl<_AreaRefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AreaRefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AreaRefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type);

@override
String toString() {
  return 'AreaRefDto(id: $id, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class _$AreaRefDtoCopyWith<$Res> implements $AreaRefDtoCopyWith<$Res> {
  factory _$AreaRefDtoCopyWith(_AreaRefDto value, $Res Function(_AreaRefDto) _then) = __$AreaRefDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? type
});




}
/// @nodoc
class __$AreaRefDtoCopyWithImpl<$Res>
    implements _$AreaRefDtoCopyWith<$Res> {
  __$AreaRefDtoCopyWithImpl(this._self, this._then);

  final _AreaRefDto _self;
  final $Res Function(_AreaRefDto) _then;

/// Create a copy of AreaRefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = freezed,}) {
  return _then(_AreaRefDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LocationRefDto {

 int get id; String get name;
/// Create a copy of LocationRefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationRefDtoCopyWith<LocationRefDto> get copyWith => _$LocationRefDtoCopyWithImpl<LocationRefDto>(this as LocationRefDto, _$identity);

  /// Serializes this LocationRefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationRefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'LocationRefDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $LocationRefDtoCopyWith<$Res>  {
  factory $LocationRefDtoCopyWith(LocationRefDto value, $Res Function(LocationRefDto) _then) = _$LocationRefDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$LocationRefDtoCopyWithImpl<$Res>
    implements $LocationRefDtoCopyWith<$Res> {
  _$LocationRefDtoCopyWithImpl(this._self, this._then);

  final LocationRefDto _self;
  final $Res Function(LocationRefDto) _then;

/// Create a copy of LocationRefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationRefDto].
extension LocationRefDtoPatterns on LocationRefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationRefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationRefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationRefDto value)  $default,){
final _that = this;
switch (_that) {
case _LocationRefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationRefDto value)?  $default,){
final _that = this;
switch (_that) {
case _LocationRefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationRefDto() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _LocationRefDto():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _LocationRefDto() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationRefDto implements LocationRefDto {
  const _LocationRefDto({required this.id, required this.name});
  factory _LocationRefDto.fromJson(Map<String, dynamic> json) => _$LocationRefDtoFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of LocationRefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationRefDtoCopyWith<_LocationRefDto> get copyWith => __$LocationRefDtoCopyWithImpl<_LocationRefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationRefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationRefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'LocationRefDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$LocationRefDtoCopyWith<$Res> implements $LocationRefDtoCopyWith<$Res> {
  factory _$LocationRefDtoCopyWith(_LocationRefDto value, $Res Function(_LocationRefDto) _then) = __$LocationRefDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$LocationRefDtoCopyWithImpl<$Res>
    implements _$LocationRefDtoCopyWith<$Res> {
  __$LocationRefDtoCopyWithImpl(this._self, this._then);

  final _LocationRefDto _self;
  final $Res Function(_LocationRefDto) _then;

/// Create a copy of LocationRefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_LocationRefDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
