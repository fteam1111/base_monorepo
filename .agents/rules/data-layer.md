---
description: Data Layer conventions for DTOs, remote datasources, repositories, API routes, and DI wiring. Apply these rules whenever implementing the data layer of any feature.
---

# Data Layer Conventions

## 1. DTO — Use `freezed` + `@JsonKey`

Every DTO in `data/models/` must use `@freezed`. Do **not** use plain `json_annotation`.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_model_dto.freezed.dart';
part 'vehicle_model_dto.g.dart';

@freezed
abstract class VehicleDto with _$VehicleDto {
  const factory VehicleDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'serial_number') required String serialNumber,
    // Nullable — won't crash if API returns null
    @JsonKey(name: 'exported_at') String? exportedAt,
    // Always present but backend may omit it (backward compat)
    @JsonKey(name: 'storage_days') @Default(0) int storageDays,
  }) = _VehicleDto;

  factory VehicleDto.fromJson(Map<String, Object?> json) =>
      _$VehicleDtoFromJson(json);
}
```

### Null safety rules for DTO fields

| Situation | Declaration |
|---|---|
| Required field, API always returns it | `required T field` |
| Optional field, API may return null | `T? field` (nullable) |
| Always present but backend may omit (legacy) | `@Default(value) T field` |

> ⚠️ **Do not use `@Default` to hide business logic errors.** Only use it when the backend genuinely cannot guarantee the field.

### `pubspec.yaml` for features with DTOs

```yaml
dependencies:
  freezed_annotation: ^3.0.0
  json_annotation: ^4.9.0
  retrofit: ^4.7.3

dev_dependencies:
  freezed: ^3.2.3
  json_serializable: ^6.11.1
  retrofit_generator: ^10.0.6
  build_runner: ^2.9.0
```

---

## 2. Remote DataSource — Use `retrofit` `@RestApi`

Every remote datasource must use `@RestApi` from `retrofit`, placed in `data/datasources/remote/`.

```dart
import 'package:core/model/base_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share/routes/api_routes.dart';
import '../models/vehicle_model_dto.dart';

part 'vehicle_remote_datasource.g.dart';

@RestApi()
abstract class VehicleRemoteDataSource {
  factory VehicleRemoteDataSource(Dio dio, {String baseUrl}) =
      _VehicleRemoteDataSource;

  /// Fetch vehicle info by serial number.
  @GET(ApiRoutes.vehicleBySerial)
  Future<BaseResponse<VehicleDto>> getVehicleBySerial(
    @Path('serialNumber') String serialNumber,
  );
}
```

- Use `@GET`, `@POST`, `@PUT`, `@DELETE` matching the HTTP method
- Use `@Path('key')` for path parameters
- Use `@Query('key')` for query parameters
- Use `@Body()` for request body
- Always wrap responses with `BaseResponse<T>`

---

## 3. Repository Implementation — `e.toApiFailure()`

Use the `e.toApiFailure()` extension method from `core`. **Do not** manually map `DioException`.

```dart
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  VehicleRepositoryImpl(this._dataSource);

  final VehicleRemoteDataSource _dataSource;

  @override
  Future<Either<ApiFailure, VehicleEntity>> getVehicleBySerial(
    String serialNumber,
  ) async {
    try {
      final result = await _dataSource.getVehicleBySerial(serialNumber);
      final data = result.data;
      if (data == null) {
        return const Left(ApiFailure.other('Vehicle not found'));
      }
      return Right(data.toEntity());
    } on Exception catch (e, s) {
      logger.e('Error fetching vehicle: $serialNumber', error: e, stackTrace: s);
      return Left(e.toApiFailure()); // ✅ Extension from core
    }
  }
}
```

> ❌ **Do not do:** `on DioException catch (e) { switch(e.type) { ... } }`

---

## 4. API Path — Declare in `share/lib/routes/api_routes.dart`

All API paths must be declared centrally in `ApiRoutes`. **Do not** hardcode paths in datasources.

```dart
class ApiRoutes {
  static const String v1 = '/api/v1';
  static const String clientType = '/client';

  // ✅ Grouped by domain
  static const String _vehicles = '$v1$clientType/vehicles';

  // Constant for paths without parameters
  static const String getVehicles = _vehicles;

  // Constant with Retrofit path parameter syntax
  static const String vehicleBySerial = '$_vehicles/by-serial/{serialNumber}';
}
```

> **Retrofit note:** Use `{paramName}` in the constant and `@Path('paramName')` in the datasource method.

---

## 5. BlocProvider — Wire in `app_router.dart` using `locator<X>()`

All `Cubit`/`BLoC` instances must be provided via `BlocProvider` in `app_router.dart`
using `locator<X>()` from `get_it`. **Do not** instantiate them manually in the router.

```dart
// app_router.dart
GoRoute(
  path: AppRoutes.qrScannerPath,
  name: AppRoutes.qrScanner,
  pageBuilder: (context, state) => _buildPageWithTransition(
    key: state.pageKey,
    name: AppRoutes.qrScanner,
    child: BlocProvider(
      create: (_) => locator<QrScanCubit>(), // ✅ From locator
      child: const QrScannerPage(),
    ),
  ),
),
```

Register in `dependency_manager.dart`:

| Type | Registration |
|---|---|
| Cubit/BLoC (screen-scoped) | `registerFactory` |
| Service/Repository (global) | `registerLazySingleton` |

---

## Code Generation

After modifying any DTO or datasource, ask the user before running:

```bash
melos gen_all
# or for watch mode:
melos gen_watch
```
