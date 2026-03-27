// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryOrderDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'doCode') String? get doCode;@JsonKey(name: 'factoryId') int? get factoryId;@JsonKey(name: 'storeName') String? get storeName;@JsonKey(name: 'storeBranch') String? get storeBranch;@JsonKey(name: 'status') String? get status;@JsonKey(name: 'totalQuantity') int? get totalQuantity;@JsonKey(name: 'fulfilledQuantity') int? get fulfilledQuantity;@JsonKey(name: 'createdAt') String? get createdAt;@JsonKey(name: 'updatedAt') String? get updatedAt;@JsonKey(name: 'items') List<DeliveryOrderItemDto>? get items;@JsonKey(name: 'vehicles') List<DeliveryOrderVehicleDto>? get vehicles;
/// Create a copy of DeliveryOrderDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryOrderDtoCopyWith<DeliveryOrderDto> get copyWith => _$DeliveryOrderDtoCopyWithImpl<DeliveryOrderDto>(this as DeliveryOrderDto, _$identity);

  /// Serializes this DeliveryOrderDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryOrderDto&&(identical(other.id, id) || other.id == id)&&(identical(other.doCode, doCode) || other.doCode == doCode)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.storeBranch, storeBranch) || other.storeBranch == storeBranch)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.fulfilledQuantity, fulfilledQuantity) || other.fulfilledQuantity == fulfilledQuantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.vehicles, vehicles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doCode,factoryId,storeName,storeBranch,status,totalQuantity,fulfilledQuantity,createdAt,updatedAt,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(vehicles));

@override
String toString() {
  return 'DeliveryOrderDto(id: $id, doCode: $doCode, factoryId: $factoryId, storeName: $storeName, storeBranch: $storeBranch, status: $status, totalQuantity: $totalQuantity, fulfilledQuantity: $fulfilledQuantity, createdAt: $createdAt, updatedAt: $updatedAt, items: $items, vehicles: $vehicles)';
}


}

/// @nodoc
abstract mixin class $DeliveryOrderDtoCopyWith<$Res>  {
  factory $DeliveryOrderDtoCopyWith(DeliveryOrderDto value, $Res Function(DeliveryOrderDto) _then) = _$DeliveryOrderDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'doCode') String? doCode,@JsonKey(name: 'factoryId') int? factoryId,@JsonKey(name: 'storeName') String? storeName,@JsonKey(name: 'storeBranch') String? storeBranch,@JsonKey(name: 'status') String? status,@JsonKey(name: 'totalQuantity') int? totalQuantity,@JsonKey(name: 'fulfilledQuantity') int? fulfilledQuantity,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'items') List<DeliveryOrderItemDto>? items,@JsonKey(name: 'vehicles') List<DeliveryOrderVehicleDto>? vehicles
});




}
/// @nodoc
class _$DeliveryOrderDtoCopyWithImpl<$Res>
    implements $DeliveryOrderDtoCopyWith<$Res> {
  _$DeliveryOrderDtoCopyWithImpl(this._self, this._then);

  final DeliveryOrderDto _self;
  final $Res Function(DeliveryOrderDto) _then;

/// Create a copy of DeliveryOrderDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? doCode = freezed,Object? factoryId = freezed,Object? storeName = freezed,Object? storeBranch = freezed,Object? status = freezed,Object? totalQuantity = freezed,Object? fulfilledQuantity = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? items = freezed,Object? vehicles = freezed,}) {
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
as String?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<DeliveryOrderItemDto>?,vehicles: freezed == vehicles ? _self.vehicles : vehicles // ignore: cast_nullable_to_non_nullable
as List<DeliveryOrderVehicleDto>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryOrderDto].
extension DeliveryOrderDtoPatterns on DeliveryOrderDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryOrderDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryOrderDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryOrderDto value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryOrderDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryOrderDto value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryOrderDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'doCode')  String? doCode, @JsonKey(name: 'factoryId')  int? factoryId, @JsonKey(name: 'storeName')  String? storeName, @JsonKey(name: 'storeBranch')  String? storeBranch, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'totalQuantity')  int? totalQuantity, @JsonKey(name: 'fulfilledQuantity')  int? fulfilledQuantity, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'items')  List<DeliveryOrderItemDto>? items, @JsonKey(name: 'vehicles')  List<DeliveryOrderVehicleDto>? vehicles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryOrderDto() when $default != null:
return $default(_that.id,_that.doCode,_that.factoryId,_that.storeName,_that.storeBranch,_that.status,_that.totalQuantity,_that.fulfilledQuantity,_that.createdAt,_that.updatedAt,_that.items,_that.vehicles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'doCode')  String? doCode, @JsonKey(name: 'factoryId')  int? factoryId, @JsonKey(name: 'storeName')  String? storeName, @JsonKey(name: 'storeBranch')  String? storeBranch, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'totalQuantity')  int? totalQuantity, @JsonKey(name: 'fulfilledQuantity')  int? fulfilledQuantity, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'items')  List<DeliveryOrderItemDto>? items, @JsonKey(name: 'vehicles')  List<DeliveryOrderVehicleDto>? vehicles)  $default,) {final _that = this;
switch (_that) {
case _DeliveryOrderDto():
return $default(_that.id,_that.doCode,_that.factoryId,_that.storeName,_that.storeBranch,_that.status,_that.totalQuantity,_that.fulfilledQuantity,_that.createdAt,_that.updatedAt,_that.items,_that.vehicles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'doCode')  String? doCode, @JsonKey(name: 'factoryId')  int? factoryId, @JsonKey(name: 'storeName')  String? storeName, @JsonKey(name: 'storeBranch')  String? storeBranch, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'totalQuantity')  int? totalQuantity, @JsonKey(name: 'fulfilledQuantity')  int? fulfilledQuantity, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'items')  List<DeliveryOrderItemDto>? items, @JsonKey(name: 'vehicles')  List<DeliveryOrderVehicleDto>? vehicles)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryOrderDto() when $default != null:
return $default(_that.id,_that.doCode,_that.factoryId,_that.storeName,_that.storeBranch,_that.status,_that.totalQuantity,_that.fulfilledQuantity,_that.createdAt,_that.updatedAt,_that.items,_that.vehicles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryOrderDto implements DeliveryOrderDto {
  const _DeliveryOrderDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'doCode') this.doCode, @JsonKey(name: 'factoryId') this.factoryId, @JsonKey(name: 'storeName') this.storeName, @JsonKey(name: 'storeBranch') this.storeBranch, @JsonKey(name: 'status') this.status, @JsonKey(name: 'totalQuantity') this.totalQuantity, @JsonKey(name: 'fulfilledQuantity') this.fulfilledQuantity, @JsonKey(name: 'createdAt') this.createdAt, @JsonKey(name: 'updatedAt') this.updatedAt, @JsonKey(name: 'items') final  List<DeliveryOrderItemDto>? items, @JsonKey(name: 'vehicles') final  List<DeliveryOrderVehicleDto>? vehicles}): _items = items,_vehicles = vehicles;
  factory _DeliveryOrderDto.fromJson(Map<String, dynamic> json) => _$DeliveryOrderDtoFromJson(json);

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
 final  List<DeliveryOrderItemDto>? _items;
@override@JsonKey(name: 'items') List<DeliveryOrderItemDto>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<DeliveryOrderVehicleDto>? _vehicles;
@override@JsonKey(name: 'vehicles') List<DeliveryOrderVehicleDto>? get vehicles {
  final value = _vehicles;
  if (value == null) return null;
  if (_vehicles is EqualUnmodifiableListView) return _vehicles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DeliveryOrderDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryOrderDtoCopyWith<_DeliveryOrderDto> get copyWith => __$DeliveryOrderDtoCopyWithImpl<_DeliveryOrderDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryOrderDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryOrderDto&&(identical(other.id, id) || other.id == id)&&(identical(other.doCode, doCode) || other.doCode == doCode)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.storeBranch, storeBranch) || other.storeBranch == storeBranch)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.fulfilledQuantity, fulfilledQuantity) || other.fulfilledQuantity == fulfilledQuantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._vehicles, _vehicles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doCode,factoryId,storeName,storeBranch,status,totalQuantity,fulfilledQuantity,createdAt,updatedAt,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_vehicles));

@override
String toString() {
  return 'DeliveryOrderDto(id: $id, doCode: $doCode, factoryId: $factoryId, storeName: $storeName, storeBranch: $storeBranch, status: $status, totalQuantity: $totalQuantity, fulfilledQuantity: $fulfilledQuantity, createdAt: $createdAt, updatedAt: $updatedAt, items: $items, vehicles: $vehicles)';
}


}

/// @nodoc
abstract mixin class _$DeliveryOrderDtoCopyWith<$Res> implements $DeliveryOrderDtoCopyWith<$Res> {
  factory _$DeliveryOrderDtoCopyWith(_DeliveryOrderDto value, $Res Function(_DeliveryOrderDto) _then) = __$DeliveryOrderDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'doCode') String? doCode,@JsonKey(name: 'factoryId') int? factoryId,@JsonKey(name: 'storeName') String? storeName,@JsonKey(name: 'storeBranch') String? storeBranch,@JsonKey(name: 'status') String? status,@JsonKey(name: 'totalQuantity') int? totalQuantity,@JsonKey(name: 'fulfilledQuantity') int? fulfilledQuantity,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'items') List<DeliveryOrderItemDto>? items,@JsonKey(name: 'vehicles') List<DeliveryOrderVehicleDto>? vehicles
});




}
/// @nodoc
class __$DeliveryOrderDtoCopyWithImpl<$Res>
    implements _$DeliveryOrderDtoCopyWith<$Res> {
  __$DeliveryOrderDtoCopyWithImpl(this._self, this._then);

  final _DeliveryOrderDto _self;
  final $Res Function(_DeliveryOrderDto) _then;

/// Create a copy of DeliveryOrderDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? doCode = freezed,Object? factoryId = freezed,Object? storeName = freezed,Object? storeBranch = freezed,Object? status = freezed,Object? totalQuantity = freezed,Object? fulfilledQuantity = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? items = freezed,Object? vehicles = freezed,}) {
  return _then(_DeliveryOrderDto(
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
as String?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<DeliveryOrderItemDto>?,vehicles: freezed == vehicles ? _self._vehicles : vehicles // ignore: cast_nullable_to_non_nullable
as List<DeliveryOrderVehicleDto>?,
  ));
}


}


/// @nodoc
mixin _$DeliveryOrderItemDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'vehicleModel') String? get vehicleModel;@JsonKey(name: 'color') String? get color;@JsonKey(name: 'quantity') int? get quantity;
/// Create a copy of DeliveryOrderItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryOrderItemDtoCopyWith<DeliveryOrderItemDto> get copyWith => _$DeliveryOrderItemDtoCopyWithImpl<DeliveryOrderItemDto>(this as DeliveryOrderItemDto, _$identity);

  /// Serializes this DeliveryOrderItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryOrderItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleModel, vehicleModel) || other.vehicleModel == vehicleModel)&&(identical(other.color, color) || other.color == color)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleModel,color,quantity);

@override
String toString() {
  return 'DeliveryOrderItemDto(id: $id, vehicleModel: $vehicleModel, color: $color, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $DeliveryOrderItemDtoCopyWith<$Res>  {
  factory $DeliveryOrderItemDtoCopyWith(DeliveryOrderItemDto value, $Res Function(DeliveryOrderItemDto) _then) = _$DeliveryOrderItemDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'vehicleModel') String? vehicleModel,@JsonKey(name: 'color') String? color,@JsonKey(name: 'quantity') int? quantity
});




}
/// @nodoc
class _$DeliveryOrderItemDtoCopyWithImpl<$Res>
    implements $DeliveryOrderItemDtoCopyWith<$Res> {
  _$DeliveryOrderItemDtoCopyWithImpl(this._self, this._then);

  final DeliveryOrderItemDto _self;
  final $Res Function(DeliveryOrderItemDto) _then;

/// Create a copy of DeliveryOrderItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? vehicleModel = freezed,Object? color = freezed,Object? quantity = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,vehicleModel: freezed == vehicleModel ? _self.vehicleModel : vehicleModel // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryOrderItemDto].
extension DeliveryOrderItemDtoPatterns on DeliveryOrderItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryOrderItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryOrderItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryOrderItemDto value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryOrderItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryOrderItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryOrderItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'vehicleModel')  String? vehicleModel, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'quantity')  int? quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryOrderItemDto() when $default != null:
return $default(_that.id,_that.vehicleModel,_that.color,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'vehicleModel')  String? vehicleModel, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'quantity')  int? quantity)  $default,) {final _that = this;
switch (_that) {
case _DeliveryOrderItemDto():
return $default(_that.id,_that.vehicleModel,_that.color,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'vehicleModel')  String? vehicleModel, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'quantity')  int? quantity)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryOrderItemDto() when $default != null:
return $default(_that.id,_that.vehicleModel,_that.color,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryOrderItemDto implements DeliveryOrderItemDto {
  const _DeliveryOrderItemDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'vehicleModel') this.vehicleModel, @JsonKey(name: 'color') this.color, @JsonKey(name: 'quantity') this.quantity});
  factory _DeliveryOrderItemDto.fromJson(Map<String, dynamic> json) => _$DeliveryOrderItemDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'vehicleModel') final  String? vehicleModel;
@override@JsonKey(name: 'color') final  String? color;
@override@JsonKey(name: 'quantity') final  int? quantity;

/// Create a copy of DeliveryOrderItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryOrderItemDtoCopyWith<_DeliveryOrderItemDto> get copyWith => __$DeliveryOrderItemDtoCopyWithImpl<_DeliveryOrderItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryOrderItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryOrderItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleModel, vehicleModel) || other.vehicleModel == vehicleModel)&&(identical(other.color, color) || other.color == color)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleModel,color,quantity);

@override
String toString() {
  return 'DeliveryOrderItemDto(id: $id, vehicleModel: $vehicleModel, color: $color, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$DeliveryOrderItemDtoCopyWith<$Res> implements $DeliveryOrderItemDtoCopyWith<$Res> {
  factory _$DeliveryOrderItemDtoCopyWith(_DeliveryOrderItemDto value, $Res Function(_DeliveryOrderItemDto) _then) = __$DeliveryOrderItemDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'vehicleModel') String? vehicleModel,@JsonKey(name: 'color') String? color,@JsonKey(name: 'quantity') int? quantity
});




}
/// @nodoc
class __$DeliveryOrderItemDtoCopyWithImpl<$Res>
    implements _$DeliveryOrderItemDtoCopyWith<$Res> {
  __$DeliveryOrderItemDtoCopyWithImpl(this._self, this._then);

  final _DeliveryOrderItemDto _self;
  final $Res Function(_DeliveryOrderItemDto) _then;

/// Create a copy of DeliveryOrderItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? vehicleModel = freezed,Object? color = freezed,Object? quantity = freezed,}) {
  return _then(_DeliveryOrderItemDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,vehicleModel: freezed == vehicleModel ? _self.vehicleModel : vehicleModel // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$DeliveryOrderVehicleDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'serialNumber') String? get serialNumber;@JsonKey(name: 'model') String? get model;@JsonKey(name: 'color') String? get color;@JsonKey(name: 'materialCode') String? get materialCode;@JsonKey(name: 'manufacturingDate') String? get manufacturingDate;@JsonKey(name: 'status') int? get status;@JsonKey(name: 'statusLabel') String? get statusLabel;@JsonKey(name: 'warehouseImportedAt') String? get warehouseImportedAt;@JsonKey(name: 'exportedAt') String? get exportedAt;@JsonKey(name: 'storageDays') int? get storageDays;@JsonKey(name: 'qcDefectDescription') String? get qcDefectDescription;
/// Create a copy of DeliveryOrderVehicleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryOrderVehicleDtoCopyWith<DeliveryOrderVehicleDto> get copyWith => _$DeliveryOrderVehicleDtoCopyWithImpl<DeliveryOrderVehicleDto>(this as DeliveryOrderVehicleDto, _$identity);

  /// Serializes this DeliveryOrderVehicleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryOrderVehicleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.model, model) || other.model == model)&&(identical(other.color, color) || other.color == color)&&(identical(other.materialCode, materialCode) || other.materialCode == materialCode)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.warehouseImportedAt, warehouseImportedAt) || other.warehouseImportedAt == warehouseImportedAt)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&(identical(other.storageDays, storageDays) || other.storageDays == storageDays)&&(identical(other.qcDefectDescription, qcDefectDescription) || other.qcDefectDescription == qcDefectDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serialNumber,model,color,materialCode,manufacturingDate,status,statusLabel,warehouseImportedAt,exportedAt,storageDays,qcDefectDescription);

@override
String toString() {
  return 'DeliveryOrderVehicleDto(id: $id, serialNumber: $serialNumber, model: $model, color: $color, materialCode: $materialCode, manufacturingDate: $manufacturingDate, status: $status, statusLabel: $statusLabel, warehouseImportedAt: $warehouseImportedAt, exportedAt: $exportedAt, storageDays: $storageDays, qcDefectDescription: $qcDefectDescription)';
}


}

/// @nodoc
abstract mixin class $DeliveryOrderVehicleDtoCopyWith<$Res>  {
  factory $DeliveryOrderVehicleDtoCopyWith(DeliveryOrderVehicleDto value, $Res Function(DeliveryOrderVehicleDto) _then) = _$DeliveryOrderVehicleDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'serialNumber') String? serialNumber,@JsonKey(name: 'model') String? model,@JsonKey(name: 'color') String? color,@JsonKey(name: 'materialCode') String? materialCode,@JsonKey(name: 'manufacturingDate') String? manufacturingDate,@JsonKey(name: 'status') int? status,@JsonKey(name: 'statusLabel') String? statusLabel,@JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,@JsonKey(name: 'exportedAt') String? exportedAt,@JsonKey(name: 'storageDays') int? storageDays,@JsonKey(name: 'qcDefectDescription') String? qcDefectDescription
});




}
/// @nodoc
class _$DeliveryOrderVehicleDtoCopyWithImpl<$Res>
    implements $DeliveryOrderVehicleDtoCopyWith<$Res> {
  _$DeliveryOrderVehicleDtoCopyWithImpl(this._self, this._then);

  final DeliveryOrderVehicleDto _self;
  final $Res Function(DeliveryOrderVehicleDto) _then;

/// Create a copy of DeliveryOrderVehicleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? serialNumber = freezed,Object? model = freezed,Object? color = freezed,Object? materialCode = freezed,Object? manufacturingDate = freezed,Object? status = freezed,Object? statusLabel = freezed,Object? warehouseImportedAt = freezed,Object? exportedAt = freezed,Object? storageDays = freezed,Object? qcDefectDescription = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,materialCode: freezed == materialCode ? _self.materialCode : materialCode // ignore: cast_nullable_to_non_nullable
as String?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,warehouseImportedAt: freezed == warehouseImportedAt ? _self.warehouseImportedAt : warehouseImportedAt // ignore: cast_nullable_to_non_nullable
as String?,exportedAt: freezed == exportedAt ? _self.exportedAt : exportedAt // ignore: cast_nullable_to_non_nullable
as String?,storageDays: freezed == storageDays ? _self.storageDays : storageDays // ignore: cast_nullable_to_non_nullable
as int?,qcDefectDescription: freezed == qcDefectDescription ? _self.qcDefectDescription : qcDefectDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryOrderVehicleDto].
extension DeliveryOrderVehicleDtoPatterns on DeliveryOrderVehicleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryOrderVehicleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryOrderVehicleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryOrderVehicleDto value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryOrderVehicleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryOrderVehicleDto value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryOrderVehicleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'manufacturingDate')  String? manufacturingDate, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'storageDays')  int? storageDays, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryOrderVehicleDto() when $default != null:
return $default(_that.id,_that.serialNumber,_that.model,_that.color,_that.materialCode,_that.manufacturingDate,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.exportedAt,_that.storageDays,_that.qcDefectDescription);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'manufacturingDate')  String? manufacturingDate, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'storageDays')  int? storageDays, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription)  $default,) {final _that = this;
switch (_that) {
case _DeliveryOrderVehicleDto():
return $default(_that.id,_that.serialNumber,_that.model,_that.color,_that.materialCode,_that.manufacturingDate,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.exportedAt,_that.storageDays,_that.qcDefectDescription);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'serialNumber')  String? serialNumber, @JsonKey(name: 'model')  String? model, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'materialCode')  String? materialCode, @JsonKey(name: 'manufacturingDate')  String? manufacturingDate, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'statusLabel')  String? statusLabel, @JsonKey(name: 'warehouseImportedAt')  String? warehouseImportedAt, @JsonKey(name: 'exportedAt')  String? exportedAt, @JsonKey(name: 'storageDays')  int? storageDays, @JsonKey(name: 'qcDefectDescription')  String? qcDefectDescription)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryOrderVehicleDto() when $default != null:
return $default(_that.id,_that.serialNumber,_that.model,_that.color,_that.materialCode,_that.manufacturingDate,_that.status,_that.statusLabel,_that.warehouseImportedAt,_that.exportedAt,_that.storageDays,_that.qcDefectDescription);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryOrderVehicleDto implements DeliveryOrderVehicleDto {
  const _DeliveryOrderVehicleDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'serialNumber') this.serialNumber, @JsonKey(name: 'model') this.model, @JsonKey(name: 'color') this.color, @JsonKey(name: 'materialCode') this.materialCode, @JsonKey(name: 'manufacturingDate') this.manufacturingDate, @JsonKey(name: 'status') this.status, @JsonKey(name: 'statusLabel') this.statusLabel, @JsonKey(name: 'warehouseImportedAt') this.warehouseImportedAt, @JsonKey(name: 'exportedAt') this.exportedAt, @JsonKey(name: 'storageDays') this.storageDays, @JsonKey(name: 'qcDefectDescription') this.qcDefectDescription});
  factory _DeliveryOrderVehicleDto.fromJson(Map<String, dynamic> json) => _$DeliveryOrderVehicleDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'serialNumber') final  String? serialNumber;
@override@JsonKey(name: 'model') final  String? model;
@override@JsonKey(name: 'color') final  String? color;
@override@JsonKey(name: 'materialCode') final  String? materialCode;
@override@JsonKey(name: 'manufacturingDate') final  String? manufacturingDate;
@override@JsonKey(name: 'status') final  int? status;
@override@JsonKey(name: 'statusLabel') final  String? statusLabel;
@override@JsonKey(name: 'warehouseImportedAt') final  String? warehouseImportedAt;
@override@JsonKey(name: 'exportedAt') final  String? exportedAt;
@override@JsonKey(name: 'storageDays') final  int? storageDays;
@override@JsonKey(name: 'qcDefectDescription') final  String? qcDefectDescription;

/// Create a copy of DeliveryOrderVehicleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryOrderVehicleDtoCopyWith<_DeliveryOrderVehicleDto> get copyWith => __$DeliveryOrderVehicleDtoCopyWithImpl<_DeliveryOrderVehicleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryOrderVehicleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryOrderVehicleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.model, model) || other.model == model)&&(identical(other.color, color) || other.color == color)&&(identical(other.materialCode, materialCode) || other.materialCode == materialCode)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.warehouseImportedAt, warehouseImportedAt) || other.warehouseImportedAt == warehouseImportedAt)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&(identical(other.storageDays, storageDays) || other.storageDays == storageDays)&&(identical(other.qcDefectDescription, qcDefectDescription) || other.qcDefectDescription == qcDefectDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serialNumber,model,color,materialCode,manufacturingDate,status,statusLabel,warehouseImportedAt,exportedAt,storageDays,qcDefectDescription);

@override
String toString() {
  return 'DeliveryOrderVehicleDto(id: $id, serialNumber: $serialNumber, model: $model, color: $color, materialCode: $materialCode, manufacturingDate: $manufacturingDate, status: $status, statusLabel: $statusLabel, warehouseImportedAt: $warehouseImportedAt, exportedAt: $exportedAt, storageDays: $storageDays, qcDefectDescription: $qcDefectDescription)';
}


}

/// @nodoc
abstract mixin class _$DeliveryOrderVehicleDtoCopyWith<$Res> implements $DeliveryOrderVehicleDtoCopyWith<$Res> {
  factory _$DeliveryOrderVehicleDtoCopyWith(_DeliveryOrderVehicleDto value, $Res Function(_DeliveryOrderVehicleDto) _then) = __$DeliveryOrderVehicleDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'serialNumber') String? serialNumber,@JsonKey(name: 'model') String? model,@JsonKey(name: 'color') String? color,@JsonKey(name: 'materialCode') String? materialCode,@JsonKey(name: 'manufacturingDate') String? manufacturingDate,@JsonKey(name: 'status') int? status,@JsonKey(name: 'statusLabel') String? statusLabel,@JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,@JsonKey(name: 'exportedAt') String? exportedAt,@JsonKey(name: 'storageDays') int? storageDays,@JsonKey(name: 'qcDefectDescription') String? qcDefectDescription
});




}
/// @nodoc
class __$DeliveryOrderVehicleDtoCopyWithImpl<$Res>
    implements _$DeliveryOrderVehicleDtoCopyWith<$Res> {
  __$DeliveryOrderVehicleDtoCopyWithImpl(this._self, this._then);

  final _DeliveryOrderVehicleDto _self;
  final $Res Function(_DeliveryOrderVehicleDto) _then;

/// Create a copy of DeliveryOrderVehicleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? serialNumber = freezed,Object? model = freezed,Object? color = freezed,Object? materialCode = freezed,Object? manufacturingDate = freezed,Object? status = freezed,Object? statusLabel = freezed,Object? warehouseImportedAt = freezed,Object? exportedAt = freezed,Object? storageDays = freezed,Object? qcDefectDescription = freezed,}) {
  return _then(_DeliveryOrderVehicleDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,materialCode: freezed == materialCode ? _self.materialCode : materialCode // ignore: cast_nullable_to_non_nullable
as String?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,warehouseImportedAt: freezed == warehouseImportedAt ? _self.warehouseImportedAt : warehouseImportedAt // ignore: cast_nullable_to_non_nullable
as String?,exportedAt: freezed == exportedAt ? _self.exportedAt : exportedAt // ignore: cast_nullable_to_non_nullable
as String?,storageDays: freezed == storageDays ? _self.storageDays : storageDays // ignore: cast_nullable_to_non_nullable
as int?,qcDefectDescription: freezed == qcDefectDescription ? _self.qcDefectDescription : qcDefectDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AddVehicleToDeliveryOrderRequestDto {

@JsonKey(name: 'vehicleId') String get vehicleId;
/// Create a copy of AddVehicleToDeliveryOrderRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddVehicleToDeliveryOrderRequestDtoCopyWith<AddVehicleToDeliveryOrderRequestDto> get copyWith => _$AddVehicleToDeliveryOrderRequestDtoCopyWithImpl<AddVehicleToDeliveryOrderRequestDto>(this as AddVehicleToDeliveryOrderRequestDto, _$identity);

  /// Serializes this AddVehicleToDeliveryOrderRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddVehicleToDeliveryOrderRequestDto&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleId);

@override
String toString() {
  return 'AddVehicleToDeliveryOrderRequestDto(vehicleId: $vehicleId)';
}


}

/// @nodoc
abstract mixin class $AddVehicleToDeliveryOrderRequestDtoCopyWith<$Res>  {
  factory $AddVehicleToDeliveryOrderRequestDtoCopyWith(AddVehicleToDeliveryOrderRequestDto value, $Res Function(AddVehicleToDeliveryOrderRequestDto) _then) = _$AddVehicleToDeliveryOrderRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'vehicleId') String vehicleId
});




}
/// @nodoc
class _$AddVehicleToDeliveryOrderRequestDtoCopyWithImpl<$Res>
    implements $AddVehicleToDeliveryOrderRequestDtoCopyWith<$Res> {
  _$AddVehicleToDeliveryOrderRequestDtoCopyWithImpl(this._self, this._then);

  final AddVehicleToDeliveryOrderRequestDto _self;
  final $Res Function(AddVehicleToDeliveryOrderRequestDto) _then;

/// Create a copy of AddVehicleToDeliveryOrderRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicleId = null,}) {
  return _then(_self.copyWith(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddVehicleToDeliveryOrderRequestDto].
extension AddVehicleToDeliveryOrderRequestDtoPatterns on AddVehicleToDeliveryOrderRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddVehicleToDeliveryOrderRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddVehicleToDeliveryOrderRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddVehicleToDeliveryOrderRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _AddVehicleToDeliveryOrderRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddVehicleToDeliveryOrderRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _AddVehicleToDeliveryOrderRequestDto() when $default != null:
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
case _AddVehicleToDeliveryOrderRequestDto() when $default != null:
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
case _AddVehicleToDeliveryOrderRequestDto():
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
case _AddVehicleToDeliveryOrderRequestDto() when $default != null:
return $default(_that.vehicleId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddVehicleToDeliveryOrderRequestDto implements AddVehicleToDeliveryOrderRequestDto {
  const _AddVehicleToDeliveryOrderRequestDto({@JsonKey(name: 'vehicleId') required this.vehicleId});
  factory _AddVehicleToDeliveryOrderRequestDto.fromJson(Map<String, dynamic> json) => _$AddVehicleToDeliveryOrderRequestDtoFromJson(json);

@override@JsonKey(name: 'vehicleId') final  String vehicleId;

/// Create a copy of AddVehicleToDeliveryOrderRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddVehicleToDeliveryOrderRequestDtoCopyWith<_AddVehicleToDeliveryOrderRequestDto> get copyWith => __$AddVehicleToDeliveryOrderRequestDtoCopyWithImpl<_AddVehicleToDeliveryOrderRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddVehicleToDeliveryOrderRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddVehicleToDeliveryOrderRequestDto&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleId);

@override
String toString() {
  return 'AddVehicleToDeliveryOrderRequestDto(vehicleId: $vehicleId)';
}


}

/// @nodoc
abstract mixin class _$AddVehicleToDeliveryOrderRequestDtoCopyWith<$Res> implements $AddVehicleToDeliveryOrderRequestDtoCopyWith<$Res> {
  factory _$AddVehicleToDeliveryOrderRequestDtoCopyWith(_AddVehicleToDeliveryOrderRequestDto value, $Res Function(_AddVehicleToDeliveryOrderRequestDto) _then) = __$AddVehicleToDeliveryOrderRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'vehicleId') String vehicleId
});




}
/// @nodoc
class __$AddVehicleToDeliveryOrderRequestDtoCopyWithImpl<$Res>
    implements _$AddVehicleToDeliveryOrderRequestDtoCopyWith<$Res> {
  __$AddVehicleToDeliveryOrderRequestDtoCopyWithImpl(this._self, this._then);

  final _AddVehicleToDeliveryOrderRequestDto _self;
  final $Res Function(_AddVehicleToDeliveryOrderRequestDto) _then;

/// Create a copy of AddVehicleToDeliveryOrderRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicleId = null,}) {
  return _then(_AddVehicleToDeliveryOrderRequestDto(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
