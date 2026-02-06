# Cursor Project Rules — bike_tracker (Flutter Monorepo)

## Project Context

- This repository is a **Flutter monorepo** (Dart/Flutter workspace + Melos).
- Main app:
  - `apps/customer_app`
- Shared packages:
  - `packages/core`
  - `packages/network`
  - `packages/local_storage`
  - `packages/localization`
  - `packages/design_system`
  - `packages/share`
- Feature packages:
  - `packages/features/*` (e.g. `features_auth`, `features_dashboard`, `features_home`, `features_find_bike`, ...)
- Routing:
  - `go_router`
  - Tabs use `StatefulShellRoute.indexedStack`
- State management:
  - `flutter_bloc`
- DI:
  - `get_it` + `injectable`
  - Dependency registration is centralized in `apps/customer_app/lib/di/dependency_manager.dart`.

---

## 1) Architecture & SOLID

- **Layer boundaries (Clean Architecture)**
  - `presentation` must **not** import `data` directly.
  - `domain` must **not** import Flutter/UI (`material.dart`, widgets, `flutter_bloc`, `go_router`).
  - `data` may depend on `domain` and shared packages.

- **DIP (Dependency Inversion)**
  - `domain` depends on abstractions (repository interfaces).
  - `data` implements those interfaces.

- **Feature isolation**
  - Feature packages must **not** import other feature packages.
  - Shared entities/value objects go to `packages/core`.
  - Shared helpers/constants/routes/extensions go to `packages/share`.

- **DTO vs Entity separation**
  - DTO/model (`*Dto`, `*Model`) lives in `data/models`.
  - Entity lives in `domain/entities`.
  - Mapping between DTO ↔ Entity must live in `data/mappers`.

---

## 2) File Placement Conventions (match this repo)

- **Presentation**
  - Pages: `packages/features/<feature>/lib/presentation/pages/`
  - Widgets: `packages/features/<feature>/lib/presentation/widgets/`
  - Bloc/Cubit: `packages/features/<feature>/lib/presentation/bloc/` or `.../presentation/cubit/`

- **Domain**
  - Entities: `.../domain/entities/`
  - Repository interfaces: `.../domain/repositories/`
  - Use cases: `.../domain/usecases/`

- **Data**
  - Remote DS: `.../data/datasources/remote/`
  - Local DS: `.../data/datasources/local/`
  - DTO/Models: `.../data/models/`
  - Mappers: `.../data/mappers/`
  - Repository impl: `.../data/repositories/`

---

## 3) Routing Rules (go_router)

- **Single source of truth** for route names/paths/params:
  - `packages/share/lib/routes/app_routes.dart`

- **Router config location**:
  - `apps/customer_app/lib/routes/app_router.dart`

- **Tabs**:
  - Use `StatefulShellRoute.indexedStack`.
  - The shell widget lives in a feature package, but route wiring and guards stay in the app router.

- **No navigation in Domain**:
  - Domain code must never call `context.go`, `GoRouter`, or `AppRoutes`.

---

## 4) DI Rules (get_it + injectable)

- **Dependency registration** happens in:
  - `apps/customer_app/lib/di/dependency_manager.dart`

- **Presentation injection**:
  - Bloc/Cubit should be provided from the app layer (router/builders), not created ad-hoc inside pages (except very local widgets).

- **No service locator in Domain**:
  - Domain layer must not call `locator<T>()`.

---

## 5) Codegen / Generated Files

- Never manually edit generated files:
  - `*.g.dart`, `*.freezed.dart`, `injector.config.dart`
- If codegen output is wrong, update the source files and rerun build_runner (ask user before running commands).

---

## 6) Safety & Scope

- No mass refactors (rename/move lots of files) unless explicitly requested.
- Do not run potentially destructive or stateful commands (Melos bootstrap, build_runner, pod install, etc.) without user approval.
- Keep changes minimal and within the requested scope.

---

## 7) Coding Conventions

- **Naming**
  - Entity: `*Entity`
  - DTO: `*Dto`
  - Repository: `*Repository` (domain) and `*RepositoryImpl` (data)
  - Mapper: `*Mapper` or `extension ... { toEntity() }`

- **Error handling**
  - Data layer returns `Either<ApiFailure, T>` (as used in this repo).

- **Tokens**
  - Domain uses `JWT` (ValueObject) once parsed/wrapped.
  - Infrastructure/storage persists `String` (`jwt.getValue()` when saving).

---

## Assistant Behavior (Workflow)

When implementing a new screen/feature:

- Confirm which **feature package** it belongs to.
- Confirm which **route name/path** needs to be added in `AppRoutes`.
- List files that will be modified before making wide changes.
- Prefer editing existing code over introducing new files.
- Do not dump large code blocks in chat unless explicitly requested.
