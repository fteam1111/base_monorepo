---
name: feature-flow
description: Full development workflow for this Flutter monorepo — research → plan → code (Domain → Data → Presentation → Wiring) → verify → tests → SPEC.md. Use whenever implementing a new feature, fixing a non-trivial bug, or making significant changes in any `packages/features/features_*` package.
---

# Feature Flow

Execute the 6 phases below in order. The conventions referenced (architecture, data-layer, BLoC, UI, routing) all live in nested `CLAUDE.md` files (`packages/features/CLAUDE.md`, `packages/core/CLAUDE.md`, `packages/share/CLAUDE.md`, `packages/design_system/CLAUDE.md`, `apps/customer_app/CLAUDE.md`) — Claude Code auto-loads them when you work in those folders.

## Phase 1 — Research & Understand
1. Clarify scope (new feature / bug fix / refactor).
2. Find a similar feature as a reference (e.g. `features_auth` for the data layer).
3. Identify affected files and required dependencies.

## Phase 2 — Plan & Confirm
1. Write/update `implementation_plan.md` with: Problem + Solution, Proposed Changes per layer (Domain → Data → Presentation), Verification Plan.
2. Send the plan to the user and **get approval before any coding**.
3. Iterate on feedback.

## Phase 3 — Execution (dependency order, inner layers first)

### 3.1 Domain (no Flutter deps)
- [ ] Entities (`domain/entities/`)
- [ ] Value Objects (`domain/values/`)
- [ ] Repository interfaces (`domain/repositories/`)
- [ ] Use Cases (`domain/usecases/`)

### 3.2 Data
- [ ] DTOs with `@freezed` + `@JsonKey` (`data/models/`)
- [ ] Remote DataSource with retrofit `@RestApi` (`data/datasources/remote/`)
- [ ] Mappers DTO → Entity (`data/mappers/`)
- [ ] Repository implementation (`data/repositories/`) — use `e.toApiFailure()` from `core`
- [ ] Add API path to `packages/share/lib/routes/api_routes.dart`

### 3.3 Presentation
- [ ] Sealed State (`presentation/cubit/*_state.dart`)
- [ ] Cubit/BLoC (`*_cubit.dart` or `*_bloc.dart`) — see `packages/features/CLAUDE.md` for BLoC vs Cubit
- [ ] Widgets (`presentation/widgets/`) — prefer Design System widgets first
- [ ] Page (`presentation/pages/`)

### 3.4 Wiring & Config
- [ ] `pubspec.yaml` — declare dependencies
- [ ] `lib/<feature>.dart` — update library exports
- [ ] `apps/customer_app/lib/di/dependency_manager.dart` — `registerFactory` for Cubit/BLoC, `registerLazySingleton` for repos/services
- [ ] `apps/customer_app/lib/routes/app_router.dart` — add `GoRoute` with `BlocProvider(create: (_) => locator<X>())`
- [ ] `packages/share/lib/routes/app_routes.dart` — add `name` + `<name>Path` constants and a `navigateToX(context)` helper

## Phase 4 — Verification
1. `melos bootstrap`
2. **Ask the user before** running `melos gen_all` or `melos gen_watch`. If you need codegen yourself, prefer the ordered `melos run gen`.
3. `dart analyze <package_path>` — fix and re-run until clean.

## Phase 5 — Tests (scope: use cases + widgets ONLY)
Do **not** test BLoC/Cubit state machines, DataSources, or Repositories.

- `test/domain/` — unit tests for Use Cases and Value Objects, using **fake** repository implementations (no mocks).
- `test/presentation/` — widget tests injecting the cubit via `BlocProvider.value` and emitting states manually.

```dart
final class _FakeRepo implements FeatureRepository {
  _FakeRepo(this._result);
  final Either<ApiFailure, Entity> _result;
  @override
  Future<Either<ApiFailure, Entity>> fetchData(String id) async => _result;
}
```

Run: `flutter test packages/features/<feature_name>/test/`.

## Phase 6 — SPEC.md
Create `packages/features/<feature_name>/SPEC.md` with: Overview, User Flow, Architecture (dir tree), API (endpoint + route constant + response model), States table, Validation, DI & Routing, Tests, Dependencies.

---

## Hard rules (always)
- Never run `melos gen_all` / `melos gen_watch` without asking the user first.
- Never rename or refactor files widely without approval.
- Use `logger.d/i/w/e(error: e, stackTrace: s)` from `core` — never `developer.log` or `print`.
- Plan must be approved before any code is written.
- Features must not depend on other features.
