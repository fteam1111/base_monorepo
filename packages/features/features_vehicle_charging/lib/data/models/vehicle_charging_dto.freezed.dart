// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_charging_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleChargingDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'serialNumber') String? get serialNumber;@JsonKey(name: 'materialCode') String? get materialCode;@JsonKey(name: 'model') String? get model;@JsonKey(name: 'manufacturingDate') String? get manufacturingDate;@JsonKey(name: 'color') String? get color;@JsonKey(name: 'status') int? get status;@JsonKey(name: 'statusLabel') String? get statusLabel;@JsonKey(name: 'warehouseImportedAt') String? get warehouseImportedAt;@JsonKey(name: 'exportedAt') String? get exportedAt;@JsonKey(name: 'storageDays') int? get storageDays;@JsonKey(name: 'qcDefectDescription') String? get qcDefectDescription;@JsonKey(name: 'factory') VehicleChargingFactoryDto? get factory;@JsonKey(name: 'parkingLot') VehicleChargingParkingLotDto? get parkingLot;
/// Create a copy of VehicleChargingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleChargingDtoCopyWith<VehicleChargingDto> get copyWith => _$VehicleChargingDtoCopyWithImpl<VehicleChargingDto>(this as VehicleChargingDto, _$identity);

  /// Serializes this VehicleChargingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleChargingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.materialCode, materialCode) || other.materialCode == materialCode)&&(identical(other.model, model) || other.model == model)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.warehouseImportedAt, warehouseImportedAt) || other.warehouseImportedAt == warehouseImportedAt)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&(identical(other.storageDays, storageDays) || other.storageDays == storageDays)&&(identical(other.qcDefectDescription, qcDefectDescription) || other.qcDefectDescription == qcDefectDescription)&&(identical(other.factory, factory) || other.factory == factory)&&(identical(other.parkingLot, parkingLot) || other.parkingLot == parkingLot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serialNumber,materialCode,model,manufacturingDate,color,status,statusLabel,warehouseImportedAt,exportedAt,storageDays,qcDefectDescription,factory,parkingLot);

@override
String toString() {
  return 'VehicleChargingDto(id: $id, serialNumber: $serialNumber, materialCode: $materialCode, model: $model, manufacturingDate: $manufacturingDate, color: $color, status: $status, statusLabel: $statusLabel, warehouseImportedAt: $warehouseImportedAt, exportedAt: $exportedAt, storageDays: $storageDays, qcDefectDescription: $qcDefectDescription, factory: $factory, parkingLot: $parkingLot)';
}


}

/// @nodoc
abstract mixin class $VehicleChargingDtoCopyWith<$Res>  {
  factory $VehicleChargingDtoCopyWith(VehicleChargingDto value, $Res Function(VehicleChargingDto) _then) = _$VehicleChargingDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'serialNumber') String? serialNumber,@JsonKey(name: 'materialCode') String? materialCode,@JsonKey(name: 'model') String? model,@JsonKey(name: 'manufacturingDate') String? manufacturingDate,@JsonKey(name: 'color') String? color,@JsonKey(name: 'status') int? status,@JsonKey(name: 'statusLabel') String? statusLabel,@JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,@JsonKey(name: 'exportedAt') String? exportedAt,@JsonKey(name: 'storageDays') int? storageDays,@JsonKey(name: 'qcDefectDescription') String? qcDefectDescription,@JsonKey(name: 'factory') VehicleChargingFactoryDto? factory,@JsonKey(name: 'parkingLot') VehicleChargingParkingLotDto? parkingLot
});


$VehicleChargingFactoryDtoCopyWith<$Res>? get factory;$VehicleChargingParkingLotDtoCopyWith<$Res>? get parkingLot;

}
/// @nodoc
class _$VehicleChargingDtoCopyWithImpl<$Res>
    implements $VehicleChargingDtoCopyWith<$Res> {
  _$VehicleChargingDtoCopyWithImpl(this._self, this._then);

  final VehicleChargingDto _self;
  final $Res Function(VehicleChargingDto) _then;

/// Create a copy of VehicleChargingDto
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
as VehicleChargingFactoryDto?,parkingLot: freezed == parkingLot ? _self.parkingLot : parkingLot // ignore: cast_nullable_to_non_nullable
as VehicleChargingParkingLotDto?,
  ));
}
/// Create a copy of VehicleChargingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleChargingFactoryDtoCopyWith<$Res>? get factory {
    if (_self.factory == null) {
    return null;
  }

  return $VehicleChargingFactoryDtoCopyWith<$Res>(_self.factory!, (value) {
    return _then(_self.copyWith(factory: value));
  });
}/// Create a copy of VehicleChargingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleChargingParkingLotDtoCopyWith<$Res>? get parkingLot {
    if (_self.parkingLot == null) {
    return null;
  }

  return $VehicleChargingParkingLotDtoCopyWith<$Res>(_self.parkingLot!, (value) {
    return _then(_self.copyWith(parkingLot: value));
  });
}
}


/// Adds pattern-matching-related methods to [VehicleChargingDto].
extension VehicleChargingDtoPatterns on VehicleChargingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleChargingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleChargingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleChargingDto value)  $default,){
final _that = this;
switch (_that) {
case _VehicleChargingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleChargingDto value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleChargingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'manufacturingDate')  String? manufacturingDate, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'storageDays')  int? storageDays, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription, @JsonKey(name: 'factory')  VehicleChargingFactoryDto? factory, @JsonKey(name: 'parkingLot')  VehicleChargingParkingLotDto? parkingLot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleChargingDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'manufacturingDate')  String? manufacturingDate, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'storageDays')  int? storageDays, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription, @JsonKey(name: 'factory')  VehicleChargingFactoryDto? factory, @JsonKey(name: 'parkingLot')  VehicleChargingParkingLotDto? parkingLot)  $default,) {final _that = this;
switch (_that) {
case _VehicleChargingDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'manufacturingDate')  String? manufacturingDate, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'storageDays')  int? storageDays, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription, @JsonKey(name: 'factory')  VehicleChargingFactoryDto? factory, @JsonKey(name: 'parkingLot')  VehicleChargingParkingLotDto? parkingLot)?  $default,) {final _that = this;
switch (_that) {
case _VehicleChargingDto() when $default != null:
return $default(_that.id,_that.serialNumber,_that.materialCode,_that.model,_that.manufacturingDate,_that.color,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.exportedAt,_that.storageDays,_that.qcDefectDescription,_that.factory,_that.parkingLot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleChargingDto implements VehicleChargingDto {
  const _VehicleChargingDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'serialNumber') this.serialNumber, @JsonKey(name: 'materialCode') this.materialCode, @JsonKey(name: 'model') this.model, @JsonKey(name: 'manufacturingDate') this.manufacturingDate, @JsonKey(name: 'color') this.color, @JsonKey(name: 'status') this.status, @JsonKey(name: 'statusLabel') this.statusLabel, @JsonKey(name: 'warehouseImportedAt') this.warehouseImportedAt, @JsonKey(name: 'exportedAt') this.exportedAt, @JsonKey(name: 'storageDays') this.storageDays, @JsonKey(name: 'qcDefectDescription') this.qcDefectDescription, @JsonKey(name: 'factory') this.factory, @JsonKey(name: 'parkingLot') this.parkingLot});
  factory _VehicleChargingDto.fromJson(Map<String, dynamic> json) => _$VehicleChargingDtoFromJson(json);

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
@override@JsonKey(name: 'factory') final  VehicleChargingFactoryDto? factory;
@override@JsonKey(name: 'parkingLot') final  VehicleChargingParkingLotDto? parkingLot;

/// Create a copy of VehicleChargingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleChargingDtoCopyWith<_VehicleChargingDto> get copyWith => __$VehicleChargingDtoCopyWithImpl<_VehicleChargingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleChargingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleChargingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.materialCode, materialCode) || other.materialCode == materialCode)&&(identical(other.model, model) || other.model == model)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.warehouseImportedAt, warehouseImportedAt) || other.warehouseImportedAt == warehouseImportedAt)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&(identical(other.storageDays, storageDays) || other.storageDays == storageDays)&&(identical(other.qcDefectDescription, qcDefectDescription) || other.qcDefectDescription == qcDefectDescription)&&(identical(other.factory, factory) || other.factory == factory)&&(identical(other.parkingLot, parkingLot) || other.parkingLot == parkingLot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serialNumber,materialCode,model,manufacturingDate,color,status,statusLabel,warehouseImportedAt,exportedAt,storageDays,qcDefectDescription,factory,parkingLot);

@override
String toString() {
  return 'VehicleChargingDto(id: $id, serialNumber: $serialNumber, materialCode: $materialCode, model: $model, manufacturingDate: $manufacturingDate, color: $color, status: $status, statusLabel: $statusLabel, warehouseImportedAt: $warehouseImportedAt, exportedAt: $exportedAt, storageDays: $storageDays, qcDefectDescription: $qcDefectDescription, factory: $factory, parkingLot: $parkingLot)';
}


}

/// @nodoc
abstract mixin class _$VehicleChargingDtoCopyWith<$Res> implements $VehicleChargingDtoCopyWith<$Res> {
  factory _$VehicleChargingDtoCopyWith(_VehicleChargingDto value, $Res Function(_VehicleChargingDto) _then) = __$VehicleChargingDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'serialNumber') String? serialNumber,@JsonKey(name: 'materialCode') String? materialCode,@JsonKey(name: 'model') String? model,@JsonKey(name: 'manufacturingDate') String? manufacturingDate,@JsonKey(name: 'color') String? color,@JsonKey(name: 'status') int? status,@JsonKey(name: 'statusLabel') String? statusLabel,@JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,@JsonKey(name: 'exportedAt') String? exportedAt,@JsonKey(name: 'storageDays') int? storageDays,@JsonKey(name: 'qcDefectDescription') String? qcDefectDescription,@JsonKey(name: 'factory') VehicleChargingFactoryDto? factory,@JsonKey(name: 'parkingLot') VehicleChargingParkingLotDto? parkingLot
});


@override $VehicleChargingFactoryDtoCopyWith<$Res>? get factory;@override $VehicleChargingParkingLotDtoCopyWith<$Res>? get parkingLot;

}
/// @nodoc
class __$VehicleChargingDtoCopyWithImpl<$Res>
    implements _$VehicleChargingDtoCopyWith<$Res> {
  __$VehicleChargingDtoCopyWithImpl(this._self, this._then);

  final _VehicleChargingDto _self;
  final $Res Function(_VehicleChargingDto) _then;

/// Create a copy of VehicleChargingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? serialNumber = freezed,Object? materialCode = freezed,Object? model = freezed,Object? manufacturingDate = freezed,Object? color = freezed,Object? status = freezed,Object? statusLabel = freezed,Object? warehouseImportedAt = freezed,Object? exportedAt = freezed,Object? storageDays = freezed,Object? qcDefectDescription = freezed,Object? factory = freezed,Object? parkingLot = freezed,}) {
  return _then(_VehicleChargingDto(
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
as VehicleChargingFactoryDto?,parkingLot: freezed == parkingLot ? _self.parkingLot : parkingLot // ignore: cast_nullable_to_non_nullable
as VehicleChargingParkingLotDto?,
  ));
}

/// Create a copy of VehicleChargingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleChargingFactoryDtoCopyWith<$Res>? get factory {
    if (_self.factory == null) {
    return null;
  }

  return $VehicleChargingFactoryDtoCopyWith<$Res>(_self.factory!, (value) {
    return _then(_self.copyWith(factory: value));
  });
}/// Create a copy of VehicleChargingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleChargingParkingLotDtoCopyWith<$Res>? get parkingLot {
    if (_self.parkingLot == null) {
    return null;
  }

  return $VehicleChargingParkingLotDtoCopyWith<$Res>(_self.parkingLot!, (value) {
    return _then(_self.copyWith(parkingLot: value));
  });
}
}


/// @nodoc
mixin _$VehicleChargingFactoryDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'address') String? get address;
/// Create a copy of VehicleChargingFactoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleChargingFactoryDtoCopyWith<VehicleChargingFactoryDto> get copyWith => _$VehicleChargingFactoryDtoCopyWithImpl<VehicleChargingFactoryDto>(this as VehicleChargingFactoryDto, _$identity);

  /// Serializes this VehicleChargingFactoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleChargingFactoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address);

@override
String toString() {
  return 'VehicleChargingFactoryDto(id: $id, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class $VehicleChargingFactoryDtoCopyWith<$Res>  {
  factory $VehicleChargingFactoryDtoCopyWith(VehicleChargingFactoryDto value, $Res Function(VehicleChargingFactoryDto) _then) = _$VehicleChargingFactoryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'address') String? address
});




}
/// @nodoc
class _$VehicleChargingFactoryDtoCopyWithImpl<$Res>
    implements $VehicleChargingFactoryDtoCopyWith<$Res> {
  _$VehicleChargingFactoryDtoCopyWithImpl(this._self, this._then);

  final VehicleChargingFactoryDto _self;
  final $Res Function(VehicleChargingFactoryDto) _then;

/// Create a copy of VehicleChargingFactoryDto
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


/// Adds pattern-matching-related methods to [VehicleChargingFactoryDto].
extension VehicleChargingFactoryDtoPatterns on VehicleChargingFactoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleChargingFactoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleChargingFactoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleChargingFactoryDto value)  $default,){
final _that = this;
switch (_that) {
case _VehicleChargingFactoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleChargingFactoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleChargingFactoryDto() when $default != null:
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
case _VehicleChargingFactoryDto() when $default != null:
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
case _VehicleChargingFactoryDto():
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
case _VehicleChargingFactoryDto() when $default != null:
return $default(_that.id,_that.name,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleChargingFactoryDto implements VehicleChargingFactoryDto {
  const _VehicleChargingFactoryDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'address') this.address});
  factory _VehicleChargingFactoryDto.fromJson(Map<String, dynamic> json) => _$VehicleChargingFactoryDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'address') final  String? address;

/// Create a copy of VehicleChargingFactoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleChargingFactoryDtoCopyWith<_VehicleChargingFactoryDto> get copyWith => __$VehicleChargingFactoryDtoCopyWithImpl<_VehicleChargingFactoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleChargingFactoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleChargingFactoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address);

@override
String toString() {
  return 'VehicleChargingFactoryDto(id: $id, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class _$VehicleChargingFactoryDtoCopyWith<$Res> implements $VehicleChargingFactoryDtoCopyWith<$Res> {
  factory _$VehicleChargingFactoryDtoCopyWith(_VehicleChargingFactoryDto value, $Res Function(_VehicleChargingFactoryDto) _then) = __$VehicleChargingFactoryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'address') String? address
});




}
/// @nodoc
class __$VehicleChargingFactoryDtoCopyWithImpl<$Res>
    implements _$VehicleChargingFactoryDtoCopyWith<$Res> {
  __$VehicleChargingFactoryDtoCopyWithImpl(this._self, this._then);

  final _VehicleChargingFactoryDto _self;
  final $Res Function(_VehicleChargingFactoryDto) _then;

/// Create a copy of VehicleChargingFactoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? address = freezed,}) {
  return _then(_VehicleChargingFactoryDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VehicleChargingParkingZoneDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'description') String? get description;@JsonKey(name: 'isActive') bool? get isActive;@JsonKey(name: 'factoryId') int? get factoryId;
/// Create a copy of VehicleChargingParkingZoneDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleChargingParkingZoneDtoCopyWith<VehicleChargingParkingZoneDto> get copyWith => _$VehicleChargingParkingZoneDtoCopyWithImpl<VehicleChargingParkingZoneDto>(this as VehicleChargingParkingZoneDto, _$identity);

  /// Serializes this VehicleChargingParkingZoneDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleChargingParkingZoneDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,isActive,factoryId);

@override
String toString() {
  return 'VehicleChargingParkingZoneDto(id: $id, name: $name, description: $description, isActive: $isActive, factoryId: $factoryId)';
}


}

/// @nodoc
abstract mixin class $VehicleChargingParkingZoneDtoCopyWith<$Res>  {
  factory $VehicleChargingParkingZoneDtoCopyWith(VehicleChargingParkingZoneDto value, $Res Function(VehicleChargingParkingZoneDto) _then) = _$VehicleChargingParkingZoneDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'description') String? description,@JsonKey(name: 'isActive') bool? isActive,@JsonKey(name: 'factoryId') int? factoryId
});




}
/// @nodoc
class _$VehicleChargingParkingZoneDtoCopyWithImpl<$Res>
    implements $VehicleChargingParkingZoneDtoCopyWith<$Res> {
  _$VehicleChargingParkingZoneDtoCopyWithImpl(this._self, this._then);

  final VehicleChargingParkingZoneDto _self;
  final $Res Function(VehicleChargingParkingZoneDto) _then;

/// Create a copy of VehicleChargingParkingZoneDto
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


/// Adds pattern-matching-related methods to [VehicleChargingParkingZoneDto].
extension VehicleChargingParkingZoneDtoPatterns on VehicleChargingParkingZoneDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleChargingParkingZoneDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleChargingParkingZoneDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleChargingParkingZoneDto value)  $default,){
final _that = this;
switch (_that) {
case _VehicleChargingParkingZoneDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleChargingParkingZoneDto value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleChargingParkingZoneDto() when $default != null:
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
case _VehicleChargingParkingZoneDto() when $default != null:
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
case _VehicleChargingParkingZoneDto():
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
case _VehicleChargingParkingZoneDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.isActive,_that.factoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleChargingParkingZoneDto implements VehicleChargingParkingZoneDto {
  const _VehicleChargingParkingZoneDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'description') this.description, @JsonKey(name: 'isActive') this.isActive, @JsonKey(name: 'factoryId') this.factoryId});
  factory _VehicleChargingParkingZoneDto.fromJson(Map<String, dynamic> json) => _$VehicleChargingParkingZoneDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'description') final  String? description;
@override@JsonKey(name: 'isActive') final  bool? isActive;
@override@JsonKey(name: 'factoryId') final  int? factoryId;

/// Create a copy of VehicleChargingParkingZoneDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleChargingParkingZoneDtoCopyWith<_VehicleChargingParkingZoneDto> get copyWith => __$VehicleChargingParkingZoneDtoCopyWithImpl<_VehicleChargingParkingZoneDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleChargingParkingZoneDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleChargingParkingZoneDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,isActive,factoryId);

@override
String toString() {
  return 'VehicleChargingParkingZoneDto(id: $id, name: $name, description: $description, isActive: $isActive, factoryId: $factoryId)';
}


}

/// @nodoc
abstract mixin class _$VehicleChargingParkingZoneDtoCopyWith<$Res> implements $VehicleChargingParkingZoneDtoCopyWith<$Res> {
  factory _$VehicleChargingParkingZoneDtoCopyWith(_VehicleChargingParkingZoneDto value, $Res Function(_VehicleChargingParkingZoneDto) _then) = __$VehicleChargingParkingZoneDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'description') String? description,@JsonKey(name: 'isActive') bool? isActive,@JsonKey(name: 'factoryId') int? factoryId
});




}
/// @nodoc
class __$VehicleChargingParkingZoneDtoCopyWithImpl<$Res>
    implements _$VehicleChargingParkingZoneDtoCopyWith<$Res> {
  __$VehicleChargingParkingZoneDtoCopyWithImpl(this._self, this._then);

  final _VehicleChargingParkingZoneDto _self;
  final $Res Function(_VehicleChargingParkingZoneDto) _then;

/// Create a copy of VehicleChargingParkingZoneDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? isActive = freezed,Object? factoryId = freezed,}) {
  return _then(_VehicleChargingParkingZoneDto(
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
mixin _$VehicleChargingParkingLotDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'description') String? get description;@JsonKey(name: 'parkingZoneId') int? get parkingZoneId;@JsonKey(name: 'parkingZone') VehicleChargingParkingZoneDto? get parkingZone;@JsonKey(name: 'maxCapacity') int? get maxCapacity;@JsonKey(name: 'currentOccupied') int? get currentOccupied;
/// Create a copy of VehicleChargingParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleChargingParkingLotDtoCopyWith<VehicleChargingParkingLotDto> get copyWith => _$VehicleChargingParkingLotDtoCopyWithImpl<VehicleChargingParkingLotDto>(this as VehicleChargingParkingLotDto, _$identity);

  /// Serializes this VehicleChargingParkingLotDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleChargingParkingLotDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.parkingZoneId, parkingZoneId) || other.parkingZoneId == parkingZoneId)&&(identical(other.parkingZone, parkingZone) || other.parkingZone == parkingZone)&&(identical(other.maxCapacity, maxCapacity) || other.maxCapacity == maxCapacity)&&(identical(other.currentOccupied, currentOccupied) || other.currentOccupied == currentOccupied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,parkingZoneId,parkingZone,maxCapacity,currentOccupied);

@override
String toString() {
  return 'VehicleChargingParkingLotDto(id: $id, name: $name, description: $description, parkingZoneId: $parkingZoneId, parkingZone: $parkingZone, maxCapacity: $maxCapacity, currentOccupied: $currentOccupied)';
}


}

/// @nodoc
abstract mixin class $VehicleChargingParkingLotDtoCopyWith<$Res>  {
  factory $VehicleChargingParkingLotDtoCopyWith(VehicleChargingParkingLotDto value, $Res Function(VehicleChargingParkingLotDto) _then) = _$VehicleChargingParkingLotDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'description') String? description,@JsonKey(name: 'parkingZoneId') int? parkingZoneId,@JsonKey(name: 'parkingZone') VehicleChargingParkingZoneDto? parkingZone,@JsonKey(name: 'maxCapacity') int? maxCapacity,@JsonKey(name: 'currentOccupied') int? currentOccupied
});


$VehicleChargingParkingZoneDtoCopyWith<$Res>? get parkingZone;

}
/// @nodoc
class _$VehicleChargingParkingLotDtoCopyWithImpl<$Res>
    implements $VehicleChargingParkingLotDtoCopyWith<$Res> {
  _$VehicleChargingParkingLotDtoCopyWithImpl(this._self, this._then);

  final VehicleChargingParkingLotDto _self;
  final $Res Function(VehicleChargingParkingLotDto) _then;

/// Create a copy of VehicleChargingParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? parkingZoneId = freezed,Object? parkingZone = freezed,Object? maxCapacity = freezed,Object? currentOccupied = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,parkingZoneId: freezed == parkingZoneId ? _self.parkingZoneId : parkingZoneId // ignore: cast_nullable_to_non_nullable
as int?,parkingZone: freezed == parkingZone ? _self.parkingZone : parkingZone // ignore: cast_nullable_to_non_nullable
as VehicleChargingParkingZoneDto?,maxCapacity: freezed == maxCapacity ? _self.maxCapacity : maxCapacity // ignore: cast_nullable_to_non_nullable
as int?,currentOccupied: freezed == currentOccupied ? _self.currentOccupied : currentOccupied // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of VehicleChargingParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleChargingParkingZoneDtoCopyWith<$Res>? get parkingZone {
    if (_self.parkingZone == null) {
    return null;
  }

  return $VehicleChargingParkingZoneDtoCopyWith<$Res>(_self.parkingZone!, (value) {
    return _then(_self.copyWith(parkingZone: value));
  });
}
}


/// Adds pattern-matching-related methods to [VehicleChargingParkingLotDto].
extension VehicleChargingParkingLotDtoPatterns on VehicleChargingParkingLotDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleChargingParkingLotDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleChargingParkingLotDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleChargingParkingLotDto value)  $default,){
final _that = this;
switch (_that) {
case _VehicleChargingParkingLotDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleChargingParkingLotDto value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleChargingParkingLotDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'parkingZoneId')  int? parkingZoneId, @JsonKey(name: 'parkingZone')  VehicleChargingParkingZoneDto? parkingZone, @JsonKey(name: 'maxCapacity')  int? maxCapacity, @JsonKey(name: 'currentOccupied')  int? currentOccupied)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleChargingParkingLotDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'parkingZoneId')  int? parkingZoneId, @JsonKey(name: 'parkingZone')  VehicleChargingParkingZoneDto? parkingZone, @JsonKey(name: 'maxCapacity')  int? maxCapacity, @JsonKey(name: 'currentOccupied')  int? currentOccupied)  $default,) {final _that = this;
switch (_that) {
case _VehicleChargingParkingLotDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'parkingZoneId')  int? parkingZoneId, @JsonKey(name: 'parkingZone')  VehicleChargingParkingZoneDto? parkingZone, @JsonKey(name: 'maxCapacity')  int? maxCapacity, @JsonKey(name: 'currentOccupied')  int? currentOccupied)?  $default,) {final _that = this;
switch (_that) {
case _VehicleChargingParkingLotDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.parkingZoneId,_that.parkingZone,_that.maxCapacity,_that.currentOccupied);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleChargingParkingLotDto implements VehicleChargingParkingLotDto {
  const _VehicleChargingParkingLotDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'description') this.description, @JsonKey(name: 'parkingZoneId') this.parkingZoneId, @JsonKey(name: 'parkingZone') this.parkingZone, @JsonKey(name: 'maxCapacity') this.maxCapacity, @JsonKey(name: 'currentOccupied') this.currentOccupied});
  factory _VehicleChargingParkingLotDto.fromJson(Map<String, dynamic> json) => _$VehicleChargingParkingLotDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'description') final  String? description;
@override@JsonKey(name: 'parkingZoneId') final  int? parkingZoneId;
@override@JsonKey(name: 'parkingZone') final  VehicleChargingParkingZoneDto? parkingZone;
@override@JsonKey(name: 'maxCapacity') final  int? maxCapacity;
@override@JsonKey(name: 'currentOccupied') final  int? currentOccupied;

/// Create a copy of VehicleChargingParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleChargingParkingLotDtoCopyWith<_VehicleChargingParkingLotDto> get copyWith => __$VehicleChargingParkingLotDtoCopyWithImpl<_VehicleChargingParkingLotDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleChargingParkingLotDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleChargingParkingLotDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.parkingZoneId, parkingZoneId) || other.parkingZoneId == parkingZoneId)&&(identical(other.parkingZone, parkingZone) || other.parkingZone == parkingZone)&&(identical(other.maxCapacity, maxCapacity) || other.maxCapacity == maxCapacity)&&(identical(other.currentOccupied, currentOccupied) || other.currentOccupied == currentOccupied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,parkingZoneId,parkingZone,maxCapacity,currentOccupied);

@override
String toString() {
  return 'VehicleChargingParkingLotDto(id: $id, name: $name, description: $description, parkingZoneId: $parkingZoneId, parkingZone: $parkingZone, maxCapacity: $maxCapacity, currentOccupied: $currentOccupied)';
}


}

/// @nodoc
abstract mixin class _$VehicleChargingParkingLotDtoCopyWith<$Res> implements $VehicleChargingParkingLotDtoCopyWith<$Res> {
  factory _$VehicleChargingParkingLotDtoCopyWith(_VehicleChargingParkingLotDto value, $Res Function(_VehicleChargingParkingLotDto) _then) = __$VehicleChargingParkingLotDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'description') String? description,@JsonKey(name: 'parkingZoneId') int? parkingZoneId,@JsonKey(name: 'parkingZone') VehicleChargingParkingZoneDto? parkingZone,@JsonKey(name: 'maxCapacity') int? maxCapacity,@JsonKey(name: 'currentOccupied') int? currentOccupied
});


@override $VehicleChargingParkingZoneDtoCopyWith<$Res>? get parkingZone;

}
/// @nodoc
class __$VehicleChargingParkingLotDtoCopyWithImpl<$Res>
    implements _$VehicleChargingParkingLotDtoCopyWith<$Res> {
  __$VehicleChargingParkingLotDtoCopyWithImpl(this._self, this._then);

  final _VehicleChargingParkingLotDto _self;
  final $Res Function(_VehicleChargingParkingLotDto) _then;

/// Create a copy of VehicleChargingParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? parkingZoneId = freezed,Object? parkingZone = freezed,Object? maxCapacity = freezed,Object? currentOccupied = freezed,}) {
  return _then(_VehicleChargingParkingLotDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,parkingZoneId: freezed == parkingZoneId ? _self.parkingZoneId : parkingZoneId // ignore: cast_nullable_to_non_nullable
as int?,parkingZone: freezed == parkingZone ? _self.parkingZone : parkingZone // ignore: cast_nullable_to_non_nullable
as VehicleChargingParkingZoneDto?,maxCapacity: freezed == maxCapacity ? _self.maxCapacity : maxCapacity // ignore: cast_nullable_to_non_nullable
as int?,currentOccupied: freezed == currentOccupied ? _self.currentOccupied : currentOccupied // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of VehicleChargingParkingLotDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleChargingParkingZoneDtoCopyWith<$Res>? get parkingZone {
    if (_self.parkingZone == null) {
    return null;
  }

  return $VehicleChargingParkingZoneDtoCopyWith<$Res>(_self.parkingZone!, (value) {
    return _then(_self.copyWith(parkingZone: value));
  });
}
}

// dart format on
