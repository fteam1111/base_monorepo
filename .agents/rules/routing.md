---
trigger: always_on
glob:
description: Navigation and routing rules using GoRouter.
---
# Routing Rules (GoRouter)

## 1) Single Source of Truth

- Route names, paths, and parameters are defined in `packages/share/lib/routes/app_routes.dart`.
- Router configuration is in `apps/customer_app/lib/routes/app_router.dart`.

## 2) Navigation Rules

- **Tabs**: Use `StatefulShellRoute.indexedStack`.
- **No navigation in Domain**: The Domain layer must never call `context.go`, `GoRouter`, or `AppRoutes`.
