// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure()';
}


}

/// @nodoc
class $ApiFailureCopyWith<$Res>  {
$ApiFailureCopyWith(ApiFailure _, $Res Function(ApiFailure) __);
}


/// Adds pattern-matching-related methods to [ApiFailure].
extension ApiFailurePatterns on ApiFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Other value)?  other,TResult Function( _ServerError value)?  serverError,TResult Function( _NoInternet value)?  noInternet,TResult Function( _PoorConnection value)?  poorConnection,TResult Function( _ServerTimeout value)?  serverTimeout,TResult Function( _UserNotFound value)?  userNotFound,TResult Function( _InvalidEmailAndPasswordCombination value)?  invalidEmailAndPasswordCombination,TResult Function( _AccountLocked value)?  accountLocked,TResult Function( _AccountExpired value)?  accountExpired,TResult Function( _TokenExpired value)?  tokenExpired,TResult Function( _RefreshTokenInvalid value)?  refreshTokenInvalid,TResult Function( _AuthenticationFailed value)?  authenticationFailed,TResult Function( _PasswordResetFail value)?  passwordResetFail,TResult Function( _DeviceNotSupportBiometric value)?  deviceNotSupportBiometric,TResult Function( _CannotCheckBiometrics value)?  cannotCheckBiometrics,TResult Function( _NoSupportedBiometrics value)?  noSupportedBiometrics,TResult Function( _InvalidBiometric value)?  invalidBiometric,TResult Function( _PhotoPermissionFailed value)?  photoPermissionFailed,TResult Function( _StoragePermissionFailed value)?  storagePermissionFailed,TResult Function( _InvalidDomain value)?  invalidDomain,TResult Function( _LanguageChangeFail value)?  languageChangeFail,TResult Function( _CameraPermissionFailed value)?  cameraPermissionFailed,TResult Function( _UserNameNotFound value)?  userNameNotFound,TResult Function( _AccountBlocked value)?  accountBlocked,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Other() when other != null:
return other(_that);case _ServerError() when serverError != null:
return serverError(_that);case _NoInternet() when noInternet != null:
return noInternet(_that);case _PoorConnection() when poorConnection != null:
return poorConnection(_that);case _ServerTimeout() when serverTimeout != null:
return serverTimeout(_that);case _UserNotFound() when userNotFound != null:
return userNotFound(_that);case _InvalidEmailAndPasswordCombination() when invalidEmailAndPasswordCombination != null:
return invalidEmailAndPasswordCombination(_that);case _AccountLocked() when accountLocked != null:
return accountLocked(_that);case _AccountExpired() when accountExpired != null:
return accountExpired(_that);case _TokenExpired() when tokenExpired != null:
return tokenExpired(_that);case _RefreshTokenInvalid() when refreshTokenInvalid != null:
return refreshTokenInvalid(_that);case _AuthenticationFailed() when authenticationFailed != null:
return authenticationFailed(_that);case _PasswordResetFail() when passwordResetFail != null:
return passwordResetFail(_that);case _DeviceNotSupportBiometric() when deviceNotSupportBiometric != null:
return deviceNotSupportBiometric(_that);case _CannotCheckBiometrics() when cannotCheckBiometrics != null:
return cannotCheckBiometrics(_that);case _NoSupportedBiometrics() when noSupportedBiometrics != null:
return noSupportedBiometrics(_that);case _InvalidBiometric() when invalidBiometric != null:
return invalidBiometric(_that);case _PhotoPermissionFailed() when photoPermissionFailed != null:
return photoPermissionFailed(_that);case _StoragePermissionFailed() when storagePermissionFailed != null:
return storagePermissionFailed(_that);case _InvalidDomain() when invalidDomain != null:
return invalidDomain(_that);case _LanguageChangeFail() when languageChangeFail != null:
return languageChangeFail(_that);case _CameraPermissionFailed() when cameraPermissionFailed != null:
return cameraPermissionFailed(_that);case _UserNameNotFound() when userNameNotFound != null:
return userNameNotFound(_that);case _AccountBlocked() when accountBlocked != null:
return accountBlocked(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Other value)  other,required TResult Function( _ServerError value)  serverError,required TResult Function( _NoInternet value)  noInternet,required TResult Function( _PoorConnection value)  poorConnection,required TResult Function( _ServerTimeout value)  serverTimeout,required TResult Function( _UserNotFound value)  userNotFound,required TResult Function( _InvalidEmailAndPasswordCombination value)  invalidEmailAndPasswordCombination,required TResult Function( _AccountLocked value)  accountLocked,required TResult Function( _AccountExpired value)  accountExpired,required TResult Function( _TokenExpired value)  tokenExpired,required TResult Function( _RefreshTokenInvalid value)  refreshTokenInvalid,required TResult Function( _AuthenticationFailed value)  authenticationFailed,required TResult Function( _PasswordResetFail value)  passwordResetFail,required TResult Function( _DeviceNotSupportBiometric value)  deviceNotSupportBiometric,required TResult Function( _CannotCheckBiometrics value)  cannotCheckBiometrics,required TResult Function( _NoSupportedBiometrics value)  noSupportedBiometrics,required TResult Function( _InvalidBiometric value)  invalidBiometric,required TResult Function( _PhotoPermissionFailed value)  photoPermissionFailed,required TResult Function( _StoragePermissionFailed value)  storagePermissionFailed,required TResult Function( _InvalidDomain value)  invalidDomain,required TResult Function( _LanguageChangeFail value)  languageChangeFail,required TResult Function( _CameraPermissionFailed value)  cameraPermissionFailed,required TResult Function( _UserNameNotFound value)  userNameNotFound,required TResult Function( _AccountBlocked value)  accountBlocked,}){
final _that = this;
switch (_that) {
case _Other():
return other(_that);case _ServerError():
return serverError(_that);case _NoInternet():
return noInternet(_that);case _PoorConnection():
return poorConnection(_that);case _ServerTimeout():
return serverTimeout(_that);case _UserNotFound():
return userNotFound(_that);case _InvalidEmailAndPasswordCombination():
return invalidEmailAndPasswordCombination(_that);case _AccountLocked():
return accountLocked(_that);case _AccountExpired():
return accountExpired(_that);case _TokenExpired():
return tokenExpired(_that);case _RefreshTokenInvalid():
return refreshTokenInvalid(_that);case _AuthenticationFailed():
return authenticationFailed(_that);case _PasswordResetFail():
return passwordResetFail(_that);case _DeviceNotSupportBiometric():
return deviceNotSupportBiometric(_that);case _CannotCheckBiometrics():
return cannotCheckBiometrics(_that);case _NoSupportedBiometrics():
return noSupportedBiometrics(_that);case _InvalidBiometric():
return invalidBiometric(_that);case _PhotoPermissionFailed():
return photoPermissionFailed(_that);case _StoragePermissionFailed():
return storagePermissionFailed(_that);case _InvalidDomain():
return invalidDomain(_that);case _LanguageChangeFail():
return languageChangeFail(_that);case _CameraPermissionFailed():
return cameraPermissionFailed(_that);case _UserNameNotFound():
return userNameNotFound(_that);case _AccountBlocked():
return accountBlocked(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Other value)?  other,TResult? Function( _ServerError value)?  serverError,TResult? Function( _NoInternet value)?  noInternet,TResult? Function( _PoorConnection value)?  poorConnection,TResult? Function( _ServerTimeout value)?  serverTimeout,TResult? Function( _UserNotFound value)?  userNotFound,TResult? Function( _InvalidEmailAndPasswordCombination value)?  invalidEmailAndPasswordCombination,TResult? Function( _AccountLocked value)?  accountLocked,TResult? Function( _AccountExpired value)?  accountExpired,TResult? Function( _TokenExpired value)?  tokenExpired,TResult? Function( _RefreshTokenInvalid value)?  refreshTokenInvalid,TResult? Function( _AuthenticationFailed value)?  authenticationFailed,TResult? Function( _PasswordResetFail value)?  passwordResetFail,TResult? Function( _DeviceNotSupportBiometric value)?  deviceNotSupportBiometric,TResult? Function( _CannotCheckBiometrics value)?  cannotCheckBiometrics,TResult? Function( _NoSupportedBiometrics value)?  noSupportedBiometrics,TResult? Function( _InvalidBiometric value)?  invalidBiometric,TResult? Function( _PhotoPermissionFailed value)?  photoPermissionFailed,TResult? Function( _StoragePermissionFailed value)?  storagePermissionFailed,TResult? Function( _InvalidDomain value)?  invalidDomain,TResult? Function( _LanguageChangeFail value)?  languageChangeFail,TResult? Function( _CameraPermissionFailed value)?  cameraPermissionFailed,TResult? Function( _UserNameNotFound value)?  userNameNotFound,TResult? Function( _AccountBlocked value)?  accountBlocked,}){
final _that = this;
switch (_that) {
case _Other() when other != null:
return other(_that);case _ServerError() when serverError != null:
return serverError(_that);case _NoInternet() when noInternet != null:
return noInternet(_that);case _PoorConnection() when poorConnection != null:
return poorConnection(_that);case _ServerTimeout() when serverTimeout != null:
return serverTimeout(_that);case _UserNotFound() when userNotFound != null:
return userNotFound(_that);case _InvalidEmailAndPasswordCombination() when invalidEmailAndPasswordCombination != null:
return invalidEmailAndPasswordCombination(_that);case _AccountLocked() when accountLocked != null:
return accountLocked(_that);case _AccountExpired() when accountExpired != null:
return accountExpired(_that);case _TokenExpired() when tokenExpired != null:
return tokenExpired(_that);case _RefreshTokenInvalid() when refreshTokenInvalid != null:
return refreshTokenInvalid(_that);case _AuthenticationFailed() when authenticationFailed != null:
return authenticationFailed(_that);case _PasswordResetFail() when passwordResetFail != null:
return passwordResetFail(_that);case _DeviceNotSupportBiometric() when deviceNotSupportBiometric != null:
return deviceNotSupportBiometric(_that);case _CannotCheckBiometrics() when cannotCheckBiometrics != null:
return cannotCheckBiometrics(_that);case _NoSupportedBiometrics() when noSupportedBiometrics != null:
return noSupportedBiometrics(_that);case _InvalidBiometric() when invalidBiometric != null:
return invalidBiometric(_that);case _PhotoPermissionFailed() when photoPermissionFailed != null:
return photoPermissionFailed(_that);case _StoragePermissionFailed() when storagePermissionFailed != null:
return storagePermissionFailed(_that);case _InvalidDomain() when invalidDomain != null:
return invalidDomain(_that);case _LanguageChangeFail() when languageChangeFail != null:
return languageChangeFail(_that);case _CameraPermissionFailed() when cameraPermissionFailed != null:
return cameraPermissionFailed(_that);case _UserNameNotFound() when userNameNotFound != null:
return userNameNotFound(_that);case _AccountBlocked() when accountBlocked != null:
return accountBlocked(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  other,TResult Function( String message)?  serverError,TResult Function()?  noInternet,TResult Function()?  poorConnection,TResult Function()?  serverTimeout,TResult Function()?  userNotFound,TResult Function()?  invalidEmailAndPasswordCombination,TResult Function()?  accountLocked,TResult Function()?  accountExpired,TResult Function()?  tokenExpired,TResult Function()?  refreshTokenInvalid,TResult Function()?  authenticationFailed,TResult Function()?  passwordResetFail,TResult Function()?  deviceNotSupportBiometric,TResult Function()?  cannotCheckBiometrics,TResult Function()?  noSupportedBiometrics,TResult Function()?  invalidBiometric,TResult Function()?  photoPermissionFailed,TResult Function()?  storagePermissionFailed,TResult Function()?  invalidDomain,TResult Function()?  languageChangeFail,TResult Function( bool permanentlyDenied)?  cameraPermissionFailed,TResult Function()?  userNameNotFound,TResult Function()?  accountBlocked,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Other() when other != null:
return other(_that.message);case _ServerError() when serverError != null:
return serverError(_that.message);case _NoInternet() when noInternet != null:
return noInternet();case _PoorConnection() when poorConnection != null:
return poorConnection();case _ServerTimeout() when serverTimeout != null:
return serverTimeout();case _UserNotFound() when userNotFound != null:
return userNotFound();case _InvalidEmailAndPasswordCombination() when invalidEmailAndPasswordCombination != null:
return invalidEmailAndPasswordCombination();case _AccountLocked() when accountLocked != null:
return accountLocked();case _AccountExpired() when accountExpired != null:
return accountExpired();case _TokenExpired() when tokenExpired != null:
return tokenExpired();case _RefreshTokenInvalid() when refreshTokenInvalid != null:
return refreshTokenInvalid();case _AuthenticationFailed() when authenticationFailed != null:
return authenticationFailed();case _PasswordResetFail() when passwordResetFail != null:
return passwordResetFail();case _DeviceNotSupportBiometric() when deviceNotSupportBiometric != null:
return deviceNotSupportBiometric();case _CannotCheckBiometrics() when cannotCheckBiometrics != null:
return cannotCheckBiometrics();case _NoSupportedBiometrics() when noSupportedBiometrics != null:
return noSupportedBiometrics();case _InvalidBiometric() when invalidBiometric != null:
return invalidBiometric();case _PhotoPermissionFailed() when photoPermissionFailed != null:
return photoPermissionFailed();case _StoragePermissionFailed() when storagePermissionFailed != null:
return storagePermissionFailed();case _InvalidDomain() when invalidDomain != null:
return invalidDomain();case _LanguageChangeFail() when languageChangeFail != null:
return languageChangeFail();case _CameraPermissionFailed() when cameraPermissionFailed != null:
return cameraPermissionFailed(_that.permanentlyDenied);case _UserNameNotFound() when userNameNotFound != null:
return userNameNotFound();case _AccountBlocked() when accountBlocked != null:
return accountBlocked();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  other,required TResult Function( String message)  serverError,required TResult Function()  noInternet,required TResult Function()  poorConnection,required TResult Function()  serverTimeout,required TResult Function()  userNotFound,required TResult Function()  invalidEmailAndPasswordCombination,required TResult Function()  accountLocked,required TResult Function()  accountExpired,required TResult Function()  tokenExpired,required TResult Function()  refreshTokenInvalid,required TResult Function()  authenticationFailed,required TResult Function()  passwordResetFail,required TResult Function()  deviceNotSupportBiometric,required TResult Function()  cannotCheckBiometrics,required TResult Function()  noSupportedBiometrics,required TResult Function()  invalidBiometric,required TResult Function()  photoPermissionFailed,required TResult Function()  storagePermissionFailed,required TResult Function()  invalidDomain,required TResult Function()  languageChangeFail,required TResult Function( bool permanentlyDenied)  cameraPermissionFailed,required TResult Function()  userNameNotFound,required TResult Function()  accountBlocked,}) {final _that = this;
switch (_that) {
case _Other():
return other(_that.message);case _ServerError():
return serverError(_that.message);case _NoInternet():
return noInternet();case _PoorConnection():
return poorConnection();case _ServerTimeout():
return serverTimeout();case _UserNotFound():
return userNotFound();case _InvalidEmailAndPasswordCombination():
return invalidEmailAndPasswordCombination();case _AccountLocked():
return accountLocked();case _AccountExpired():
return accountExpired();case _TokenExpired():
return tokenExpired();case _RefreshTokenInvalid():
return refreshTokenInvalid();case _AuthenticationFailed():
return authenticationFailed();case _PasswordResetFail():
return passwordResetFail();case _DeviceNotSupportBiometric():
return deviceNotSupportBiometric();case _CannotCheckBiometrics():
return cannotCheckBiometrics();case _NoSupportedBiometrics():
return noSupportedBiometrics();case _InvalidBiometric():
return invalidBiometric();case _PhotoPermissionFailed():
return photoPermissionFailed();case _StoragePermissionFailed():
return storagePermissionFailed();case _InvalidDomain():
return invalidDomain();case _LanguageChangeFail():
return languageChangeFail();case _CameraPermissionFailed():
return cameraPermissionFailed(_that.permanentlyDenied);case _UserNameNotFound():
return userNameNotFound();case _AccountBlocked():
return accountBlocked();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  other,TResult? Function( String message)?  serverError,TResult? Function()?  noInternet,TResult? Function()?  poorConnection,TResult? Function()?  serverTimeout,TResult? Function()?  userNotFound,TResult? Function()?  invalidEmailAndPasswordCombination,TResult? Function()?  accountLocked,TResult? Function()?  accountExpired,TResult? Function()?  tokenExpired,TResult? Function()?  refreshTokenInvalid,TResult? Function()?  authenticationFailed,TResult? Function()?  passwordResetFail,TResult? Function()?  deviceNotSupportBiometric,TResult? Function()?  cannotCheckBiometrics,TResult? Function()?  noSupportedBiometrics,TResult? Function()?  invalidBiometric,TResult? Function()?  photoPermissionFailed,TResult? Function()?  storagePermissionFailed,TResult? Function()?  invalidDomain,TResult? Function()?  languageChangeFail,TResult? Function( bool permanentlyDenied)?  cameraPermissionFailed,TResult? Function()?  userNameNotFound,TResult? Function()?  accountBlocked,}) {final _that = this;
switch (_that) {
case _Other() when other != null:
return other(_that.message);case _ServerError() when serverError != null:
return serverError(_that.message);case _NoInternet() when noInternet != null:
return noInternet();case _PoorConnection() when poorConnection != null:
return poorConnection();case _ServerTimeout() when serverTimeout != null:
return serverTimeout();case _UserNotFound() when userNotFound != null:
return userNotFound();case _InvalidEmailAndPasswordCombination() when invalidEmailAndPasswordCombination != null:
return invalidEmailAndPasswordCombination();case _AccountLocked() when accountLocked != null:
return accountLocked();case _AccountExpired() when accountExpired != null:
return accountExpired();case _TokenExpired() when tokenExpired != null:
return tokenExpired();case _RefreshTokenInvalid() when refreshTokenInvalid != null:
return refreshTokenInvalid();case _AuthenticationFailed() when authenticationFailed != null:
return authenticationFailed();case _PasswordResetFail() when passwordResetFail != null:
return passwordResetFail();case _DeviceNotSupportBiometric() when deviceNotSupportBiometric != null:
return deviceNotSupportBiometric();case _CannotCheckBiometrics() when cannotCheckBiometrics != null:
return cannotCheckBiometrics();case _NoSupportedBiometrics() when noSupportedBiometrics != null:
return noSupportedBiometrics();case _InvalidBiometric() when invalidBiometric != null:
return invalidBiometric();case _PhotoPermissionFailed() when photoPermissionFailed != null:
return photoPermissionFailed();case _StoragePermissionFailed() when storagePermissionFailed != null:
return storagePermissionFailed();case _InvalidDomain() when invalidDomain != null:
return invalidDomain();case _LanguageChangeFail() when languageChangeFail != null:
return languageChangeFail();case _CameraPermissionFailed() when cameraPermissionFailed != null:
return cameraPermissionFailed(_that.permanentlyDenied);case _UserNameNotFound() when userNameNotFound != null:
return userNameNotFound();case _AccountBlocked() when accountBlocked != null:
return accountBlocked();case _:
  return null;

}
}

}

/// @nodoc


class _Other implements ApiFailure {
  const _Other(this.message);
  

 final  String message;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtherCopyWith<_Other> get copyWith => __$OtherCopyWithImpl<_Other>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Other&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiFailure.other(message: $message)';
}


}

/// @nodoc
abstract mixin class _$OtherCopyWith<$Res> implements $ApiFailureCopyWith<$Res> {
  factory _$OtherCopyWith(_Other value, $Res Function(_Other) _then) = __$OtherCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$OtherCopyWithImpl<$Res>
    implements _$OtherCopyWith<$Res> {
  __$OtherCopyWithImpl(this._self, this._then);

  final _Other _self;
  final $Res Function(_Other) _then;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Other(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ServerError implements ApiFailure {
  const _ServerError(this.message);
  

 final  String message;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerErrorCopyWith<_ServerError> get copyWith => __$ServerErrorCopyWithImpl<_ServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ServerErrorCopyWith<$Res> implements $ApiFailureCopyWith<$Res> {
  factory _$ServerErrorCopyWith(_ServerError value, $Res Function(_ServerError) _then) = __$ServerErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ServerErrorCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(this._self, this._then);

  final _ServerError _self;
  final $Res Function(_ServerError) _then;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ServerError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NoInternet implements ApiFailure {
  const _NoInternet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoInternet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.noInternet()';
}


}




/// @nodoc


class _PoorConnection implements ApiFailure {
  const _PoorConnection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PoorConnection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.poorConnection()';
}


}




/// @nodoc


class _ServerTimeout implements ApiFailure {
  const _ServerTimeout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerTimeout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.serverTimeout()';
}


}




/// @nodoc


class _UserNotFound implements ApiFailure {
  const _UserNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.userNotFound()';
}


}




/// @nodoc


class _InvalidEmailAndPasswordCombination implements ApiFailure {
  const _InvalidEmailAndPasswordCombination();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidEmailAndPasswordCombination);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.invalidEmailAndPasswordCombination()';
}


}




/// @nodoc


class _AccountLocked implements ApiFailure {
  const _AccountLocked();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountLocked);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.accountLocked()';
}


}




/// @nodoc


class _AccountExpired implements ApiFailure {
  const _AccountExpired();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountExpired);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.accountExpired()';
}


}




/// @nodoc


class _TokenExpired implements ApiFailure {
  const _TokenExpired();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenExpired);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.tokenExpired()';
}


}




/// @nodoc


class _RefreshTokenInvalid implements ApiFailure {
  const _RefreshTokenInvalid();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenInvalid);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.refreshTokenInvalid()';
}


}




/// @nodoc


class _AuthenticationFailed implements ApiFailure {
  const _AuthenticationFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticationFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.authenticationFailed()';
}


}




/// @nodoc


class _PasswordResetFail implements ApiFailure {
  const _PasswordResetFail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordResetFail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.passwordResetFail()';
}


}




/// @nodoc


class _DeviceNotSupportBiometric implements ApiFailure {
  const _DeviceNotSupportBiometric();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceNotSupportBiometric);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.deviceNotSupportBiometric()';
}


}




/// @nodoc


class _CannotCheckBiometrics implements ApiFailure {
  const _CannotCheckBiometrics();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CannotCheckBiometrics);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.cannotCheckBiometrics()';
}


}




/// @nodoc


class _NoSupportedBiometrics implements ApiFailure {
  const _NoSupportedBiometrics();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoSupportedBiometrics);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.noSupportedBiometrics()';
}


}




/// @nodoc


class _InvalidBiometric implements ApiFailure {
  const _InvalidBiometric();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidBiometric);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.invalidBiometric()';
}


}




/// @nodoc


class _PhotoPermissionFailed implements ApiFailure {
  const _PhotoPermissionFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoPermissionFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.photoPermissionFailed()';
}


}




/// @nodoc


class _StoragePermissionFailed implements ApiFailure {
  const _StoragePermissionFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoragePermissionFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.storagePermissionFailed()';
}


}




/// @nodoc


class _InvalidDomain implements ApiFailure {
  const _InvalidDomain();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidDomain);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.invalidDomain()';
}


}




/// @nodoc


class _LanguageChangeFail implements ApiFailure {
  const _LanguageChangeFail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LanguageChangeFail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.languageChangeFail()';
}


}




/// @nodoc


class _CameraPermissionFailed implements ApiFailure {
  const _CameraPermissionFailed(this.permanentlyDenied);
  

 final  bool permanentlyDenied;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraPermissionFailedCopyWith<_CameraPermissionFailed> get copyWith => __$CameraPermissionFailedCopyWithImpl<_CameraPermissionFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraPermissionFailed&&(identical(other.permanentlyDenied, permanentlyDenied) || other.permanentlyDenied == permanentlyDenied));
}


@override
int get hashCode => Object.hash(runtimeType,permanentlyDenied);

@override
String toString() {
  return 'ApiFailure.cameraPermissionFailed(permanentlyDenied: $permanentlyDenied)';
}


}

/// @nodoc
abstract mixin class _$CameraPermissionFailedCopyWith<$Res> implements $ApiFailureCopyWith<$Res> {
  factory _$CameraPermissionFailedCopyWith(_CameraPermissionFailed value, $Res Function(_CameraPermissionFailed) _then) = __$CameraPermissionFailedCopyWithImpl;
@useResult
$Res call({
 bool permanentlyDenied
});




}
/// @nodoc
class __$CameraPermissionFailedCopyWithImpl<$Res>
    implements _$CameraPermissionFailedCopyWith<$Res> {
  __$CameraPermissionFailedCopyWithImpl(this._self, this._then);

  final _CameraPermissionFailed _self;
  final $Res Function(_CameraPermissionFailed) _then;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? permanentlyDenied = null,}) {
  return _then(_CameraPermissionFailed(
null == permanentlyDenied ? _self.permanentlyDenied : permanentlyDenied // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _UserNameNotFound implements ApiFailure {
  const _UserNameNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserNameNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.userNameNotFound()';
}


}




/// @nodoc


class _AccountBlocked implements ApiFailure {
  const _AccountBlocked();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountBlocked);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiFailure.accountBlocked()';
}


}




// dart format on
