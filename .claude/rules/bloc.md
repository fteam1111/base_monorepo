---
description: Rules for implementing Flutter BLoC, Cubit, state management, and Domain Layer interaction.
paths:
  - "**/bloc/**/*.dart"
  - "**/cubit/**/*.dart"
  - "**/presentation/**/*.dart"
---
# Flutter BLoC & Cubit Rules

## 1) Choosing BLoC vs Cubit

- **Cubit**: Use for **simple** screens/features where state changes are synchronous or do not require complex event transformation (debounce, throttle, switchMap).
  - Examples: Toggle switch, Counter, Simple Form, basic data fetch.
- **BLoC**: Use for complex flows that require **Event Transformation** or when state depends on a continuous stream of events.
  - Examples: Search (debounce needed), Authentication (multiple sequential states), Infinite Scroll.

## 2) Roles & Responsibilities (Both BLoC & Cubit)

- **Manages UI State only**: Receives input (Event/method call) from UI, calls Domain Layer, emits new State.
- **No Business Logic**: Business logic must live in **UseCases/Interactors**.
- **Domain Communication**: Should only depend on **UseCases**. For very simple read-only cases, may call a Repository Interface directly.

## 3) File Structure & Naming

### BLoC
- 3 files: `<feature>_bloc.dart`, `<feature>_event.dart`, `<feature>_state.dart`.
- Naming: PascalCase — `FeatureBloc`, `FeatureEvent`, `FeatureState`.

### Cubit
- 2 files: `<feature>_cubit.dart`, `<feature>_state.dart` (no Event file).
- Class: `FeatureCubit` extends `Cubit<FeatureState>`.
- Methods: Public methods instead of Events (e.g. `void login()`, `void refresh()`).

### State (Both)
- Must fully describe the UI state. Prefer `sealed class` (Dart 3) or `freezed`.
- Base states: `Initial`, `Loading`, `Success`, `Failure`.

## 4) Dependency Injection

- Inject **UseCase** via constructor.
- Register in the `DependencyManager` module:
  - `registerFactory`: For screen-scoped Cubit/Bloc (disposed when screen closes).
  - `registerLazySingleton`: For global state.

## 5) Handler Pattern (BLoC)

- Use `on<Event>(_onEvent)`.
- Keep handlers concise: call UseCase and map `Either<Failure, T>` to State.

```dart
// Example BLoC handler
on<FetchDataEvent>(_onFetchData);

Future<void> _onFetchData(FetchDataEvent event, Emitter<FeatureState> emit) async {
  emit(FeatureLoadingState());
  final result = await _fetchDataUseCase(NoParams());
  result.fold(
    (failure) => emit(FeatureErrorState(message: failure.message)),
    (data) => emit(FeatureLoadedState(data: data)),
  );
}
```

## 6) Concrete Either Fold Pattern (ApiFailure)

When UseCase returns `Either<ApiFailure, T>` (from `packages/core`), always use `.fold()`:

```dart
// Cubit — simple fetch
Future<void> loadVehicles() async {
  emit(const VehicleListState.loading());
  final result = await _getVehiclesUseCase(NoParams());
  result.fold(
    (failure) => emit(VehicleListState.failure(failure.nonTranslatedFailureMessage)),
    (vehicles) => emit(VehicleListState.success(vehicles)),
  );
}

// Cubit — specific failure handling
Future<void> login(String username, String password) async {
  emit(const LoginState.loading());
  final result = await _loginUseCase(LoginParams(username, password));
  result.fold(
    (failure) {
      failure.when(
        invalidEmailAndPasswordCombination: () =>
            emit(const LoginState.wrongCredentials()),
        accountLocked: () => emit(const LoginState.accountLocked()),
        noInternet: () => emit(const LoginState.noInternet()),
        orElse: () =>
            emit(LoginState.failure(failure.nonTranslatedFailureMessage)),
      );
    },
    (_) => emit(const LoginState.success()),
  );
}

// BLoC handler
Future<void> _onFetchVehicle(
  FetchVehicleEvent event,
  Emitter<VehicleState> emit,
) async {
  emit(const VehicleState.loading());
  final result = await _getVehicleUseCase(event.vehicleId);
  result.fold(
    (failure) => emit(VehicleState.failure(failure.nonTranslatedFailureMessage)),
    (vehicle) => emit(VehicleState.success(vehicle)),
  );
}
```

> **Do not throw exceptions from BLoC/Cubit.** `ApiFailure.nonTranslatedFailureMessage` returns a pre-processed message for display.
