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
mixin _$VehicleModelDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'serialNumber') String? get serialNumber;@JsonKey(name: 'materialCode') String? get materialCode;@JsonKey(name: 'model') String? get model;@JsonKey(name: 'manufacturingDate') String? get manufacturingDate;@JsonKey(name: 'color') String? get color;@JsonKey(name: 'status') int? get status;@JsonKey(name: 'statusLabel') String? get statusLabel;@JsonKey(name: 'warehouseImportedAt') String? get warehouseImportedAt;@JsonKey(name: 'exportedAt') String? get exportedAt;@JsonKey(name: 'storageDays') int? get storageDays;@JsonKey(name: 'qcDefectDescription') String? get qcDefectDescription;@JsonKey(name: 'factory') VehicleFactoryModelDto? get factory;
/// Create a copy of VehicleModelDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleModelDtoCopyWith<VehicleModelDto> get copyWith => _$VehicleModelDtoCopyWithImpl<VehicleModelDto>(this as VehicleModelDto, _$identity);

  /// Serializes this VehicleModelDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleModelDto&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.materialCode, materialCode) || other.materialCode == materialCode)&&(identical(other.model, model) || other.model == model)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.warehouseImportedAt, warehouseImportedAt) || other.warehouseImportedAt == warehouseImportedAt)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&(identical(other.storageDays, storageDays) || other.storageDays == storageDays)&&(identical(other.qcDefectDescription, qcDefectDescription) || other.qcDefectDescription == qcDefectDescription)&&(identical(other.factory, factory) || other.factory == factory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serialNumber,materialCode,model,manufacturingDate,color,status,statusLabel,warehouseImportedAt,exportedAt,storageDays,qcDefectDescription,factory);

@override
String toString() {
  return 'VehicleModelDto(id: $id, serialNumber: $serialNumber, materialCode: $materialCode, model: $model, manufacturingDate: $manufacturingDate, color: $color, status: $status, statusLabel: $statusLabel, warehouseImportedAt: $warehouseImportedAt, exportedAt: $exportedAt, storageDays: $storageDays, qcDefectDescription: $qcDefectDescription, factory: $factory)';
}


}

/// @nodoc
abstract mixin class $VehicleModelDtoCopyWith<$Res>  {
  factory $VehicleModelDtoCopyWith(VehicleModelDto value, $Res Function(VehicleModelDto) _then) = _$VehicleModelDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'serialNumber') String? serialNumber,@JsonKey(name: 'materialCode') String? materialCode,@JsonKey(name: 'model') String? model,@JsonKey(name: 'manufacturingDate') String? manufacturingDate,@JsonKey(name: 'color') String? color,@JsonKey(name: 'status') int? status,@JsonKey(name: 'statusLabel') String? statusLabel,@JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,@JsonKey(name: 'exportedAt') String? exportedAt,@JsonKey(name: 'storageDays') int? storageDays,@JsonKey(name: 'qcDefectDescription') String? qcDefectDescription,@JsonKey(name: 'factory') VehicleFactoryModelDto? factory
});


$VehicleFactoryModelDtoCopyWith<$Res>? get factory;

}
/// @nodoc
class _$VehicleModelDtoCopyWithImpl<$Res>
    implements $VehicleModelDtoCopyWith<$Res> {
  _$VehicleModelDtoCopyWithImpl(this._self, this._then);

  final VehicleModelDto _self;
  final $Res Function(VehicleModelDto) _then;

/// Create a copy of VehicleModelDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? serialNumber = freezed,Object? materialCode = freezed,Object? model = freezed,Object? manufacturingDate = freezed,Object? color = freezed,Object? status = freezed,Object? statusLabel = freezed,Object? warehouseImportedAt = freezed,Object? exportedAt = freezed,Object? storageDays = freezed,Object? qcDefectDescription = freezed,Object? factory = freezed,}) {
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
as VehicleFactoryModelDto?,
  ));
}
/// Create a copy of VehicleModelDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleFactoryModelDtoCopyWith<$Res>? get factory {
    if (_self.factory == null) {
    return null;
  }

  return $VehicleFactoryModelDtoCopyWith<$Res>(_self.factory!, (value) {
    return _then(_self.copyWith(factory: value));
  });
}
}


/// Adds pattern-matching-related methods to [VehicleModelDto].
extension VehicleModelDtoPatterns on VehicleModelDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleModelDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleModelDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleModelDto value)  $default,){
final _that = this;
switch (_that) {
case _VehicleModelDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleModelDto value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleModelDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'manufacturingDate')  String? manufacturingDate, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'storageDays')  int? storageDays, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription, @JsonKey(name: 'factory')  VehicleFactoryModelDto? factory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleModelDto() when $default != null:
return $default(_that.id,_that.serialNumber,_that.materialCode,_that.model,_that.manufacturingDate,_that.color,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.exportedAt,_that.storageDays,_that.qcDefectDescription,_that.factory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'manufacturingDate')  String? manufacturingDate, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'storageDays')  int? storageDays, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription, @JsonKey(name: 'factory')  VehicleFactoryModelDto? factory)  $default,) {final _that = this;
switch (_that) {
case _VehicleModelDto():
return $default(_that.id,_that.serialNumber,_that.materialCode,_that.model,_that.manufacturingDate,_that.color,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.exportedAt,_that.storageDays,_that.qcDefectDescription,_that.factory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'manufacturingDate')  String? manufacturingDate, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'storageDays')  int? storageDays, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription, @JsonKey(name: 'factory')  VehicleFactoryModelDto? factory)?  $default,) {final _that = this;
switch (_that) {
case _VehicleModelDto() when $default != null:
return $default(_that.id,_that.serialNumber,_that.materialCode,_that.model,_that.manufacturingDate,_that.color,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.exportedAt,_that.storageDays,_that.qcDefectDescription,_that.factory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleModelDto implements VehicleModelDto {
  const _VehicleModelDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'serialNumber') this.serialNumber, @JsonKey(name: 'materialCode') this.materialCode, @JsonKey(name: 'model') this.model, @JsonKey(name: 'manufacturingDate') this.manufacturingDate, @JsonKey(name: 'color') this.color, @JsonKey(name: 'status') this.status, @JsonKey(name: 'statusLabel') this.statusLabel, @JsonKey(name: 'warehouseImportedAt') this.warehouseImportedAt, @JsonKey(name: 'exportedAt') this.exportedAt, @JsonKey(name: 'storageDays') this.storageDays, @JsonKey(name: 'qcDefectDescription') this.qcDefectDescription, @JsonKey(name: 'factory') this.factory});
  factory _VehicleModelDto.fromJson(Map<String, dynamic> json) => _$VehicleModelDtoFromJson(json);

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
@override@JsonKey(name: 'factory') final  VehicleFactoryModelDto? factory;

/// Create a copy of VehicleModelDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleModelDtoCopyWith<_VehicleModelDto> get copyWith => __$VehicleModelDtoCopyWithImpl<_VehicleModelDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleModelDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleModelDto&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.materialCode, materialCode) || other.materialCode == materialCode)&&(identical(other.model, model) || other.model == model)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.warehouseImportedAt, warehouseImportedAt) || other.warehouseImportedAt == warehouseImportedAt)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&(identical(other.storageDays, storageDays) || other.storageDays == storageDays)&&(identical(other.qcDefectDescription, qcDefectDescription) || other.qcDefectDescription == qcDefectDescription)&&(identical(other.factory, factory) || other.factory == factory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serialNumber,materialCode,model,manufacturingDate,color,status,statusLabel,warehouseImportedAt,exportedAt,storageDays,qcDefectDescription,factory);

@override
String toString() {
  return 'VehicleModelDto(id: $id, serialNumber: $serialNumber, materialCode: $materialCode, model: $model, manufacturingDate: $manufacturingDate, color: $color, status: $status, statusLabel: $statusLabel, warehouseImportedAt: $warehouseImportedAt, exportedAt: $exportedAt, storageDays: $storageDays, qcDefectDescription: $qcDefectDescription, factory: $factory)';
}


}

/// @nodoc
abstract mixin class _$VehicleModelDtoCopyWith<$Res> implements $VehicleModelDtoCopyWith<$Res> {
  factory _$VehicleModelDtoCopyWith(_VehicleModelDto value, $Res Function(_VehicleModelDto) _then) = __$VehicleModelDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'serialNumber') String? serialNumber,@JsonKey(name: 'materialCode') String? materialCode,@JsonKey(name: 'model') String? model,@JsonKey(name: 'manufacturingDate') String? manufacturingDate,@JsonKey(name: 'color') String? color,@JsonKey(name: 'status') int? status,@JsonKey(name: 'statusLabel') String? statusLabel,@JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,@JsonKey(name: 'exportedAt') String? exportedAt,@JsonKey(name: 'storageDays') int? storageDays,@JsonKey(name: 'qcDefectDescription') String? qcDefectDescription,@JsonKey(name: 'factory') VehicleFactoryModelDto? factory
});


@override $VehicleFactoryModelDtoCopyWith<$Res>? get factory;

}
/// @nodoc
class __$VehicleModelDtoCopyWithImpl<$Res>
    implements _$VehicleModelDtoCopyWith<$Res> {
  __$VehicleModelDtoCopyWithImpl(this._self, this._then);

  final _VehicleModelDto _self;
  final $Res Function(_VehicleModelDto) _then;

/// Create a copy of VehicleModelDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? serialNumber = freezed,Object? materialCode = freezed,Object? model = freezed,Object? manufacturingDate = freezed,Object? color = freezed,Object? status = freezed,Object? statusLabel = freezed,Object? warehouseImportedAt = freezed,Object? exportedAt = freezed,Object? storageDays = freezed,Object? qcDefectDescription = freezed,Object? factory = freezed,}) {
  return _then(_VehicleModelDto(
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
as VehicleFactoryModelDto?,
  ));
}

/// Create a copy of VehicleModelDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleFactoryModelDtoCopyWith<$Res>? get factory {
    if (_self.factory == null) {
    return null;
  }

  return $VehicleFactoryModelDtoCopyWith<$Res>(_self.factory!, (value) {
    return _then(_self.copyWith(factory: value));
  });
}
}


/// @nodoc
mixin _$VehicleFactoryModelDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'address') String? get address;
/// Create a copy of VehicleFactoryModelDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleFactoryModelDtoCopyWith<VehicleFactoryModelDto> get copyWith => _$VehicleFactoryModelDtoCopyWithImpl<VehicleFactoryModelDto>(this as VehicleFactoryModelDto, _$identity);

  /// Serializes this VehicleFactoryModelDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleFactoryModelDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address);

@override
String toString() {
  return 'VehicleFactoryModelDto(id: $id, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class $VehicleFactoryModelDtoCopyWith<$Res>  {
  factory $VehicleFactoryModelDtoCopyWith(VehicleFactoryModelDto value, $Res Function(VehicleFactoryModelDto) _then) = _$VehicleFactoryModelDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'address') String? address
});




}
/// @nodoc
class _$VehicleFactoryModelDtoCopyWithImpl<$Res>
    implements $VehicleFactoryModelDtoCopyWith<$Res> {
  _$VehicleFactoryModelDtoCopyWithImpl(this._self, this._then);

  final VehicleFactoryModelDto _self;
  final $Res Function(VehicleFactoryModelDto) _then;

/// Create a copy of VehicleFactoryModelDto
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


/// Adds pattern-matching-related methods to [VehicleFactoryModelDto].
extension VehicleFactoryModelDtoPatterns on VehicleFactoryModelDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleFactoryModelDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleFactoryModelDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleFactoryModelDto value)  $default,){
final _that = this;
switch (_that) {
case _VehicleFactoryModelDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleFactoryModelDto value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleFactoryModelDto() when $default != null:
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
case _VehicleFactoryModelDto() when $default != null:
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
case _VehicleFactoryModelDto():
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
case _VehicleFactoryModelDto() when $default != null:
return $default(_that.id,_that.name,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleFactoryModelDto implements VehicleFactoryModelDto {
  const _VehicleFactoryModelDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'address') this.address});
  factory _VehicleFactoryModelDto.fromJson(Map<String, dynamic> json) => _$VehicleFactoryModelDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'address') final  String? address;

/// Create a copy of VehicleFactoryModelDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleFactoryModelDtoCopyWith<_VehicleFactoryModelDto> get copyWith => __$VehicleFactoryModelDtoCopyWithImpl<_VehicleFactoryModelDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleFactoryModelDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleFactoryModelDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address);

@override
String toString() {
  return 'VehicleFactoryModelDto(id: $id, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class _$VehicleFactoryModelDtoCopyWith<$Res> implements $VehicleFactoryModelDtoCopyWith<$Res> {
  factory _$VehicleFactoryModelDtoCopyWith(_VehicleFactoryModelDto value, $Res Function(_VehicleFactoryModelDto) _then) = __$VehicleFactoryModelDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'address') String? address
});




}
/// @nodoc
class __$VehicleFactoryModelDtoCopyWithImpl<$Res>
    implements _$VehicleFactoryModelDtoCopyWith<$Res> {
  __$VehicleFactoryModelDtoCopyWithImpl(this._self, this._then);

  final _VehicleFactoryModelDto _self;
  final $Res Function(_VehicleFactoryModelDto) _then;

/// Create a copy of VehicleFactoryModelDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? address = freezed,}) {
  return _then(_VehicleFactoryModelDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
