// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'export_area_delivery_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExportAreaDeliveryOrderDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'doCode') String? get doCode;@JsonKey(name: 'factoryId') int? get factoryId;@JsonKey(name: 'storeName') String? get storeName;@JsonKey(name: 'storeBranch') String? get storeBranch;@JsonKey(name: 'status') String? get status;@JsonKey(name: 'totalQuantity') int? get totalQuantity;@JsonKey(name: 'fulfilledQuantity') int? get fulfilledQuantity;@JsonKey(name: 'createdAt') String? get createdAt;@JsonKey(name: 'updatedAt') String? get updatedAt;
/// Create a copy of ExportAreaDeliveryOrderDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExportAreaDeliveryOrderDtoCopyWith<ExportAreaDeliveryOrderDto> get copyWith => _$ExportAreaDeliveryOrderDtoCopyWithImpl<ExportAreaDeliveryOrderDto>(this as ExportAreaDeliveryOrderDto, _$identity);

  /// Serializes this ExportAreaDeliveryOrderDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExportAreaDeliveryOrderDto&&(identical(other.id, id) || other.id == id)&&(identical(other.doCode, doCode) || other.doCode == doCode)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.storeBranch, storeBranch) || other.storeBranch == storeBranch)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.fulfilledQuantity, fulfilledQuantity) || other.fulfilledQuantity == fulfilledQuantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doCode,factoryId,storeName,storeBranch,status,totalQuantity,fulfilledQuantity,createdAt,updatedAt);

@override
String toString() {
  return 'ExportAreaDeliveryOrderDto(id: $id, doCode: $doCode, factoryId: $factoryId, storeName: $storeName, storeBranch: $storeBranch, status: $status, totalQuantity: $totalQuantity, fulfilledQuantity: $fulfilledQuantity, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ExportAreaDeliveryOrderDtoCopyWith<$Res>  {
  factory $ExportAreaDeliveryOrderDtoCopyWith(ExportAreaDeliveryOrderDto value, $Res Function(ExportAreaDeliveryOrderDto) _then) = _$ExportAreaDeliveryOrderDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'doCode') String? doCode,@JsonKey(name: 'factoryId') int? factoryId,@JsonKey(name: 'storeName') String? storeName,@JsonKey(name: 'storeBranch') String? storeBranch,@JsonKey(name: 'status') String? status,@JsonKey(name: 'totalQuantity') int? totalQuantity,@JsonKey(name: 'fulfilledQuantity') int? fulfilledQuantity,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt
});




}
/// @nodoc
class _$ExportAreaDeliveryOrderDtoCopyWithImpl<$Res>
    implements $ExportAreaDeliveryOrderDtoCopyWith<$Res> {
  _$ExportAreaDeliveryOrderDtoCopyWithImpl(this._self, this._then);

  final ExportAreaDeliveryOrderDto _self;
  final $Res Function(ExportAreaDeliveryOrderDto) _then;

/// Create a copy of ExportAreaDeliveryOrderDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? doCode = freezed,Object? factoryId = freezed,Object? storeName = freezed,Object? storeBranch = freezed,Object? status = freezed,Object? totalQuantity = freezed,Object? fulfilledQuantity = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,doCode: freezed == doCode ? _self.doCode : doCode // ignore: cast_nullable_to_non_nullable
as String?,factoryId: freezed == factoryId ? _self.factoryId : factoryId // ignore: cast_nullable_to_non_nullable
as int?,storeName: freezed == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String?,storeBranch: freezed == storeBranch ? _self.storeBranch : storeBranch // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,totalQuantity: freezed == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int?,fulfilledQuantity: freezed == fulfilledQuantity ? _self.fulfilledQuantity : fulfilledQuantity // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExportAreaDeliveryOrderDto].
extension ExportAreaDeliveryOrderDtoPatterns on ExportAreaDeliveryOrderDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExportAreaDeliveryOrderDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExportAreaDeliveryOrderDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExportAreaDeliveryOrderDto value)  $default,){
final _that = this;
switch (_that) {
case _ExportAreaDeliveryOrderDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExportAreaDeliveryOrderDto value)?  $default,){
final _that = this;
switch (_that) {
case _ExportAreaDeliveryOrderDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'doCode')  String? doCode, @JsonKey(name: 'factoryId')  int? factoryId, @JsonKey(name: 'storeName')  String? storeName, @JsonKey(name: 'storeBranch')  String? storeBranch, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'totalQuantity')  int? totalQuantity, @JsonKey(name: 'fulfilledQuantity')  int? fulfilledQuantity, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExportAreaDeliveryOrderDto() when $default != null:
return $default(_that.id,_that.doCode,_that.factoryId,_that.storeName,_that.storeBranch,_that.status,_that.totalQuantity,_that.fulfilledQuantity,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'doCode')  String? doCode, @JsonKey(name: 'factoryId')  int? factoryId, @JsonKey(name: 'storeName')  String? storeName, @JsonKey(name: 'storeBranch')  String? storeBranch, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'totalQuantity')  int? totalQuantity, @JsonKey(name: 'fulfilledQuantity')  int? fulfilledQuantity, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ExportAreaDeliveryOrderDto():
return $default(_that.id,_that.doCode,_that.factoryId,_that.storeName,_that.storeBranch,_that.status,_that.totalQuantity,_that.fulfilledQuantity,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'doCode')  String? doCode, @JsonKey(name: 'factoryId')  int? factoryId, @JsonKey(name: 'storeName')  String? storeName, @JsonKey(name: 'storeBranch')  String? storeBranch, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'totalQuantity')  int? totalQuantity, @JsonKey(name: 'fulfilledQuantity')  int? fulfilledQuantity, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ExportAreaDeliveryOrderDto() when $default != null:
return $default(_that.id,_that.doCode,_that.factoryId,_that.storeName,_that.storeBranch,_that.status,_that.totalQuantity,_that.fulfilledQuantity,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExportAreaDeliveryOrderDto implements ExportAreaDeliveryOrderDto {
  const _ExportAreaDeliveryOrderDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'doCode') this.doCode, @JsonKey(name: 'factoryId') this.factoryId, @JsonKey(name: 'storeName') this.storeName, @JsonKey(name: 'storeBranch') this.storeBranch, @JsonKey(name: 'status') this.status, @JsonKey(name: 'totalQuantity') this.totalQuantity, @JsonKey(name: 'fulfilledQuantity') this.fulfilledQuantity, @JsonKey(name: 'createdAt') this.createdAt, @JsonKey(name: 'updatedAt') this.updatedAt});
  factory _ExportAreaDeliveryOrderDto.fromJson(Map<String, dynamic> json) => _$ExportAreaDeliveryOrderDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'doCode') final  String? doCode;
@override@JsonKey(name: 'factoryId') final  int? factoryId;
@override@JsonKey(name: 'storeName') final  String? storeName;
@override@JsonKey(name: 'storeBranch') final  String? storeBranch;
@override@JsonKey(name: 'status') final  String? status;
@override@JsonKey(name: 'totalQuantity') final  int? totalQuantity;
@override@JsonKey(name: 'fulfilledQuantity') final  int? fulfilledQuantity;
@override@JsonKey(name: 'createdAt') final  String? createdAt;
@override@JsonKey(name: 'updatedAt') final  String? updatedAt;

/// Create a copy of ExportAreaDeliveryOrderDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExportAreaDeliveryOrderDtoCopyWith<_ExportAreaDeliveryOrderDto> get copyWith => __$ExportAreaDeliveryOrderDtoCopyWithImpl<_ExportAreaDeliveryOrderDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExportAreaDeliveryOrderDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExportAreaDeliveryOrderDto&&(identical(other.id, id) || other.id == id)&&(identical(other.doCode, doCode) || other.doCode == doCode)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.storeBranch, storeBranch) || other.storeBranch == storeBranch)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.fulfilledQuantity, fulfilledQuantity) || other.fulfilledQuantity == fulfilledQuantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doCode,factoryId,storeName,storeBranch,status,totalQuantity,fulfilledQuantity,createdAt,updatedAt);

@override
String toString() {
  return 'ExportAreaDeliveryOrderDto(id: $id, doCode: $doCode, factoryId: $factoryId, storeName: $storeName, storeBranch: $storeBranch, status: $status, totalQuantity: $totalQuantity, fulfilledQuantity: $fulfilledQuantity, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ExportAreaDeliveryOrderDtoCopyWith<$Res> implements $ExportAreaDeliveryOrderDtoCopyWith<$Res> {
  factory _$ExportAreaDeliveryOrderDtoCopyWith(_ExportAreaDeliveryOrderDto value, $Res Function(_ExportAreaDeliveryOrderDto) _then) = __$ExportAreaDeliveryOrderDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'doCode') String? doCode,@JsonKey(name: 'factoryId') int? factoryId,@JsonKey(name: 'storeName') String? storeName,@JsonKey(name: 'storeBranch') String? storeBranch,@JsonKey(name: 'status') String? status,@JsonKey(name: 'totalQuantity') int? totalQuantity,@JsonKey(name: 'fulfilledQuantity') int? fulfilledQuantity,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt
});




}
/// @nodoc
class __$ExportAreaDeliveryOrderDtoCopyWithImpl<$Res>
    implements _$ExportAreaDeliveryOrderDtoCopyWith<$Res> {
  __$ExportAreaDeliveryOrderDtoCopyWithImpl(this._self, this._then);

  final _ExportAreaDeliveryOrderDto _self;
  final $Res Function(_ExportAreaDeliveryOrderDto) _then;

/// Create a copy of ExportAreaDeliveryOrderDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? doCode = freezed,Object? factoryId = freezed,Object? storeName = freezed,Object? storeBranch = freezed,Object? status = freezed,Object? totalQuantity = freezed,Object? fulfilledQuantity = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ExportAreaDeliveryOrderDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,doCode: freezed == doCode ? _self.doCode : doCode // ignore: cast_nullable_to_non_nullable
as String?,factoryId: freezed == factoryId ? _self.factoryId : factoryId // ignore: cast_nullable_to_non_nullable
as int?,storeName: freezed == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String?,storeBranch: freezed == storeBranch ? _self.storeBranch : storeBranch // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,totalQuantity: freezed == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int?,fulfilledQuantity: freezed == fulfilledQuantity ? _self.fulfilledQuantity : fulfilledQuantity // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
