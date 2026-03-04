# features_vehicle_charging

## Overview

This feature allows users to view a list of vehicles currently in the charging area and request a vehicle to be moved to the charging station. Features include pagination, pull-to-refresh, VIN searching, and displaying vehicle aging statuses.

---

## User Flow

1. User navigates to the Vehicle Charging screen.
2. An API request fetches the initial list of vehicles in the charging area.
3. **List Interaction**:
   - Scroll down to load more vehicles (pagination).
   - Pull-to-refresh to reload the list.
   - Use the search bar to filter vehicles by VIN.
4. **Action Interaction**:
   - Tap "Yêu cầu bảo dưỡng" (Maintenance Request) on a vehicle card.
   - A dialog opens displaying vehicle details (VIN, Aging days) and the "Chuyển sạc" (Move to charge) button.
   - Tap "Chuyển sạc" to trigger an API request and navigate to the discharge result page.
   - The Discharge Result screen displays either success or failure and offers actions to retry or return.

---

## Architecture

```
features_vehicle_charging/
├── domain/
│   ├── entities/vehicle_charging_entity.dart         # VehicleChargingEntity
│   ├── repositories/vehicle_charging_repository.dart # Interface
│   └── usecases/
│       ├── get_vehicle_charging_list_usecase.dart    # Fetch list
│       └── send_for_discharging_usecase.dart         # Submit action
│
├── data/
│   ├── models/vehicle_charging_dto.dart              # @freezed DTOs
│   ├── datasources/remote/vehicle_charging_remote_datasource.dart  # @RestApi retrofit
│   ├── mappers/vehicle_charging_mapper.dart          # DTO → Entity mappings
│   └── repositories/vehicle_charging_repository_impl.dart
│
└── presentation/
    ├── bloc/
    │   ├── vehicle_charging_bloc.dart                # VehicleChargingBloc
    │   ├── vehicle_charging_event.dart               # Sealed events
    │   └── vehicle_charging_state.dart               # State data holder
    ├── pages/
    │   ├── vehicle_charging_page.dart                # Main list page
    │   └── discharging_result_page.dart              # Result page
    └── widgets/
        ├── charging_info_dialog.dart                 # Info dialog
        ├── vehicle_charging_list.dart                # ScrollList display
        └── vehicle_charging_search_bar.dart          # Search bar
```

---

## API

| Method | Path | Description |
|---|---|---|
| `GET` | `/api/v1/client/vehicles/by-status/in-charge` | Fetch paginated vehicles in the charging area |
| `POST` | `/api/v1/client/vehicles/{vehicleId}/discharging` | Send vehicle to charging station (discharging request) |

**Route constants:** `ApiRoutes.vehiclesInCharge`, `ApiRoutes.vehiclesDischarging` (`packages/share/lib/routes/api_routes.dart`)

**Response models:** `PaginationResponse<VehicleChargingDto>`, `BaseResponse<VehicleChargingDto>`

---

## States (VehicleChargingState)

This feature uses a single data holder class with `copyWith` (not sealed states) because the UI needs to retain the existing list of vehicles while paginating or searching.

| Status Property | Value | UI Impact |
|---|---|---|
| `status` | `initial` / `loading` (page 1) | Shimmer loading indicator |
| `status` | `loading` (page \> 1) | Loading indicator at list bottom |
| `status` | `success` | Displays `ScrollList` with vehicle cards |
| `status` | `failure` | Error text displayed |
| `dischargeStatus` | `loading` | Discharging API is in progress |
| `dischargeStatus` | `success` | Result page shows tick mark and success message |
| `dischargeStatus` | `failure` | Result page shows cross mark and error message |

---

## Validation

None needed; this feature primarily reads data and triggers simple ID-based POST requests.

---

## DI & Routing

**Dependency Manager** (`apps/customer_app/lib/di/dependency_manager.dart`):
- `VehicleChargingRemoteDataSource` — `registerLazySingleton`
- `VehicleChargingRepository` → `VehicleChargingRepositoryImpl` — `registerLazySingleton`
- `GetVehicleChargingListUseCase` — `registerLazySingleton`
- `SendForDischargingUseCase` — `registerLazySingleton`
- `VehicleChargingBloc` — `registerFactory` (screen-scoped)

**Router** (`apps/customer_app/lib/routes/app_router.dart`):
```dart
GoRoute(
  path: AppRoutes.vehicleChargingPath,
  name: AppRoutes.vehicleCharging,
  pageBuilder: (context, state) => _buildPageWithTransition(
    child: BlocProvider(
      create: (_) => locator<VehicleChargingBloc>(),
      child: const VehicleChargingPage(),
    ),
  ),
),
GoRoute(
  path: AppRoutes.dischargingResultPath,
  name: AppRoutes.dischargingResult,
  pageBuilder: (context, state) {
    final vehicle = state.extra as VehicleChargingEntity;
    return _buildPageWithTransition(
      child: BlocProvider.value(
        value: locator<VehicleChargingBloc>(), // Shared bloc instance if requested
        child: DischargingResultPage(vehicle: vehicle),
      ),
    );
  },
),
```

---

## Tests

| File | Scope |
|---|---|
| `test/domain/get_vehicle_charging_list_usecase_test.dart` | Success, failure, and arg passing |
| `test/domain/send_for_discharging_usecase_test.dart` | Success, failure, and arg passing |
| `test/presentation/vehicle_charging_page_test.dart` | Widget: mock bloc, initial load, error state, empty state, and populated list rendering |
| `test/presentation/discharging_result_page_test.dart` | Widget: mock bloc, success & failure states, retry & back actions |

**Not tested:** `VehicleChargingBloc`, `VehicleChargingRemoteDataSource`, `VehicleChargingRepositoryImpl`.

---

## Dependencies

| Package | Purpose |
|---|---|
| `retrofit` | Declarative HTTP client |
| `freezed` | Immutable DTOs |
| `flutter_bloc` | State management |
| `dartz` | `Either<ApiFailure, T>` error handling |
| `bloc_concurrency` | Droppable transformer for load-more requests |
