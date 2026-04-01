// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_vehicle_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParkingVehicleDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'serialNumber') String? get serialNumber;@JsonKey(name: 'materialCode') String? get materialCode;@JsonKey(name: 'model') String? get model;@JsonKey(name: 'color') String? get color;@JsonKey(name: 'status') int? get status;@JsonKey(name: 'statusLabel') String? get statusLabel;@JsonKey(name: 'warehouseImportedAt') String? get warehouseImportedAt;@JsonKey(name: 'exportedAt') String? get exportedAt;@JsonKey(name: 'type') String? get type;@JsonKey(name: 'agingDays') int? get agingDays;
/// Create a copy of ParkingVehicleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingVehicleDtoCopyWith<ParkingVehicleDto> get copyWith => _$ParkingVehicleDtoCopyWithImpl<ParkingVehicleDto>(this as ParkingVehicleDto, _$identity);

  /// Serializes this ParkingVehicleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingVehicleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.materialCode, materialCode) || other.materialCode == materialCode)&&(identical(other.model, model) || other.model == model)&&(identical(other.color, color) || other.color == color)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.warehouseImportedAt, warehouseImportedAt) || other.warehouseImportedAt == warehouseImportedAt)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.agingDays, agingDays) || other.agingDays == agingDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serialNumber,materialCode,model,color,status,statusLabel,warehouseImportedAt,exportedAt,type,agingDays);

@override
String toString() {
  return 'ParkingVehicleDto(id: $id, serialNumber: $serialNumber, materialCode: $materialCode, model: $model, color: $color, status: $status, statusLabel: $statusLabel, warehouseImportedAt: $warehouseImportedAt, exportedAt: $exportedAt, type: $type, agingDays: $agingDays)';
}


}

/// @nodoc
abstract mixin class $ParkingVehicleDtoCopyWith<$Res>  {
  factory $ParkingVehicleDtoCopyWith(ParkingVehicleDto value, $Res Function(ParkingVehicleDto) _then) = _$ParkingVehicleDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'serialNumber') String? serialNumber,@JsonKey(name: 'materialCode') String? materialCode,@JsonKey(name: 'model') String? model,@JsonKey(name: 'color') String? color,@JsonKey(name: 'status') int? status,@JsonKey(name: 'statusLabel') String? statusLabel,@JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,@JsonKey(name: 'exportedAt') String? exportedAt,@JsonKey(name: 'type') String? type,@JsonKey(name: 'agingDays') int? agingDays
});




}
/// @nodoc
class _$ParkingVehicleDtoCopyWithImpl<$Res>
    implements $ParkingVehicleDtoCopyWith<$Res> {
  _$ParkingVehicleDtoCopyWithImpl(this._self, this._then);

  final ParkingVehicleDto _self;
  final $Res Function(ParkingVehicleDto) _then;

/// Create a copy of ParkingVehicleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? serialNumber = freezed,Object? materialCode = freezed,Object? model = freezed,Object? color = freezed,Object? status = freezed,Object? statusLabel = freezed,Object? warehouseImportedAt = freezed,Object? exportedAt = freezed,Object? type = freezed,Object? agingDays = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,materialCode: freezed == materialCode ? _self.materialCode : materialCode // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,warehouseImportedAt: freezed == warehouseImportedAt ? _self.warehouseImportedAt : warehouseImportedAt // ignore: cast_nullable_to_non_nullable
as String?,exportedAt: freezed == exportedAt ? _self.exportedAt : exportedAt // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,agingDays: freezed == agingDays ? _self.agingDays : agingDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ParkingVehicleDto].
extension ParkingVehicleDtoPatterns on ParkingVehicleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParkingVehicleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParkingVehicleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParkingVehicleDto value)  $default,){
final _that = this;
switch (_that) {
case _ParkingVehicleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParkingVehicleDto value)?  $default,){
final _that = this;
switch (_that) {
case _ParkingVehicleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'type')  String? type, @JsonKey(name: 'agingDays')  int? agingDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParkingVehicleDto() when $default != null:
return $default(_that.id,_that.serialNumber,_that.materialCode,_that.model,_that.color,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.exportedAt,_that.type,_that.agingDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'type')  String? type, @JsonKey(name: 'agingDays')  int? agingDays)  $default,) {final _that = this;
switch (_that) {
case _ParkingVehicleDto():
return $default(_that.id,_that.serialNumber,_that.materialCode,_that.model,_that.color,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.exportedAt,_that.type,_that.agingDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'type')  String? type, @JsonKey(name: 'agingDays')  int? agingDays)?  $default,) {final _that = this;
switch (_that) {
case _ParkingVehicleDto() when $default != null:
return $default(_that.id,_that.serialNumber,_that.materialCode,_that.model,_that.color,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.exportedAt,_that.type,_that.agingDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParkingVehicleDto implements ParkingVehicleDto {
  const _ParkingVehicleDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'serialNumber') this.serialNumber, @JsonKey(name: 'materialCode') this.materialCode, @JsonKey(name: 'model') this.model, @JsonKey(name: 'color') this.color, @JsonKey(name: 'status') this.status, @JsonKey(name: 'statusLabel') this.statusLabel, @JsonKey(name: 'warehouseImportedAt') this.warehouseImportedAt, @JsonKey(name: 'exportedAt') this.exportedAt, @JsonKey(name: 'type') this.type, @JsonKey(name: 'agingDays') this.agingDays});
  factory _ParkingVehicleDto.fromJson(Map<String, dynamic> json) => _$ParkingVehicleDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'serialNumber') final  String? serialNumber;
@override@JsonKey(name: 'materialCode') final  String? materialCode;
@override@JsonKey(name: 'model') final  String? model;
@override@JsonKey(name: 'color') final  String? color;
@override@JsonKey(name: 'status') final  int? status;
@override@JsonKey(name: 'statusLabel') final  String? statusLabel;
@override@JsonKey(name: 'warehouseImportedAt') final  String? warehouseImportedAt;
@override@JsonKey(name: 'exportedAt') final  String? exportedAt;
@override@JsonKey(name: 'type') final  String? type;
@override@JsonKey(name: 'agingDays') final  int? agingDays;

/// Create a copy of ParkingVehicleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkingVehicleDtoCopyWith<_ParkingVehicleDto> get copyWith => __$ParkingVehicleDtoCopyWithImpl<_ParkingVehicleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParkingVehicleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingVehicleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.materialCode, materialCode) || other.materialCode == materialCode)&&(identical(other.model, model) || other.model == model)&&(identical(other.color, color) || other.color == color)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.warehouseImportedAt, warehouseImportedAt) || other.warehouseImportedAt == warehouseImportedAt)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.agingDays, agingDays) || other.agingDays == agingDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serialNumber,materialCode,model,color,status,statusLabel,warehouseImportedAt,exportedAt,type,agingDays);

@override
String toString() {
  return 'ParkingVehicleDto(id: $id, serialNumber: $serialNumber, materialCode: $materialCode, model: $model, color: $color, status: $status, statusLabel: $statusLabel, warehouseImportedAt: $warehouseImportedAt, exportedAt: $exportedAt, type: $type, agingDays: $agingDays)';
}


}

/// @nodoc
abstract mixin class _$ParkingVehicleDtoCopyWith<$Res> implements $ParkingVehicleDtoCopyWith<$Res> {
  factory _$ParkingVehicleDtoCopyWith(_ParkingVehicleDto value, $Res Function(_ParkingVehicleDto) _then) = __$ParkingVehicleDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'serialNumber') String? serialNumber,@JsonKey(name: 'materialCode') String? materialCode,@JsonKey(name: 'model') String? model,@JsonKey(name: 'color') String? color,@JsonKey(name: 'status') int? status,@JsonKey(name: 'statusLabel') String? statusLabel,@JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,@JsonKey(name: 'exportedAt') String? exportedAt,@JsonKey(name: 'type') String? type,@JsonKey(name: 'agingDays') int? agingDays
});




}
/// @nodoc
class __$ParkingVehicleDtoCopyWithImpl<$Res>
    implements _$ParkingVehicleDtoCopyWith<$Res> {
  __$ParkingVehicleDtoCopyWithImpl(this._self, this._then);

  final _ParkingVehicleDto _self;
  final $Res Function(_ParkingVehicleDto) _then;

/// Create a copy of ParkingVehicleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? serialNumber = freezed,Object? materialCode = freezed,Object? model = freezed,Object? color = freezed,Object? status = freezed,Object? statusLabel = freezed,Object? warehouseImportedAt = freezed,Object? exportedAt = freezed,Object? type = freezed,Object? agingDays = freezed,}) {
  return _then(_ParkingVehicleDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,materialCode: freezed == materialCode ? _self.materialCode : materialCode // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,warehouseImportedAt: freezed == warehouseImportedAt ? _self.warehouseImportedAt : warehouseImportedAt // ignore: cast_nullable_to_non_nullable
as String?,exportedAt: freezed == exportedAt ? _self.exportedAt : exportedAt // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,agingDays: freezed == agingDays ? _self.agingDays : agingDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
