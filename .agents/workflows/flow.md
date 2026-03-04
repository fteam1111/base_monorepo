---
description: Full development workflow — from planning to coding. Apply this flow whenever implementing a new feature, fixing a bug, or making significant changes.
---

# Full Development Flow

## Phase 1: Research & Understand

1. Read the requirements carefully and clarify scope (new feature, bug fix, or refactor?)
2. Check Knowledge Items (KI) and relevant conversation logs
3. Explore the existing codebase:
   - Find a similar feature/package as a reference (e.g. `features_auth` for data layer)
   - Read related rules in `.agents/rules/`
   - Identify files that will be affected
4. Identify required dependencies (external packages, internal packages)

---

## Phase 2: Planning — Propose & Confirm Solution

1. Create/update `implementation_plan.md` with the following sections:
   - **Problem description** and proposed solution
   - **Proposed Changes** — list files to create/modify/delete per layer (Domain → Data → Presentation)
   - **Verification Plan** — how to validate after implementation
2. Send the plan for user review using `notify_user` with `BlockedOnUser: true`
3. Iterate if the user has feedback — update the plan, re-request review
4. **Only start coding once the user has approved**

---

## Phase 3: Execution — Coding

Follow dependency order (inner layers first):

### Step 3.1 — Domain Layer (no external dependencies)
- [ ] Entities (`domain/entities/`)
- [ ] Repository Interface (`domain/repositories/`)
- [ ] Use Cases (`domain/usecases/`)

### Step 3.2 — Data Layer
- [ ] DTOs using `@freezed` + `@JsonKey` (`data/models/`)
- [ ] Remote DataSource using `@RestApi` retrofit (`data/datasources/remote/`)
- [ ] Mappers DTO → Entity (`data/mappers/`)
- [ ] Repository Implementation (`data/repositories/`)
- [ ] Add API route to `share/lib/routes/api_routes.dart`

### Step 3.3 — Presentation Layer
- [ ] State class (sealed) (`presentation/cubit/*_state.dart`)
- [ ] Cubit/BLoC (`presentation/cubit/*_cubit.dart` or `*_bloc.dart`)
- [ ] Small widgets (`presentation/widgets/`)
- [ ] Page (`presentation/pages/`)

### Step 3.4 — Wiring & Config
- [ ] `pubspec.yaml` — add dependencies
- [ ] `lib/<feature>.dart` — update library exports
- [ ] `dependency_manager.dart` — register DI (`registerFactory` for Cubit/BLoC, `registerLazySingleton` for repos/services)
- [ ] `app_router.dart` — add route + `BlocProvider(create: (_) => locator<X>())`

---

## Phase 4: Verification

// turbo
1. Sync dependencies across the monorepo:
   ```bash
   melos bootstrap
   ```

2. Ask the user before running code generation (choose one):
   ```bash
   # Run once
   melos gen_all

   # Or watch mode during active development
   melos gen_watch
   ```

// turbo
3. Run static analysis:
   ```bash
   dart analyze <package_path>
   ```

4. If errors found → go back to Phase 3 to fix → re-run analyze

5. Run tests (scope: use cases + widgets — **do not** test bloc/datasource):
   ```bash
   flutter test packages/features/<feature_name>/test/
   ```

   **Test conventions:**
   - `test/domain/` — unit tests for Use Cases, Value Objects (use fake repos, no mocks)
   - `test/presentation/` — widget tests for Pages (inject cubit via `BlocProvider.value`, emit states manually)
   - No need to test Bloc/Cubit state machines, DataSources, or Repositories

---

## Phase 5: Write Tests

Write tests after the feature is stable (analysis passes).

**Scope: use cases + widgets only. Do not test Bloc/Cubit, DataSource, or Repository.**

### Step 5.1 — Domain Tests (`test/domain/`)
- [ ] Unit test each Use Case: success, failure, argument passing
- [ ] Unit test Value Objects: valid/invalid inputs
- Pattern: use **fake** repository implementations — no mocks needed

```dart
final class _FakeRepo implements FeatureRepository {
  _FakeRepo(this._result);
  final Either<ApiFailure, Entity> _result;

  @override
  Future<Either<ApiFailure, Entity>> fetchData(String id) async => _result;
}
```

### Step 5.2 — Widget Tests (`test/presentation/`)
- [ ] Page renders correctly in initial state
- [ ] Loading overlay appears when `Loading` state is emitted
- [ ] SnackBar shown on `Failure` / invalid input states
- [ ] Success callback triggered on `Success` state
- Pattern: inject cubit via `BlocProvider.value`, emit states manually

```dart
await tester.pumpWidget(
  MaterialApp(
    home: BlocProvider<FeatureCubit>.value(
      value: cubit,
      child: const FeaturePage(),
    ),
  ),
);
cubit.emit(const FeatureFailure('Error message'));
await tester.pumpAndSettle();
expect(find.byType(SnackBar), findsOneWidget);
```

// turbo
Run tests:
```bash
flutter test packages/features/<feature_name>/test/
```

---

## Phase 6: Create SPEC.md

After the feature is complete and tests pass, create `SPEC.md` at the root of the feature package:

```
packages/features/<feature_name>/SPEC.md
```

Include the following sections:
- **Overview** — what the feature does in 1–2 sentences
- **User Flow** — step-by-step user interaction with error/success branches
- **Architecture** — directory tree of the feature's file structure
- **API** — endpoint, HTTP method, route constant, response model
- **States** — table of all Cubit/BLoC states and their UI impact
- **Validation** — any Value Objects used and how
- **DI & Routing** — registration in `dependency_manager.dart` and `app_router.dart`
- **Tests** — table of test files and their scope
- **Dependencies** — packages used and their purpose

---

## Conventions to Remember

- See `.agents/rules/data-layer.md` for all data layer conventions
- See `.agents/rules/architecture.md` for monorepo structure
- See `.agents/rules/bloc.md` for when to use BLoC vs Cubit
- See `.agents/rules/routing.md` for routing conventions
- **Never run `melos gen_all` / `melos gen_watch` without asking the user first**
- **Never rename/refactor files widely without approval**
- Use `logger.d/i/w/e(error: e, stackTrace: s)` from `core` — never use `developer.log` or `print`
