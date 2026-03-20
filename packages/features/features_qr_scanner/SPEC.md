# Spec: features_qr_scanner

## Overview

This feature lets users scan a QR/barcode to retrieve vehicle information
by serial number (VIN).

---

## User Flow

1. User opens the QR Scanner screen
2. Camera starts — scanner continuously scans
3. When a barcode is detected:
   - **Invalid VIN** → Error SnackBar + camera continues
   - **Valid VIN** → API call → loading overlay
     - **API success** → `onVehicleFound(serial)` callback → caller navigates
     - **API error** → Error SnackBar + "Retry" button → camera resumes

---

## Architecture

```
features_qr_scanner/
├── domain/
│   ├── entities/vehicle_entity.dart         # VehicleEntity, VehicleFactoryEntity, ParkingLotEntity, ParkingZoneEntity
│   ├── repositories/vehicle_repository.dart # VehicleRepository (interface)
│   └── usecases/get_vehicle_by_serial_usecase.dart
│
├── data/
│   ├── models/vehicle_model_dto.dart        # @freezed DTOs
│   ├── datasources/remote/vehicle_remote_datasource.dart  # @RestApi retrofit
│   ├── mappers/vehicle_mapper.dart          # DTO → Entity extensions
│   └── repositories/vehicle_repository_impl.dart
│
└── presentation/
    ├── cubit/qr_scan_cubit.dart             # QrScanCubit
    ├── cubit/qr_scan_state.dart             # sealed QrScanState
    └── pages/qr_scanner_page.dart           # QrScannerPage
```

---

## API

| Method | Path | Description |
|---|---|---|
| `GET` | `/api/v1/client/vehicles/by-serial/{serialNumber}` | Fetch vehicle info by VIN |

**Route constant:** `ApiRoutes.vehicleBySerial` (`packages/share/lib/routes/api_routes.dart`)

**Response model:** `BaseResponse<VehicleDto>`

---

## States (QrScanState)

| State | When | UI |
|---|---|---|
| `QrScanInitial` | On init / after reset | Camera scanning |
| `QrScanLoading` | API call in progress | Semi-transparent loading overlay |
| `QrScanInvalidVin` | VIN fails `VinID.isValid()` | Error SnackBar with message |
| `QrScanSuccess` | API returns data | `onVehicleFound` callback triggered |
| `QrScanFailure` | API error | Error SnackBar + "Retry" button |

---

## Validation

Uses the `VinID` Value Object from `packages/core/lib/value/value_objects.dart`:

```dart
final vinId = VinID(rawValue);
if (!vinId.isValid()) { /* invalid */ }
```

---

## DI & Routing

**Dependency Manager** (`apps/customer_app/lib/di/dependency_manager.dart`):
- `VehicleRemoteDataSource` — `registerLazySingleton`
- `VehicleRepository` → `VehicleRepositoryImpl` — `registerLazySingleton`
- `GetVehicleBySerialUseCase` — `registerLazySingleton`
- `QrScanCubit` — `registerFactory` (screen-scoped)

**Router** (`apps/customer_app/lib/routes/app_router.dart`):
```dart
GoRoute(
  path: AppRoutes.qrScannerPath,
  name: AppRoutes.qrScanner,
  pageBuilder: (context, state) => _buildPageWithTransition(
    child: BlocProvider(
      create: (_) => locator<QrScanCubit>(),
      child: const QrScannerPage(),
    ),
  ),
),
```

---

## Tests

| File | Scope |
|---|---|
| `test/domain/get_vehicle_by_serial_usecase_test.dart` | Use case: success, failure, argument passing; VinID validation |
| `test/presentation/qr_scanner_page_test.dart` | Widget: initial state, loading overlay, SnackBar, `onVehicleFound` callback |

**Not tested:** `QrScanCubit`, `VehicleRemoteDataSource`, `VehicleRepositoryImpl`.

---

## Dependencies

| Package | Purpose |
|---|---|
| `mobile_scanner` | Camera + barcode detection |
| `retrofit` | Declarative HTTP client |
| `freezed` | Immutable DTOs |
| `flutter_bloc` | State management |
| `dartz` | `Either<ApiFailure, T>` error handling |
