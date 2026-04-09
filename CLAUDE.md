# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Flutter **monorepo** (Dart workspace + Melos) for the `bike_tracker` customer app. Feature-based **Clean Architecture** — every feature is its own package split into `domain` / `data` / `presentation`.

Flutter is pinned via FVM to **3.35.7**. Use `fvm flutter` / `fvm dart`, not the global toolchain.

## Layout

- `apps/customer_app` — the only app. Composes packages, owns DI (`lib/di/`), routing (`lib/routes/`, go_router), and the three flavor entrypoints `main_dev.dart` / `main_uat.dart` / `main_prod.dart`.
- `packages/features/features_<name>` — one package per feature (auth, dashboard, home, map, vehicle, vehicle_charging, parking_history, parking_location, qr_scanner, delivery_order, splash). Each contains `lib/{domain,data,presentation}`. Features must not depend on other features — share via the packages below.
- `packages/{core,network,local_storage,localization,design_system,share}` — shared infrastructure.

DI uses **get_it + injectable** (codegen). State management is **BLoC**. HTTP is **Dio** in `packages/network`. Routing is **go_router** configured in `apps/customer_app/lib/routes/`.

## Rules & Agents

Detailed conventions live in `.claude/rules/` — loaded automatically when working on matching files:
- `architecture.md` — Clean Architecture layers, DDD, error handling, DI
- `data-layer.md` — DTOs, datasources, repositories, API routes
- `bloc.md` — BLoC vs Cubit, state patterns, Either fold
- `ui-design.md` — Material 3, Design System widgets, context extensions
- `routing.md` — GoRouter, AppRoutes conventions
- `packages-core.md`, `packages-share.md`, `packages-design-system.md` — package API references

Development agents in `.claude/agents/`: `researcher`, `coding`, `qa`, `docs-writer`.
Use `/task "description"` to start any development work (feature, addition, or bug fix).

## Common commands

Setup / workspace:
```bash
make flutter_install     # fvm use 3.35.7 + clean + pub get
melos bootstrap          # pub get across all packages
melos gen                # build_runner codegen for all packages that need it
make clean_ios           # nuke Pods + reinstall (run after iOS dep changes)
```

Static analysis (what `lefthook` runs on pre-push):
```bash
make run_analyze         # melos exec -- fvm flutter analyze --fatal-infos --fatal-warnings
```

Tests — run from inside the package you're testing (there is no repo-wide test target in the Makefile):
```bash
cd packages/features/features_<name> && fvm flutter test
fvm flutter test test/path/to/file_test.dart -n "test name"   # single test
```

Build (per flavor — note Android prod uses gradle flavor `prd`, not `prod`):
```bash
make build_ios_{dev,uat,prod}
make build_android_{dev,uat,prod}
make build_web_{dev,uat,prod}
```

Run a flavor locally:
```bash
cd apps/customer_app && fvm flutter run --flavor dev -t lib/main_dev.dart
```

CD is tag-driven — pushing a tag triggers the GitLab pipeline:
```bash
make tag_uat  VERSION=1.2.3 BUILD=45    # → uat.1.2.3-45
make tag_prod VERSION=1.2.3 BUILD=45    # → prod.1.2.3-45
make revert_tag_uat VERSION=1.2.3 BUILD=45   # delete local + remote if mis-tagged
```

## Hooks (lefthook)

- **pre-commit**: `fvm dart format` on staged `*.dart` (excluding generated `*.freezed.dart`, `*.g.dart`, `*.gr.dart`), then re-stages.
- **pre-push**: `scripts/branch_name_validate.sh` + `make run_analyze`. Don't bypass — fix the analyzer findings instead.

## Docs in-repo worth reading before non-trivial changes

`ARCHITECTURE.md`, `GO_ROUTER_IMPLEMENTATION.md` / `GO_ROUTER_MIGRATION.md`, `GIT_FLOW.md`, `FIREBASE_SETUP.md`, `SET_UP.md`.
