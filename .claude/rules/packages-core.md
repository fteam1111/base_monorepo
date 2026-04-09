---
description: API reference for packages/core — error handling, value objects, utils, config, factory/role domains.
paths:
  - "packages/**/*.dart"
  - "lib/**/*.dart"
---
# packages/core — API Reference

> Use `import 'package:core/core.dart';` for everything.

## Error Handling

### `FailureHandler` + `.toApiFailure()`

```dart
// Standard pattern in Repository Implementation:
try {
  final data = await remoteDataSource.fetch();
  return right(data);
} catch (e) {
  return left(e.toApiFailure()); // auto-log + convert
}
```
> **Note**: `FailureHandler` auto-logs the error — no need to call `logger.e()` manually.

### `ApiFailure` (freezed) — 20+ cases

| Case | When |
|---|---|
| `.serverError(message)` | HTTP 500, generic error |
| `.noInternet()` | No network connection |
| `.serverTimeout()` | Timeout (408) |
| `.poorConnection()` | Slow connection |
| `.accountLocked/Blocked/Expired()` | Account restricted |
| `.tokenExpired()` | JWT expired (401) |
| `.refreshTokenInvalid()` | Invalid refresh token |
| `.authenticationFailed()` | Session expired |
| `.invalidEmailAndPasswordCombination()` | Wrong credentials |
| `.cameraPermissionFailed(bool permanentlyDenied)` | Camera permission |
| `.photoPermissionFailed/storagePermissionFailed()` | File permission |
| `.deviceNotSupportBiometric/invalidBiometric()` | Biometric error |
| `.other(message)` | Fallback |

```dart
// In BLoC/Cubit — use .when() for specific cases:
failure.when(
  noInternet: () => emit(State.networkError()),
  tokenExpired: () => emit(State.sessionExpired()),
  orElse: () => emit(State.error(failure.nonTranslatedFailureMessage)),
);
```

### `ValueFailure<T>` — Validation errors

Cases: `exceedingLength`, `subceedLength`, `empty`, `invalidEmail`, `notVinGroupEmail`,
`passwordNotMatchRequirements`, `mustOneUpperCaseCharacter`, `mustOneLowerCaseCharacter`,
`mustOneNumericCharacter`, `mustOneSpecialCharacter`, `invalidVin`, `invalidJWT`, etc.

### Exception classes (Data Layer)

```dart
throw ServerException(code: 404, message: '...');
throw CacheException(message: '...');
throw OtherException(message: '...');
```

### `ErrorMapper` — Manual response mapping

```dart
final failure = ErrorMapper.mapServerError(responseData, statusCode);
final failure = dioException.toApiFailure(); // extension
```

---

## Value Objects

Base: `ValueObject<T>` with `Either<ValueFailure<T>, T> value`.

| Method | Description |
|---|---|
| `.isValid()` | `true` if value is valid |
| `.getOrCrash()` | Get value, throw if invalid |
| `.getOrDefaultValue(T d)` | Get value or fallback |
| `.getValue()` | Get raw value (even if invalid) |
| `.failureOrUnit` | Aggregate validation across multiple fields |

### Available Value Objects

| Class | Use for |
|---|---|
| `JWT(token)` | `.expirationDate`, `.userId`, `.isExpired`, `.remainingTime` |
| `SearchKey.search(text)` | Min 2 chars: `.searchValueOrEmpty`, `.isInvalidSearchKey` |
| `SearchKey.empty()` | Initial search state |
| `DateTimeStringValue(iso)` | `.dateString`, `.dateTime12HoursString`, `.differenceTime`, `.aWeekDifference` |
| `StringValue(text)` | `.displayDashIfEmpty`, `.displayNAIfEmpty`, `.formattedValue` |
| `StringValue.trimmed(text)` | Trimmed non-empty string |
| `RangeValue(str)` | `.doubleValue`, `.intValue`; `checkIfRangeIsValid(from, to)` |
| `IntegerValue(str)` | `.stringValue`, `.isGreaterThanZero` |
| `Language.english/vietnamese()` | `.locale`, `.languageCode` |
| `VinID(vin)` | Validate 17-char VIN with checksum |
| `EmailVinAddress(email)` | Email + validate `@vingroup.net` domain |
| `AppLink(url)` | `.uri`, `.isExampleLink` |

### Validators (standalone functions)

```dart
validateStringNotEmpty(input) / validateTrimmedStringNotEmpty(input)
validateMinStringLength(input, minLength)
validateEmailAddress(input) / validateEmailVinAddress(input)
validatePassword(input)   // A-Z, a-z, 0-9, special chars, 10-20 chars
atLeastOneUpperCharacter(input) / atLeastOneLowerCharacter(input)
atLeastOneNumericCharacter(input) / atLeastOneSpecialCharacter(input)
validateDoubleValue(input) / validateIntegerValue(input)
validateNumberIsBiggerThanZero(double) / validateInputNotExceedMaxValue(input, max)
validateDateString(input) / validateJWT(token) / validateVinID(vin)
```

---

## Utils

### `Debounce` — Delay action (search/input, default 300ms)

```dart
final _debounce = Debounce(delay: const Duration(milliseconds: 500));
onChanged: (v) => _debounce(() => _cubit.search(v)),
// call dispose() in State.dispose()
```

### `Throttle` — Rate-limit action (scroll/button, default 500ms)

```dart
final _throttle = Throttle(duration: const Duration(milliseconds: 1000));
onPressed: () => _throttle.run(() => _cubit.submit()),
// call dispose() in State.dispose()
```

### `logger` — Global PrettyPrinter (auto-off in release)

```dart
logger.d('Debug') / logger.i('Info') / logger.w('Warn')
logger.e('Error', error: e, stackTrace: s)
```
> **Do not** use `print()` or `developer.log()` directly.

### `measureWidget(widget)` -> `Size`

Measures a widget's size without rendering it on screen.

---

## Config & Global Domains

```dart
// BaseConfig (inject via DI):
getIt<BaseConfig>().baseUrl / .defaultPageSize / .flavor / .httpConnectTimeout
// AppFlavor: .dev / .uat / .prod

// Factory & Role — full Clean Architecture already wired, inject via DI:
BlocProvider(create: (_) => getIt<FactoryCubit>()..load())
BlocProvider(create: (_) => getIt<UserRoleCubit>()..load())
final factories = await getIt<GetClientFactoriesUseCase>()(NoParams());
final roles = await getIt<GetClientRolesUseCase>()(NoParams());
```
