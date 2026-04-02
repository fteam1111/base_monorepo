// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_export_area_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvailableExportAreaDto {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'address') String? get address;@JsonKey(name: 'capacity') int? get capacity;@JsonKey(name: 'currentCapacity') int? get currentCapacity;@JsonKey(name: 'availableCapacity') int? get availableCapacity;@JsonKey(name: 'factoryId') int? get factoryId;
/// Create a copy of AvailableExportAreaDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableExportAreaDtoCopyWith<AvailableExportAreaDto> get copyWith => _$AvailableExportAreaDtoCopyWithImpl<AvailableExportAreaDto>(this as AvailableExportAreaDto, _$identity);

  /// Serializes this AvailableExportAreaDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableExportAreaDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.currentCapacity, currentCapacity) || other.currentCapacity == currentCapacity)&&(identical(other.availableCapacity, availableCapacity) || other.availableCapacity == availableCapacity)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,capacity,currentCapacity,availableCapacity,factoryId);

@override
String toString() {
  return 'AvailableExportAreaDto(id: $id, name: $name, address: $address, capacity: $capacity, currentCapacity: $currentCapacity, availableCapacity: $availableCapacity, factoryId: $factoryId)';
}


}

/// @nodoc
abstract mixin class $AvailableExportAreaDtoCopyWith<$Res>  {
  factory $AvailableExportAreaDtoCopyWith(AvailableExportAreaDto value, $Res Function(AvailableExportAreaDto) _then) = _$AvailableExportAreaDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'address') String? address,@JsonKey(name: 'capacity') int? capacity,@JsonKey(name: 'currentCapacity') int? currentCapacity,@JsonKey(name: 'availableCapacity') int? availableCapacity,@JsonKey(name: 'factoryId') int? factoryId
});




}
/// @nodoc
class _$AvailableExportAreaDtoCopyWithImpl<$Res>
    implements $AvailableExportAreaDtoCopyWith<$Res> {
  _$AvailableExportAreaDtoCopyWithImpl(this._self, this._then);

  final AvailableExportAreaDto _self;
  final $Res Function(AvailableExportAreaDto) _then;

/// Create a copy of AvailableExportAreaDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? address = freezed,Object? capacity = freezed,Object? currentCapacity = freezed,Object? availableCapacity = freezed,Object? factoryId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,currentCapacity: freezed == currentCapacity ? _self.currentCapacity : currentCapacity // ignore: cast_nullable_to_non_nullable
as int?,availableCapacity: freezed == availableCapacity ? _self.availableCapacity : availableCapacity // ignore: cast_nullable_to_non_nullable
as int?,factoryId: freezed == factoryId ? _self.factoryId : factoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailableExportAreaDto].
extension AvailableExportAreaDtoPatterns on AvailableExportAreaDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailableExportAreaDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailableExportAreaDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailableExportAreaDto value)  $default,){
final _that = this;
switch (_that) {
case _AvailableExportAreaDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailableExportAreaDto value)?  $default,){
final _that = this;
switch (_that) {
case _AvailableExportAreaDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'capacity')  int? capacity, @JsonKey(name: 'currentCapacity')  int? currentCapacity, @JsonKey(name: 'availableCapacity')  int? availableCapacity, @JsonKey(name: 'factoryId')  int? factoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailableExportAreaDto() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.capacity,_that.currentCapacity,_that.availableCapacity,_that.factoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'capacity')  int? capacity, @JsonKey(name: 'currentCapacity')  int? currentCapacity, @JsonKey(name: 'availableCapacity')  int? availableCapacity, @JsonKey(name: 'factoryId')  int? factoryId)  $default,) {final _that = this;
switch (_that) {
case _AvailableExportAreaDto():
return $default(_that.id,_that.name,_that.address,_that.capacity,_that.currentCapacity,_that.availableCapacity,_that.factoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'capacity')  int? capacity, @JsonKey(name: 'currentCapacity')  int? currentCapacity, @JsonKey(name: 'availableCapacity')  int? availableCapacity, @JsonKey(name: 'factoryId')  int? factoryId)?  $default,) {final _that = this;
switch (_that) {
case _AvailableExportAreaDto() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.capacity,_that.currentCapacity,_that.availableCapacity,_that.factoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailableExportAreaDto implements AvailableExportAreaDto {
  const _AvailableExportAreaDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'address') this.address, @JsonKey(name: 'capacity') this.capacity, @JsonKey(name: 'currentCapacity') this.currentCapacity, @JsonKey(name: 'availableCapacity') this.availableCapacity, @JsonKey(name: 'factoryId') this.factoryId});
  factory _AvailableExportAreaDto.fromJson(Map<String, dynamic> json) => _$AvailableExportAreaDtoFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'address') final  String? address;
@override@JsonKey(name: 'capacity') final  int? capacity;
@override@JsonKey(name: 'currentCapacity') final  int? currentCapacity;
@override@JsonKey(name: 'availableCapacity') final  int? availableCapacity;
@override@JsonKey(name: 'factoryId') final  int? factoryId;

/// Create a copy of AvailableExportAreaDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailableExportAreaDtoCopyWith<_AvailableExportAreaDto> get copyWith => __$AvailableExportAreaDtoCopyWithImpl<_AvailableExportAreaDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailableExportAreaDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailableExportAreaDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.currentCapacity, currentCapacity) || other.currentCapacity == currentCapacity)&&(identical(other.availableCapacity, availableCapacity) || other.availableCapacity == availableCapacity)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,capacity,currentCapacity,availableCapacity,factoryId);

@override
String toString() {
  return 'AvailableExportAreaDto(id: $id, name: $name, address: $address, capacity: $capacity, currentCapacity: $currentCapacity, availableCapacity: $availableCapacity, factoryId: $factoryId)';
}


}

/// @nodoc
abstract mixin class _$AvailableExportAreaDtoCopyWith<$Res> implements $AvailableExportAreaDtoCopyWith<$Res> {
  factory _$AvailableExportAreaDtoCopyWith(_AvailableExportAreaDto value, $Res Function(_AvailableExportAreaDto) _then) = __$AvailableExportAreaDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'address') String? address,@JsonKey(name: 'capacity') int? capacity,@JsonKey(name: 'currentCapacity') int? currentCapacity,@JsonKey(name: 'availableCapacity') int? availableCapacity,@JsonKey(name: 'factoryId') int? factoryId
});




}
/// @nodoc
class __$AvailableExportAreaDtoCopyWithImpl<$Res>
    implements _$AvailableExportAreaDtoCopyWith<$Res> {
  __$AvailableExportAreaDtoCopyWithImpl(this._self, this._then);

  final _AvailableExportAreaDto _self;
  final $Res Function(_AvailableExportAreaDto) _then;

/// Create a copy of AvailableExportAreaDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? address = freezed,Object? capacity = freezed,Object? currentCapacity = freezed,Object? availableCapacity = freezed,Object? factoryId = freezed,}) {
  return _then(_AvailableExportAreaDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,currentCapacity: freezed == currentCapacity ? _self.currentCapacity : currentCapacity // ignore: cast_nullable_to_non_nullable
as int?,availableCapacity: freezed == availableCapacity ? _self.availableCapacity : availableCapacity // ignore: cast_nullable_to_non_nullable
as int?,factoryId: freezed == factoryId ? _self.factoryId : factoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
