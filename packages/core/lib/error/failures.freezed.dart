// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ValueFailure<T> {

 T get failedValue;
/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValueFailureCopyWith<T, ValueFailure<T>> get copyWith => _$ValueFailureCopyWithImpl<T, ValueFailure<T>>(this as ValueFailure<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValueFailure<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $ValueFailureCopyWith<T,$Res>  {
  factory $ValueFailureCopyWith(ValueFailure<T> value, $Res Function(ValueFailure<T>) _then) = _$ValueFailureCopyWithImpl;
@useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$ValueFailureCopyWithImpl<T,$Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._self, this._then);

  final ValueFailure<T> _self;
  final $Res Function(ValueFailure<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? failedValue = freezed,}) {
  return _then(_self.copyWith(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}

}


/// Adds pattern-matching-related methods to [ValueFailure].
extension ValueFailurePatterns<T> on ValueFailure<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExceedingLength<T> value)?  exceedingLength,TResult Function( SubceedLength<T> value)?  subceedLength,TResult Function( Empty<T> value)?  empty,TResult Function( Multiline<T> value)?  multiline,TResult Function( InvalidEmail<T> value)?  invalidEmail,TResult Function( NotVinGroupEmail<T> value)?  notVinGroupEmail,TResult Function( ShortPassword<T> value)?  passwordNotMatchRequirements,TResult Function( InvalidJWT<T> value)?  invalidJWT,TResult Function( InvalidJWTPayload<T> value)?  invalidJWTPayload,TResult Function( OneUpperCase<T> value)?  mustOneUpperCaseCharacter,TResult Function( OneLowerCase<T> value)?  mustOneLowerCaseCharacter,TResult Function( OneNumeric<T> value)?  mustOneNumericCharacter,TResult Function( OneSpecial<T> value)?  mustOneSpecialCharacter,TResult Function( NotContainUserName<T> value)?  containsForbiddenSubstring,TResult Function( NotMatchOldPassword<T> value)?  mustNotMatchOldPassword,TResult Function( MatchNewPassword<T> value)?  mustMatchNewPassword,TResult Function( _isEmpty<T> value)?  isEmpty,TResult Function( _numberMustBiggerThanZero<T> value)?  numberMustBiggerThanZero,TResult Function( validateExceedsMaxValue<T> value)?  exceedingMaxValue,TResult Function( InvalidDateValue<T> value)?  invalidDateValue,TResult Function( InvalidDoubleValue<T> value)?  invalidDoubleValue,TResult Function( InvalidIntegerValue<T> value)?  invalidIntegerValue,TResult Function( InvalidVin<T> value)?  invalidVin,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExceedingLength() when exceedingLength != null:
return exceedingLength(_that);case SubceedLength() when subceedLength != null:
return subceedLength(_that);case Empty() when empty != null:
return empty(_that);case Multiline() when multiline != null:
return multiline(_that);case InvalidEmail() when invalidEmail != null:
return invalidEmail(_that);case NotVinGroupEmail() when notVinGroupEmail != null:
return notVinGroupEmail(_that);case ShortPassword() when passwordNotMatchRequirements != null:
return passwordNotMatchRequirements(_that);case InvalidJWT() when invalidJWT != null:
return invalidJWT(_that);case InvalidJWTPayload() when invalidJWTPayload != null:
return invalidJWTPayload(_that);case OneUpperCase() when mustOneUpperCaseCharacter != null:
return mustOneUpperCaseCharacter(_that);case OneLowerCase() when mustOneLowerCaseCharacter != null:
return mustOneLowerCaseCharacter(_that);case OneNumeric() when mustOneNumericCharacter != null:
return mustOneNumericCharacter(_that);case OneSpecial() when mustOneSpecialCharacter != null:
return mustOneSpecialCharacter(_that);case NotContainUserName() when containsForbiddenSubstring != null:
return containsForbiddenSubstring(_that);case NotMatchOldPassword() when mustNotMatchOldPassword != null:
return mustNotMatchOldPassword(_that);case MatchNewPassword() when mustMatchNewPassword != null:
return mustMatchNewPassword(_that);case _isEmpty() when isEmpty != null:
return isEmpty(_that);case _numberMustBiggerThanZero() when numberMustBiggerThanZero != null:
return numberMustBiggerThanZero(_that);case validateExceedsMaxValue() when exceedingMaxValue != null:
return exceedingMaxValue(_that);case InvalidDateValue() when invalidDateValue != null:
return invalidDateValue(_that);case InvalidDoubleValue() when invalidDoubleValue != null:
return invalidDoubleValue(_that);case InvalidIntegerValue() when invalidIntegerValue != null:
return invalidIntegerValue(_that);case InvalidVin() when invalidVin != null:
return invalidVin(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExceedingLength<T> value)  exceedingLength,required TResult Function( SubceedLength<T> value)  subceedLength,required TResult Function( Empty<T> value)  empty,required TResult Function( Multiline<T> value)  multiline,required TResult Function( InvalidEmail<T> value)  invalidEmail,required TResult Function( NotVinGroupEmail<T> value)  notVinGroupEmail,required TResult Function( ShortPassword<T> value)  passwordNotMatchRequirements,required TResult Function( InvalidJWT<T> value)  invalidJWT,required TResult Function( InvalidJWTPayload<T> value)  invalidJWTPayload,required TResult Function( OneUpperCase<T> value)  mustOneUpperCaseCharacter,required TResult Function( OneLowerCase<T> value)  mustOneLowerCaseCharacter,required TResult Function( OneNumeric<T> value)  mustOneNumericCharacter,required TResult Function( OneSpecial<T> value)  mustOneSpecialCharacter,required TResult Function( NotContainUserName<T> value)  containsForbiddenSubstring,required TResult Function( NotMatchOldPassword<T> value)  mustNotMatchOldPassword,required TResult Function( MatchNewPassword<T> value)  mustMatchNewPassword,required TResult Function( _isEmpty<T> value)  isEmpty,required TResult Function( _numberMustBiggerThanZero<T> value)  numberMustBiggerThanZero,required TResult Function( validateExceedsMaxValue<T> value)  exceedingMaxValue,required TResult Function( InvalidDateValue<T> value)  invalidDateValue,required TResult Function( InvalidDoubleValue<T> value)  invalidDoubleValue,required TResult Function( InvalidIntegerValue<T> value)  invalidIntegerValue,required TResult Function( InvalidVin<T> value)  invalidVin,}){
final _that = this;
switch (_that) {
case ExceedingLength():
return exceedingLength(_that);case SubceedLength():
return subceedLength(_that);case Empty():
return empty(_that);case Multiline():
return multiline(_that);case InvalidEmail():
return invalidEmail(_that);case NotVinGroupEmail():
return notVinGroupEmail(_that);case ShortPassword():
return passwordNotMatchRequirements(_that);case InvalidJWT():
return invalidJWT(_that);case InvalidJWTPayload():
return invalidJWTPayload(_that);case OneUpperCase():
return mustOneUpperCaseCharacter(_that);case OneLowerCase():
return mustOneLowerCaseCharacter(_that);case OneNumeric():
return mustOneNumericCharacter(_that);case OneSpecial():
return mustOneSpecialCharacter(_that);case NotContainUserName():
return containsForbiddenSubstring(_that);case NotMatchOldPassword():
return mustNotMatchOldPassword(_that);case MatchNewPassword():
return mustMatchNewPassword(_that);case _isEmpty():
return isEmpty(_that);case _numberMustBiggerThanZero():
return numberMustBiggerThanZero(_that);case validateExceedsMaxValue():
return exceedingMaxValue(_that);case InvalidDateValue():
return invalidDateValue(_that);case InvalidDoubleValue():
return invalidDoubleValue(_that);case InvalidIntegerValue():
return invalidIntegerValue(_that);case InvalidVin():
return invalidVin(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExceedingLength<T> value)?  exceedingLength,TResult? Function( SubceedLength<T> value)?  subceedLength,TResult? Function( Empty<T> value)?  empty,TResult? Function( Multiline<T> value)?  multiline,TResult? Function( InvalidEmail<T> value)?  invalidEmail,TResult? Function( NotVinGroupEmail<T> value)?  notVinGroupEmail,TResult? Function( ShortPassword<T> value)?  passwordNotMatchRequirements,TResult? Function( InvalidJWT<T> value)?  invalidJWT,TResult? Function( InvalidJWTPayload<T> value)?  invalidJWTPayload,TResult? Function( OneUpperCase<T> value)?  mustOneUpperCaseCharacter,TResult? Function( OneLowerCase<T> value)?  mustOneLowerCaseCharacter,TResult? Function( OneNumeric<T> value)?  mustOneNumericCharacter,TResult? Function( OneSpecial<T> value)?  mustOneSpecialCharacter,TResult? Function( NotContainUserName<T> value)?  containsForbiddenSubstring,TResult? Function( NotMatchOldPassword<T> value)?  mustNotMatchOldPassword,TResult? Function( MatchNewPassword<T> value)?  mustMatchNewPassword,TResult? Function( _isEmpty<T> value)?  isEmpty,TResult? Function( _numberMustBiggerThanZero<T> value)?  numberMustBiggerThanZero,TResult? Function( validateExceedsMaxValue<T> value)?  exceedingMaxValue,TResult? Function( InvalidDateValue<T> value)?  invalidDateValue,TResult? Function( InvalidDoubleValue<T> value)?  invalidDoubleValue,TResult? Function( InvalidIntegerValue<T> value)?  invalidIntegerValue,TResult? Function( InvalidVin<T> value)?  invalidVin,}){
final _that = this;
switch (_that) {
case ExceedingLength() when exceedingLength != null:
return exceedingLength(_that);case SubceedLength() when subceedLength != null:
return subceedLength(_that);case Empty() when empty != null:
return empty(_that);case Multiline() when multiline != null:
return multiline(_that);case InvalidEmail() when invalidEmail != null:
return invalidEmail(_that);case NotVinGroupEmail() when notVinGroupEmail != null:
return notVinGroupEmail(_that);case ShortPassword() when passwordNotMatchRequirements != null:
return passwordNotMatchRequirements(_that);case InvalidJWT() when invalidJWT != null:
return invalidJWT(_that);case InvalidJWTPayload() when invalidJWTPayload != null:
return invalidJWTPayload(_that);case OneUpperCase() when mustOneUpperCaseCharacter != null:
return mustOneUpperCaseCharacter(_that);case OneLowerCase() when mustOneLowerCaseCharacter != null:
return mustOneLowerCaseCharacter(_that);case OneNumeric() when mustOneNumericCharacter != null:
return mustOneNumericCharacter(_that);case OneSpecial() when mustOneSpecialCharacter != null:
return mustOneSpecialCharacter(_that);case NotContainUserName() when containsForbiddenSubstring != null:
return containsForbiddenSubstring(_that);case NotMatchOldPassword() when mustNotMatchOldPassword != null:
return mustNotMatchOldPassword(_that);case MatchNewPassword() when mustMatchNewPassword != null:
return mustMatchNewPassword(_that);case _isEmpty() when isEmpty != null:
return isEmpty(_that);case _numberMustBiggerThanZero() when numberMustBiggerThanZero != null:
return numberMustBiggerThanZero(_that);case validateExceedsMaxValue() when exceedingMaxValue != null:
return exceedingMaxValue(_that);case InvalidDateValue() when invalidDateValue != null:
return invalidDateValue(_that);case InvalidDoubleValue() when invalidDoubleValue != null:
return invalidDoubleValue(_that);case InvalidIntegerValue() when invalidIntegerValue != null:
return invalidIntegerValue(_that);case InvalidVin() when invalidVin != null:
return invalidVin(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T failedValue,  int max)?  exceedingLength,TResult Function( T failedValue,  int min)?  subceedLength,TResult Function( T failedValue)?  empty,TResult Function( T failedValue)?  multiline,TResult Function( T failedValue)?  invalidEmail,TResult Function( T failedValue)?  notVinGroupEmail,TResult Function( T failedValue)?  passwordNotMatchRequirements,TResult Function( T failedValue)?  invalidJWT,TResult Function( T failedValue)?  invalidJWTPayload,TResult Function( T failedValue)?  mustOneUpperCaseCharacter,TResult Function( T failedValue)?  mustOneLowerCaseCharacter,TResult Function( T failedValue)?  mustOneNumericCharacter,TResult Function( T failedValue)?  mustOneSpecialCharacter,TResult Function( T failedValue)?  containsForbiddenSubstring,TResult Function( T failedValue)?  mustNotMatchOldPassword,TResult Function( T failedValue)?  mustMatchNewPassword,TResult Function( T failedValue)?  isEmpty,TResult Function( T failedValue)?  numberMustBiggerThanZero,TResult Function( T failedValue)?  exceedingMaxValue,TResult Function( T failedValue)?  invalidDateValue,TResult Function( T failedValue)?  invalidDoubleValue,TResult Function( T failedValue)?  invalidIntegerValue,TResult Function( T failedValue)?  invalidVin,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExceedingLength() when exceedingLength != null:
return exceedingLength(_that.failedValue,_that.max);case SubceedLength() when subceedLength != null:
return subceedLength(_that.failedValue,_that.min);case Empty() when empty != null:
return empty(_that.failedValue);case Multiline() when multiline != null:
return multiline(_that.failedValue);case InvalidEmail() when invalidEmail != null:
return invalidEmail(_that.failedValue);case NotVinGroupEmail() when notVinGroupEmail != null:
return notVinGroupEmail(_that.failedValue);case ShortPassword() when passwordNotMatchRequirements != null:
return passwordNotMatchRequirements(_that.failedValue);case InvalidJWT() when invalidJWT != null:
return invalidJWT(_that.failedValue);case InvalidJWTPayload() when invalidJWTPayload != null:
return invalidJWTPayload(_that.failedValue);case OneUpperCase() when mustOneUpperCaseCharacter != null:
return mustOneUpperCaseCharacter(_that.failedValue);case OneLowerCase() when mustOneLowerCaseCharacter != null:
return mustOneLowerCaseCharacter(_that.failedValue);case OneNumeric() when mustOneNumericCharacter != null:
return mustOneNumericCharacter(_that.failedValue);case OneSpecial() when mustOneSpecialCharacter != null:
return mustOneSpecialCharacter(_that.failedValue);case NotContainUserName() when containsForbiddenSubstring != null:
return containsForbiddenSubstring(_that.failedValue);case NotMatchOldPassword() when mustNotMatchOldPassword != null:
return mustNotMatchOldPassword(_that.failedValue);case MatchNewPassword() when mustMatchNewPassword != null:
return mustMatchNewPassword(_that.failedValue);case _isEmpty() when isEmpty != null:
return isEmpty(_that.failedValue);case _numberMustBiggerThanZero() when numberMustBiggerThanZero != null:
return numberMustBiggerThanZero(_that.failedValue);case validateExceedsMaxValue() when exceedingMaxValue != null:
return exceedingMaxValue(_that.failedValue);case InvalidDateValue() when invalidDateValue != null:
return invalidDateValue(_that.failedValue);case InvalidDoubleValue() when invalidDoubleValue != null:
return invalidDoubleValue(_that.failedValue);case InvalidIntegerValue() when invalidIntegerValue != null:
return invalidIntegerValue(_that.failedValue);case InvalidVin() when invalidVin != null:
return invalidVin(_that.failedValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T failedValue,  int max)  exceedingLength,required TResult Function( T failedValue,  int min)  subceedLength,required TResult Function( T failedValue)  empty,required TResult Function( T failedValue)  multiline,required TResult Function( T failedValue)  invalidEmail,required TResult Function( T failedValue)  notVinGroupEmail,required TResult Function( T failedValue)  passwordNotMatchRequirements,required TResult Function( T failedValue)  invalidJWT,required TResult Function( T failedValue)  invalidJWTPayload,required TResult Function( T failedValue)  mustOneUpperCaseCharacter,required TResult Function( T failedValue)  mustOneLowerCaseCharacter,required TResult Function( T failedValue)  mustOneNumericCharacter,required TResult Function( T failedValue)  mustOneSpecialCharacter,required TResult Function( T failedValue)  containsForbiddenSubstring,required TResult Function( T failedValue)  mustNotMatchOldPassword,required TResult Function( T failedValue)  mustMatchNewPassword,required TResult Function( T failedValue)  isEmpty,required TResult Function( T failedValue)  numberMustBiggerThanZero,required TResult Function( T failedValue)  exceedingMaxValue,required TResult Function( T failedValue)  invalidDateValue,required TResult Function( T failedValue)  invalidDoubleValue,required TResult Function( T failedValue)  invalidIntegerValue,required TResult Function( T failedValue)  invalidVin,}) {final _that = this;
switch (_that) {
case ExceedingLength():
return exceedingLength(_that.failedValue,_that.max);case SubceedLength():
return subceedLength(_that.failedValue,_that.min);case Empty():
return empty(_that.failedValue);case Multiline():
return multiline(_that.failedValue);case InvalidEmail():
return invalidEmail(_that.failedValue);case NotVinGroupEmail():
return notVinGroupEmail(_that.failedValue);case ShortPassword():
return passwordNotMatchRequirements(_that.failedValue);case InvalidJWT():
return invalidJWT(_that.failedValue);case InvalidJWTPayload():
return invalidJWTPayload(_that.failedValue);case OneUpperCase():
return mustOneUpperCaseCharacter(_that.failedValue);case OneLowerCase():
return mustOneLowerCaseCharacter(_that.failedValue);case OneNumeric():
return mustOneNumericCharacter(_that.failedValue);case OneSpecial():
return mustOneSpecialCharacter(_that.failedValue);case NotContainUserName():
return containsForbiddenSubstring(_that.failedValue);case NotMatchOldPassword():
return mustNotMatchOldPassword(_that.failedValue);case MatchNewPassword():
return mustMatchNewPassword(_that.failedValue);case _isEmpty():
return isEmpty(_that.failedValue);case _numberMustBiggerThanZero():
return numberMustBiggerThanZero(_that.failedValue);case validateExceedsMaxValue():
return exceedingMaxValue(_that.failedValue);case InvalidDateValue():
return invalidDateValue(_that.failedValue);case InvalidDoubleValue():
return invalidDoubleValue(_that.failedValue);case InvalidIntegerValue():
return invalidIntegerValue(_that.failedValue);case InvalidVin():
return invalidVin(_that.failedValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T failedValue,  int max)?  exceedingLength,TResult? Function( T failedValue,  int min)?  subceedLength,TResult? Function( T failedValue)?  empty,TResult? Function( T failedValue)?  multiline,TResult? Function( T failedValue)?  invalidEmail,TResult? Function( T failedValue)?  notVinGroupEmail,TResult? Function( T failedValue)?  passwordNotMatchRequirements,TResult? Function( T failedValue)?  invalidJWT,TResult? Function( T failedValue)?  invalidJWTPayload,TResult? Function( T failedValue)?  mustOneUpperCaseCharacter,TResult? Function( T failedValue)?  mustOneLowerCaseCharacter,TResult? Function( T failedValue)?  mustOneNumericCharacter,TResult? Function( T failedValue)?  mustOneSpecialCharacter,TResult? Function( T failedValue)?  containsForbiddenSubstring,TResult? Function( T failedValue)?  mustNotMatchOldPassword,TResult? Function( T failedValue)?  mustMatchNewPassword,TResult? Function( T failedValue)?  isEmpty,TResult? Function( T failedValue)?  numberMustBiggerThanZero,TResult? Function( T failedValue)?  exceedingMaxValue,TResult? Function( T failedValue)?  invalidDateValue,TResult? Function( T failedValue)?  invalidDoubleValue,TResult? Function( T failedValue)?  invalidIntegerValue,TResult? Function( T failedValue)?  invalidVin,}) {final _that = this;
switch (_that) {
case ExceedingLength() when exceedingLength != null:
return exceedingLength(_that.failedValue,_that.max);case SubceedLength() when subceedLength != null:
return subceedLength(_that.failedValue,_that.min);case Empty() when empty != null:
return empty(_that.failedValue);case Multiline() when multiline != null:
return multiline(_that.failedValue);case InvalidEmail() when invalidEmail != null:
return invalidEmail(_that.failedValue);case NotVinGroupEmail() when notVinGroupEmail != null:
return notVinGroupEmail(_that.failedValue);case ShortPassword() when passwordNotMatchRequirements != null:
return passwordNotMatchRequirements(_that.failedValue);case InvalidJWT() when invalidJWT != null:
return invalidJWT(_that.failedValue);case InvalidJWTPayload() when invalidJWTPayload != null:
return invalidJWTPayload(_that.failedValue);case OneUpperCase() when mustOneUpperCaseCharacter != null:
return mustOneUpperCaseCharacter(_that.failedValue);case OneLowerCase() when mustOneLowerCaseCharacter != null:
return mustOneLowerCaseCharacter(_that.failedValue);case OneNumeric() when mustOneNumericCharacter != null:
return mustOneNumericCharacter(_that.failedValue);case OneSpecial() when mustOneSpecialCharacter != null:
return mustOneSpecialCharacter(_that.failedValue);case NotContainUserName() when containsForbiddenSubstring != null:
return containsForbiddenSubstring(_that.failedValue);case NotMatchOldPassword() when mustNotMatchOldPassword != null:
return mustNotMatchOldPassword(_that.failedValue);case MatchNewPassword() when mustMatchNewPassword != null:
return mustMatchNewPassword(_that.failedValue);case _isEmpty() when isEmpty != null:
return isEmpty(_that.failedValue);case _numberMustBiggerThanZero() when numberMustBiggerThanZero != null:
return numberMustBiggerThanZero(_that.failedValue);case validateExceedsMaxValue() when exceedingMaxValue != null:
return exceedingMaxValue(_that.failedValue);case InvalidDateValue() when invalidDateValue != null:
return invalidDateValue(_that.failedValue);case InvalidDoubleValue() when invalidDoubleValue != null:
return invalidDoubleValue(_that.failedValue);case InvalidIntegerValue() when invalidIntegerValue != null:
return invalidIntegerValue(_that.failedValue);case InvalidVin() when invalidVin != null:
return invalidVin(_that.failedValue);case _:
  return null;

}
}

}

/// @nodoc


class ExceedingLength<T> implements ValueFailure<T> {
  const ExceedingLength({required this.failedValue, required this.max});
  

@override final  T failedValue;
 final  int max;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExceedingLengthCopyWith<T, ExceedingLength<T>> get copyWith => _$ExceedingLengthCopyWithImpl<T, ExceedingLength<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExceedingLength<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue)&&(identical(other.max, max) || other.max == max));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue),max);

@override
String toString() {
  return 'ValueFailure<$T>.exceedingLength(failedValue: $failedValue, max: $max)';
}


}

/// @nodoc
abstract mixin class $ExceedingLengthCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $ExceedingLengthCopyWith(ExceedingLength<T> value, $Res Function(ExceedingLength<T>) _then) = _$ExceedingLengthCopyWithImpl;
@override @useResult
$Res call({
 T failedValue, int max
});




}
/// @nodoc
class _$ExceedingLengthCopyWithImpl<T,$Res>
    implements $ExceedingLengthCopyWith<T, $Res> {
  _$ExceedingLengthCopyWithImpl(this._self, this._then);

  final ExceedingLength<T> _self;
  final $Res Function(ExceedingLength<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,Object? max = null,}) {
  return _then(ExceedingLength<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SubceedLength<T> implements ValueFailure<T> {
  const SubceedLength({required this.failedValue, required this.min});
  

@override final  T failedValue;
 final  int min;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubceedLengthCopyWith<T, SubceedLength<T>> get copyWith => _$SubceedLengthCopyWithImpl<T, SubceedLength<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubceedLength<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue)&&(identical(other.min, min) || other.min == min));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue),min);

@override
String toString() {
  return 'ValueFailure<$T>.subceedLength(failedValue: $failedValue, min: $min)';
}


}

/// @nodoc
abstract mixin class $SubceedLengthCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $SubceedLengthCopyWith(SubceedLength<T> value, $Res Function(SubceedLength<T>) _then) = _$SubceedLengthCopyWithImpl;
@override @useResult
$Res call({
 T failedValue, int min
});




}
/// @nodoc
class _$SubceedLengthCopyWithImpl<T,$Res>
    implements $SubceedLengthCopyWith<T, $Res> {
  _$SubceedLengthCopyWithImpl(this._self, this._then);

  final SubceedLength<T> _self;
  final $Res Function(SubceedLength<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,Object? min = null,}) {
  return _then(SubceedLength<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Empty<T> implements ValueFailure<T> {
  const Empty({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmptyCopyWith<T, Empty<T>> get copyWith => _$EmptyCopyWithImpl<T, Empty<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Empty<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.empty(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $EmptyCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $EmptyCopyWith(Empty<T> value, $Res Function(Empty<T>) _then) = _$EmptyCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$EmptyCopyWithImpl<T,$Res>
    implements $EmptyCopyWith<T, $Res> {
  _$EmptyCopyWithImpl(this._self, this._then);

  final Empty<T> _self;
  final $Res Function(Empty<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(Empty<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class Multiline<T> implements ValueFailure<T> {
  const Multiline({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MultilineCopyWith<T, Multiline<T>> get copyWith => _$MultilineCopyWithImpl<T, Multiline<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Multiline<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.multiline(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $MultilineCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $MultilineCopyWith(Multiline<T> value, $Res Function(Multiline<T>) _then) = _$MultilineCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$MultilineCopyWithImpl<T,$Res>
    implements $MultilineCopyWith<T, $Res> {
  _$MultilineCopyWithImpl(this._self, this._then);

  final Multiline<T> _self;
  final $Res Function(Multiline<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(Multiline<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class InvalidEmail<T> implements ValueFailure<T> {
  const InvalidEmail({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith => _$InvalidEmailCopyWithImpl<T, InvalidEmail<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidEmail<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $InvalidEmailCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidEmailCopyWith(InvalidEmail<T> value, $Res Function(InvalidEmail<T>) _then) = _$InvalidEmailCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$InvalidEmailCopyWithImpl<T,$Res>
    implements $InvalidEmailCopyWith<T, $Res> {
  _$InvalidEmailCopyWithImpl(this._self, this._then);

  final InvalidEmail<T> _self;
  final $Res Function(InvalidEmail<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(InvalidEmail<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class NotVinGroupEmail<T> implements ValueFailure<T> {
  const NotVinGroupEmail({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotVinGroupEmailCopyWith<T, NotVinGroupEmail<T>> get copyWith => _$NotVinGroupEmailCopyWithImpl<T, NotVinGroupEmail<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotVinGroupEmail<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.notVinGroupEmail(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $NotVinGroupEmailCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $NotVinGroupEmailCopyWith(NotVinGroupEmail<T> value, $Res Function(NotVinGroupEmail<T>) _then) = _$NotVinGroupEmailCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$NotVinGroupEmailCopyWithImpl<T,$Res>
    implements $NotVinGroupEmailCopyWith<T, $Res> {
  _$NotVinGroupEmailCopyWithImpl(this._self, this._then);

  final NotVinGroupEmail<T> _self;
  final $Res Function(NotVinGroupEmail<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(NotVinGroupEmail<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ShortPassword<T> implements ValueFailure<T> {
  const ShortPassword({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShortPasswordCopyWith<T, ShortPassword<T>> get copyWith => _$ShortPasswordCopyWithImpl<T, ShortPassword<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortPassword<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.passwordNotMatchRequirements(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $ShortPasswordCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $ShortPasswordCopyWith(ShortPassword<T> value, $Res Function(ShortPassword<T>) _then) = _$ShortPasswordCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$ShortPasswordCopyWithImpl<T,$Res>
    implements $ShortPasswordCopyWith<T, $Res> {
  _$ShortPasswordCopyWithImpl(this._self, this._then);

  final ShortPassword<T> _self;
  final $Res Function(ShortPassword<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(ShortPassword<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class InvalidJWT<T> implements ValueFailure<T> {
  const InvalidJWT({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidJWTCopyWith<T, InvalidJWT<T>> get copyWith => _$InvalidJWTCopyWithImpl<T, InvalidJWT<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidJWT<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.invalidJWT(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $InvalidJWTCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidJWTCopyWith(InvalidJWT<T> value, $Res Function(InvalidJWT<T>) _then) = _$InvalidJWTCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$InvalidJWTCopyWithImpl<T,$Res>
    implements $InvalidJWTCopyWith<T, $Res> {
  _$InvalidJWTCopyWithImpl(this._self, this._then);

  final InvalidJWT<T> _self;
  final $Res Function(InvalidJWT<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(InvalidJWT<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class InvalidJWTPayload<T> implements ValueFailure<T> {
  const InvalidJWTPayload({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidJWTPayloadCopyWith<T, InvalidJWTPayload<T>> get copyWith => _$InvalidJWTPayloadCopyWithImpl<T, InvalidJWTPayload<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidJWTPayload<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.invalidJWTPayload(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $InvalidJWTPayloadCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidJWTPayloadCopyWith(InvalidJWTPayload<T> value, $Res Function(InvalidJWTPayload<T>) _then) = _$InvalidJWTPayloadCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$InvalidJWTPayloadCopyWithImpl<T,$Res>
    implements $InvalidJWTPayloadCopyWith<T, $Res> {
  _$InvalidJWTPayloadCopyWithImpl(this._self, this._then);

  final InvalidJWTPayload<T> _self;
  final $Res Function(InvalidJWTPayload<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(InvalidJWTPayload<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class OneUpperCase<T> implements ValueFailure<T> {
  const OneUpperCase({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OneUpperCaseCopyWith<T, OneUpperCase<T>> get copyWith => _$OneUpperCaseCopyWithImpl<T, OneUpperCase<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OneUpperCase<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.mustOneUpperCaseCharacter(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $OneUpperCaseCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $OneUpperCaseCopyWith(OneUpperCase<T> value, $Res Function(OneUpperCase<T>) _then) = _$OneUpperCaseCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$OneUpperCaseCopyWithImpl<T,$Res>
    implements $OneUpperCaseCopyWith<T, $Res> {
  _$OneUpperCaseCopyWithImpl(this._self, this._then);

  final OneUpperCase<T> _self;
  final $Res Function(OneUpperCase<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(OneUpperCase<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class OneLowerCase<T> implements ValueFailure<T> {
  const OneLowerCase({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OneLowerCaseCopyWith<T, OneLowerCase<T>> get copyWith => _$OneLowerCaseCopyWithImpl<T, OneLowerCase<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OneLowerCase<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.mustOneLowerCaseCharacter(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $OneLowerCaseCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $OneLowerCaseCopyWith(OneLowerCase<T> value, $Res Function(OneLowerCase<T>) _then) = _$OneLowerCaseCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$OneLowerCaseCopyWithImpl<T,$Res>
    implements $OneLowerCaseCopyWith<T, $Res> {
  _$OneLowerCaseCopyWithImpl(this._self, this._then);

  final OneLowerCase<T> _self;
  final $Res Function(OneLowerCase<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(OneLowerCase<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class OneNumeric<T> implements ValueFailure<T> {
  const OneNumeric({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OneNumericCopyWith<T, OneNumeric<T>> get copyWith => _$OneNumericCopyWithImpl<T, OneNumeric<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OneNumeric<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.mustOneNumericCharacter(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $OneNumericCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $OneNumericCopyWith(OneNumeric<T> value, $Res Function(OneNumeric<T>) _then) = _$OneNumericCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$OneNumericCopyWithImpl<T,$Res>
    implements $OneNumericCopyWith<T, $Res> {
  _$OneNumericCopyWithImpl(this._self, this._then);

  final OneNumeric<T> _self;
  final $Res Function(OneNumeric<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(OneNumeric<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class OneSpecial<T> implements ValueFailure<T> {
  const OneSpecial({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OneSpecialCopyWith<T, OneSpecial<T>> get copyWith => _$OneSpecialCopyWithImpl<T, OneSpecial<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OneSpecial<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.mustOneSpecialCharacter(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $OneSpecialCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $OneSpecialCopyWith(OneSpecial<T> value, $Res Function(OneSpecial<T>) _then) = _$OneSpecialCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$OneSpecialCopyWithImpl<T,$Res>
    implements $OneSpecialCopyWith<T, $Res> {
  _$OneSpecialCopyWithImpl(this._self, this._then);

  final OneSpecial<T> _self;
  final $Res Function(OneSpecial<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(OneSpecial<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class NotContainUserName<T> implements ValueFailure<T> {
  const NotContainUserName({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotContainUserNameCopyWith<T, NotContainUserName<T>> get copyWith => _$NotContainUserNameCopyWithImpl<T, NotContainUserName<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotContainUserName<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.containsForbiddenSubstring(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $NotContainUserNameCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $NotContainUserNameCopyWith(NotContainUserName<T> value, $Res Function(NotContainUserName<T>) _then) = _$NotContainUserNameCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$NotContainUserNameCopyWithImpl<T,$Res>
    implements $NotContainUserNameCopyWith<T, $Res> {
  _$NotContainUserNameCopyWithImpl(this._self, this._then);

  final NotContainUserName<T> _self;
  final $Res Function(NotContainUserName<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(NotContainUserName<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class NotMatchOldPassword<T> implements ValueFailure<T> {
  const NotMatchOldPassword({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotMatchOldPasswordCopyWith<T, NotMatchOldPassword<T>> get copyWith => _$NotMatchOldPasswordCopyWithImpl<T, NotMatchOldPassword<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotMatchOldPassword<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.mustNotMatchOldPassword(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $NotMatchOldPasswordCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $NotMatchOldPasswordCopyWith(NotMatchOldPassword<T> value, $Res Function(NotMatchOldPassword<T>) _then) = _$NotMatchOldPasswordCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$NotMatchOldPasswordCopyWithImpl<T,$Res>
    implements $NotMatchOldPasswordCopyWith<T, $Res> {
  _$NotMatchOldPasswordCopyWithImpl(this._self, this._then);

  final NotMatchOldPassword<T> _self;
  final $Res Function(NotMatchOldPassword<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(NotMatchOldPassword<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class MatchNewPassword<T> implements ValueFailure<T> {
  const MatchNewPassword({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchNewPasswordCopyWith<T, MatchNewPassword<T>> get copyWith => _$MatchNewPasswordCopyWithImpl<T, MatchNewPassword<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchNewPassword<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.mustMatchNewPassword(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $MatchNewPasswordCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $MatchNewPasswordCopyWith(MatchNewPassword<T> value, $Res Function(MatchNewPassword<T>) _then) = _$MatchNewPasswordCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$MatchNewPasswordCopyWithImpl<T,$Res>
    implements $MatchNewPasswordCopyWith<T, $Res> {
  _$MatchNewPasswordCopyWithImpl(this._self, this._then);

  final MatchNewPassword<T> _self;
  final $Res Function(MatchNewPassword<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(MatchNewPassword<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class _isEmpty<T> implements ValueFailure<T> {
  const _isEmpty({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$isEmptyCopyWith<T, _isEmpty<T>> get copyWith => __$isEmptyCopyWithImpl<T, _isEmpty<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _isEmpty<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.isEmpty(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class _$isEmptyCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory _$isEmptyCopyWith(_isEmpty<T> value, $Res Function(_isEmpty<T>) _then) = __$isEmptyCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class __$isEmptyCopyWithImpl<T,$Res>
    implements _$isEmptyCopyWith<T, $Res> {
  __$isEmptyCopyWithImpl(this._self, this._then);

  final _isEmpty<T> _self;
  final $Res Function(_isEmpty<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(_isEmpty<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class _numberMustBiggerThanZero<T> implements ValueFailure<T> {
  const _numberMustBiggerThanZero({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$numberMustBiggerThanZeroCopyWith<T, _numberMustBiggerThanZero<T>> get copyWith => __$numberMustBiggerThanZeroCopyWithImpl<T, _numberMustBiggerThanZero<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _numberMustBiggerThanZero<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.numberMustBiggerThanZero(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class _$numberMustBiggerThanZeroCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory _$numberMustBiggerThanZeroCopyWith(_numberMustBiggerThanZero<T> value, $Res Function(_numberMustBiggerThanZero<T>) _then) = __$numberMustBiggerThanZeroCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class __$numberMustBiggerThanZeroCopyWithImpl<T,$Res>
    implements _$numberMustBiggerThanZeroCopyWith<T, $Res> {
  __$numberMustBiggerThanZeroCopyWithImpl(this._self, this._then);

  final _numberMustBiggerThanZero<T> _self;
  final $Res Function(_numberMustBiggerThanZero<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(_numberMustBiggerThanZero<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class validateExceedsMaxValue<T> implements ValueFailure<T> {
  const validateExceedsMaxValue({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$validateExceedsMaxValueCopyWith<T, validateExceedsMaxValue<T>> get copyWith => _$validateExceedsMaxValueCopyWithImpl<T, validateExceedsMaxValue<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is validateExceedsMaxValue<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.exceedingMaxValue(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $validateExceedsMaxValueCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $validateExceedsMaxValueCopyWith(validateExceedsMaxValue<T> value, $Res Function(validateExceedsMaxValue<T>) _then) = _$validateExceedsMaxValueCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$validateExceedsMaxValueCopyWithImpl<T,$Res>
    implements $validateExceedsMaxValueCopyWith<T, $Res> {
  _$validateExceedsMaxValueCopyWithImpl(this._self, this._then);

  final validateExceedsMaxValue<T> _self;
  final $Res Function(validateExceedsMaxValue<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(validateExceedsMaxValue<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class InvalidDateValue<T> implements ValueFailure<T> {
  const InvalidDateValue({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidDateValueCopyWith<T, InvalidDateValue<T>> get copyWith => _$InvalidDateValueCopyWithImpl<T, InvalidDateValue<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidDateValue<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.invalidDateValue(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $InvalidDateValueCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidDateValueCopyWith(InvalidDateValue<T> value, $Res Function(InvalidDateValue<T>) _then) = _$InvalidDateValueCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$InvalidDateValueCopyWithImpl<T,$Res>
    implements $InvalidDateValueCopyWith<T, $Res> {
  _$InvalidDateValueCopyWithImpl(this._self, this._then);

  final InvalidDateValue<T> _self;
  final $Res Function(InvalidDateValue<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(InvalidDateValue<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class InvalidDoubleValue<T> implements ValueFailure<T> {
  const InvalidDoubleValue({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidDoubleValueCopyWith<T, InvalidDoubleValue<T>> get copyWith => _$InvalidDoubleValueCopyWithImpl<T, InvalidDoubleValue<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidDoubleValue<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.invalidDoubleValue(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $InvalidDoubleValueCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidDoubleValueCopyWith(InvalidDoubleValue<T> value, $Res Function(InvalidDoubleValue<T>) _then) = _$InvalidDoubleValueCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$InvalidDoubleValueCopyWithImpl<T,$Res>
    implements $InvalidDoubleValueCopyWith<T, $Res> {
  _$InvalidDoubleValueCopyWithImpl(this._self, this._then);

  final InvalidDoubleValue<T> _self;
  final $Res Function(InvalidDoubleValue<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(InvalidDoubleValue<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class InvalidIntegerValue<T> implements ValueFailure<T> {
  const InvalidIntegerValue({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidIntegerValueCopyWith<T, InvalidIntegerValue<T>> get copyWith => _$InvalidIntegerValueCopyWithImpl<T, InvalidIntegerValue<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidIntegerValue<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.invalidIntegerValue(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $InvalidIntegerValueCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidIntegerValueCopyWith(InvalidIntegerValue<T> value, $Res Function(InvalidIntegerValue<T>) _then) = _$InvalidIntegerValueCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$InvalidIntegerValueCopyWithImpl<T,$Res>
    implements $InvalidIntegerValueCopyWith<T, $Res> {
  _$InvalidIntegerValueCopyWithImpl(this._self, this._then);

  final InvalidIntegerValue<T> _self;
  final $Res Function(InvalidIntegerValue<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(InvalidIntegerValue<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class InvalidVin<T> implements ValueFailure<T> {
  const InvalidVin({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidVinCopyWith<T, InvalidVin<T>> get copyWith => _$InvalidVinCopyWithImpl<T, InvalidVin<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidVin<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.invalidVin(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $InvalidVinCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidVinCopyWith(InvalidVin<T> value, $Res Function(InvalidVin<T>) _then) = _$InvalidVinCopyWithImpl;
@override @useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$InvalidVinCopyWithImpl<T,$Res>
    implements $InvalidVinCopyWith<T, $Res> {
  _$InvalidVinCopyWithImpl(this._self, this._then);

  final InvalidVin<T> _self;
  final $Res Function(InvalidVin<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(InvalidVin<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

// dart format on
