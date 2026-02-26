// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModelDto {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'email') String get email;@JsonKey(name: 'fullName') String get fullName;@JsonKey(name: 'isActive') bool get isActive;@JsonKey(name: 'role') UserRoleModelDto get role;@JsonKey(name: 'factory') String? get factory;
/// Create a copy of UserModelDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelDtoCopyWith<UserModelDto> get copyWith => _$UserModelDtoCopyWithImpl<UserModelDto>(this as UserModelDto, _$identity);

  /// Serializes this UserModelDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModelDto&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.role, role) || other.role == role)&&(identical(other.factory, factory) || other.factory == factory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName,isActive,role,factory);

@override
String toString() {
  return 'UserModelDto(id: $id, email: $email, fullName: $fullName, isActive: $isActive, role: $role, factory: $factory)';
}


}

/// @nodoc
abstract mixin class $UserModelDtoCopyWith<$Res>  {
  factory $UserModelDtoCopyWith(UserModelDto value, $Res Function(UserModelDto) _then) = _$UserModelDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'email') String email,@JsonKey(name: 'fullName') String fullName,@JsonKey(name: 'isActive') bool isActive,@JsonKey(name: 'role') UserRoleModelDto role,@JsonKey(name: 'factory') String? factory
});


$UserRoleModelDtoCopyWith<$Res> get role;

}
/// @nodoc
class _$UserModelDtoCopyWithImpl<$Res>
    implements $UserModelDtoCopyWith<$Res> {
  _$UserModelDtoCopyWithImpl(this._self, this._then);

  final UserModelDto _self;
  final $Res Function(UserModelDto) _then;

/// Create a copy of UserModelDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? fullName = null,Object? isActive = null,Object? role = null,Object? factory = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRoleModelDto,factory: freezed == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of UserModelDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserRoleModelDtoCopyWith<$Res> get role {
  
  return $UserRoleModelDtoCopyWith<$Res>(_self.role, (value) {
    return _then(_self.copyWith(role: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserModelDto].
extension UserModelDtoPatterns on UserModelDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModelDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModelDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModelDto value)  $default,){
final _that = this;
switch (_that) {
case _UserModelDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModelDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserModelDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'email')  String email, @JsonKey(name: 'fullName')  String fullName, @JsonKey(name: 'isActive')  bool isActive, @JsonKey(name: 'role')  UserRoleModelDto role, @JsonKey(name: 'factory')  String? factory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModelDto() when $default != null:
return $default(_that.id,_that.email,_that.fullName,_that.isActive,_that.role,_that.factory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'email')  String email, @JsonKey(name: 'fullName')  String fullName, @JsonKey(name: 'isActive')  bool isActive, @JsonKey(name: 'role')  UserRoleModelDto role, @JsonKey(name: 'factory')  String? factory)  $default,) {final _that = this;
switch (_that) {
case _UserModelDto():
return $default(_that.id,_that.email,_that.fullName,_that.isActive,_that.role,_that.factory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'email')  String email, @JsonKey(name: 'fullName')  String fullName, @JsonKey(name: 'isActive')  bool isActive, @JsonKey(name: 'role')  UserRoleModelDto role, @JsonKey(name: 'factory')  String? factory)?  $default,) {final _that = this;
switch (_that) {
case _UserModelDto() when $default != null:
return $default(_that.id,_that.email,_that.fullName,_that.isActive,_that.role,_that.factory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModelDto implements UserModelDto {
  const _UserModelDto({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'email') required this.email, @JsonKey(name: 'fullName') required this.fullName, @JsonKey(name: 'isActive') required this.isActive, @JsonKey(name: 'role') required this.role, @JsonKey(name: 'factory') this.factory});
  factory _UserModelDto.fromJson(Map<String, dynamic> json) => _$UserModelDtoFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'email') final  String email;
@override@JsonKey(name: 'fullName') final  String fullName;
@override@JsonKey(name: 'isActive') final  bool isActive;
@override@JsonKey(name: 'role') final  UserRoleModelDto role;
@override@JsonKey(name: 'factory') final  String? factory;

/// Create a copy of UserModelDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelDtoCopyWith<_UserModelDto> get copyWith => __$UserModelDtoCopyWithImpl<_UserModelDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModelDto&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.role, role) || other.role == role)&&(identical(other.factory, factory) || other.factory == factory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName,isActive,role,factory);

@override
String toString() {
  return 'UserModelDto(id: $id, email: $email, fullName: $fullName, isActive: $isActive, role: $role, factory: $factory)';
}


}

/// @nodoc
abstract mixin class _$UserModelDtoCopyWith<$Res> implements $UserModelDtoCopyWith<$Res> {
  factory _$UserModelDtoCopyWith(_UserModelDto value, $Res Function(_UserModelDto) _then) = __$UserModelDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'email') String email,@JsonKey(name: 'fullName') String fullName,@JsonKey(name: 'isActive') bool isActive,@JsonKey(name: 'role') UserRoleModelDto role,@JsonKey(name: 'factory') String? factory
});


@override $UserRoleModelDtoCopyWith<$Res> get role;

}
/// @nodoc
class __$UserModelDtoCopyWithImpl<$Res>
    implements _$UserModelDtoCopyWith<$Res> {
  __$UserModelDtoCopyWithImpl(this._self, this._then);

  final _UserModelDto _self;
  final $Res Function(_UserModelDto) _then;

/// Create a copy of UserModelDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? fullName = null,Object? isActive = null,Object? role = null,Object? factory = freezed,}) {
  return _then(_UserModelDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRoleModelDto,factory: freezed == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of UserModelDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserRoleModelDtoCopyWith<$Res> get role {
  
  return $UserRoleModelDtoCopyWith<$Res>(_self.role, (value) {
    return _then(_self.copyWith(role: value));
  });
}
}

// dart format on
