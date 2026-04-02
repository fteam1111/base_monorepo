import 'package:core/error/tr_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failures.freezed.dart';

@freezed
class ApiFailure with _$ApiFailure {
  const factory ApiFailure.other(String message) = _Other;

  const factory ApiFailure.serverError(String message) = _ServerError;

  const factory ApiFailure.noInternet() = _NoInternet;

  const factory ApiFailure.poorConnection() = _PoorConnection;

  const factory ApiFailure.serverTimeout() = _ServerTimeout;

  //User failure
  const factory ApiFailure.userNotFound() = _UserNotFound;

  //Auth failure
  const factory ApiFailure.invalidEmailAndPasswordCombination() =
      _InvalidEmailAndPasswordCombination;

  const factory ApiFailure.accountLocked() = _AccountLocked;

  const factory ApiFailure.accountExpired() = _AccountExpired;

  const factory ApiFailure.tokenExpired() = _TokenExpired;

  const factory ApiFailure.refreshTokenInvalid() = _RefreshTokenInvalid;

  const factory ApiFailure.authenticationFailed() = _AuthenticationFailed;

  const factory ApiFailure.passwordResetFail() = _PasswordResetFail;

  // Bio failure
  const factory ApiFailure.deviceNotSupportBiometric() =
      _DeviceNotSupportBiometric;

  const factory ApiFailure.cannotCheckBiometrics() = _CannotCheckBiometrics;

  const factory ApiFailure.noSupportedBiometrics() = _NoSupportedBiometrics;

  const factory ApiFailure.invalidBiometric() = _InvalidBiometric;

  // permission failure
  const factory ApiFailure.photoPermissionFailed() = _PhotoPermissionFailed;

  const factory ApiFailure.storagePermissionFailed() = _StoragePermissionFailed;

  //deep link navigation failure
  const factory ApiFailure.invalidDomain() = _InvalidDomain;

  const factory ApiFailure.languageChangeFail() = _LanguageChangeFail;

  const factory ApiFailure.cameraPermissionFailed(bool permanentlyDenied) =
      _CameraPermissionFailed;

  const factory ApiFailure.userNameNotFound() = _UserNameNotFound;

  const factory ApiFailure.accountBlocked() = _AccountBlocked;
}

extension ApiFailureExt on ApiFailure {
  //ignore:long-method
  TRObject get failureMessage => map(
    other: (other) => TRObject(other.message),
    serverError: (serverError) => TRObject(serverError.message),
    poorConnection: (_) => const TRObject('Poor Internet connection'),
    serverTimeout: (_) => const TRObject('Server time out'),
    noInternet: (_) => const TRObject('Please check your network connection'),
    userNotFound: (_) => const TRObject('User not found.'),
    accountBlocked: (_) => const TRObject('This account is blocked'),
    invalidEmailAndPasswordCombination: (_) =>
        const TRObject('Incorrect username and/or password.'),
    accountLocked: (_) => const TRObject('Account is Locked'),
    accountExpired: (_) => const TRObject('Account is Expired'),
    tokenExpired: (_) => const TRObject('Session token is Expired'),
    authenticationFailed: (_) => const TRObject('Your session has expired'),
    deviceNotSupportBiometric: (_) =>
        const TRObject('Device not support biometric'),
    cannotCheckBiometrics: (_) =>
        const TRObject('Unable to check your biometric'),
    noSupportedBiometrics: (_) => const TRObject('No supported biometric'),
    invalidBiometric: (_) => const TRObject('Incorrect biometric'),
    photoPermissionFailed: (_) =>
        const TRObject('Please enable Photos permission from the app settings'),
    storagePermissionFailed: (_) => const TRObject(
      'Please enable Storage permission from the app settings',
    ),
    invalidDomain: (_) => const TRObject("You don't have access"),
    passwordResetFail: (_) => const TRObject('Unable to reset password'),
    languageChangeFail: (_) => const TRObject('Unable to change language'),
    cameraPermissionFailed: (_) => const TRObject('Camera Permission Denied'),
    userNameNotFound: (_) => const TRObject('Incorrect username'),
    refreshTokenInvalid: (_) => const TRObject('Invalid Refresh Token'),
  );

  String get nonTranslatedFailureMessage {
    var fullMessage = failureMessage.message;
    if (failureMessage.arguments.isEmpty) {
      return fullMessage;
    }
    failureMessage.arguments.forEach(
      (String key, String value) =>
          fullMessage = fullMessage.replaceAll(RegExp('{$key}'), value),
    );

    return fullMessage;
  }
}
