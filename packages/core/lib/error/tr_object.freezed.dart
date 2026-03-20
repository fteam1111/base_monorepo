// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tr_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TRObject {

 String get message; Map<String, String> get arguments;
/// Create a copy of TRObject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TRObjectCopyWith<TRObject> get copyWith => _$TRObjectCopyWithImpl<TRObject>(this as TRObject, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TRObject&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.arguments, arguments));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(arguments));

@override
String toString() {
  return 'TRObject(message: $message, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class $TRObjectCopyWith<$Res>  {
  factory $TRObjectCopyWith(TRObject value, $Res Function(TRObject) _then) = _$TRObjectCopyWithImpl;
@useResult
$Res call({
 String message, Map<String, String> arguments
});




}
/// @nodoc
class _$TRObjectCopyWithImpl<$Res>
    implements $TRObjectCopyWith<$Res> {
  _$TRObjectCopyWithImpl(this._self, this._then);

  final TRObject _self;
  final $Res Function(TRObject) _then;

/// Create a copy of TRObject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? arguments = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TRObject].
extension TRObjectPatterns on TRObject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TRObject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TRObject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TRObject value)  $default,){
final _that = this;
switch (_that) {
case _TRObject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TRObject value)?  $default,){
final _that = this;
switch (_that) {
case _TRObject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  Map<String, String> arguments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TRObject() when $default != null:
return $default(_that.message,_that.arguments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  Map<String, String> arguments)  $default,) {final _that = this;
switch (_that) {
case _TRObject():
return $default(_that.message,_that.arguments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  Map<String, String> arguments)?  $default,) {final _that = this;
switch (_that) {
case _TRObject() when $default != null:
return $default(_that.message,_that.arguments);case _:
  return null;

}
}

}

/// @nodoc


class _TRObject extends TRObject {
  const _TRObject(this.message, {final  Map<String, String> arguments = const <String, String>{}}): _arguments = arguments,super._();
  

@override final  String message;
 final  Map<String, String> _arguments;
@override@JsonKey() Map<String, String> get arguments {
  if (_arguments is EqualUnmodifiableMapView) return _arguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_arguments);
}


/// Create a copy of TRObject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TRObjectCopyWith<_TRObject> get copyWith => __$TRObjectCopyWithImpl<_TRObject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TRObject&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._arguments, _arguments));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_arguments));

@override
String toString() {
  return 'TRObject(message: $message, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class _$TRObjectCopyWith<$Res> implements $TRObjectCopyWith<$Res> {
  factory _$TRObjectCopyWith(_TRObject value, $Res Function(_TRObject) _then) = __$TRObjectCopyWithImpl;
@override @useResult
$Res call({
 String message, Map<String, String> arguments
});




}
/// @nodoc
class __$TRObjectCopyWithImpl<$Res>
    implements _$TRObjectCopyWith<$Res> {
  __$TRObjectCopyWithImpl(this._self, this._then);

  final _TRObject _self;
  final $Res Function(_TRObject) _then;

/// Create a copy of TRObject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? arguments = null,}) {
  return _then(_TRObject(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self._arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
