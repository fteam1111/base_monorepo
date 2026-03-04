---
trigger: always_on
glob:
description: Navigation and routing rules using GoRouter and AppRoutes.
---
# Routing Rules (GoRouter)

## 1) Single Source of Truth

- Route names, paths, and parameters are defined in `packages/share/lib/routes/app_routes.dart`.
- Router configuration is in `apps/customer_app/lib/routes/app_router.dart`.

## 2) Navigation Rules

- **Tabs**: Use `StatefulShellRoute.indexedStack`.
- **No navigation in Domain**: The Domain layer must never call `context.go`, `GoRouter`, or `AppRoutes`.

## 3) Use AppRoutes — Không gọi context.go() trực tiếp

```dart
import 'package:share/share.dart';

// ✅ Đúng — dùng helper có sẵn
AppRoutes.navigateToDashboard(context)
AppRoutes.navigateToLogin(context)
AppRoutes.navigateToHome(context)
AppRoutes.navigateToVehicleDetail(context)
AppRoutes.navigateToChooseParkingLocation(context)
AppRoutes.navigateToVehicleCharging(context)
AppRoutes.navigateToDeliveryOrderList(context)
AppRoutes.navigateToDeliveryOrderDetail(context)
AppRoutes.navigateToFactoryMap(context)
AppRoutes.navigateToQrScanner(context)
AppRoutes.navigateBack(context)
AppRoutes.canPop(context)   // bool

// Generic (khi helper chưa có):
AppRoutes.goNamed(context, AppRoutes.home)
AppRoutes.pushNamed(context, AppRoutes.vehicleDetail, extra: vehicleData)
AppRoutes.goNamed(context, AppRoutes.home, pathParameters: {'id': '123'})

// ❌ Sai — gọi trực tiếp mà không qua AppRoutes
context.go('/dashboard')
context.push('/vehicle-detail')
```

## 4) Route Names & Paths — Reference

| Name Constant | Path Constant | Value |
|---|---|---|
| `AppRoutes.splash` | `AppRoutes.splashPath` | `'/'` |
| `AppRoutes.login` | `AppRoutes.loginPath` | `'/login'` |
| `AppRoutes.dashboard` | `AppRoutes.dashboardPath` | `'/dashboard'` |
| `AppRoutes.home` | `AppRoutes.homePath` | `'/home'` |
| `AppRoutes.vehicleDetail` | `AppRoutes.vehicleDetailPath` | `'/vehicle-detail'` |
| `AppRoutes.qrScanner` | `AppRoutes.qrScannerPath` | `'/qr_scanner'` |
| `AppRoutes.factoryMap` | `AppRoutes.factoryMapPath` | `'/factory-map'` |
| `AppRoutes.vehicleCharging` | `AppRoutes.vehicleChargingPath` | `'/vehicle-charging'` |
| `AppRoutes.doList` | `AppRoutes.doListPath` | `'/do-list'` |
| `AppRoutes.doDetail` | `AppRoutes.doDetailPath` | `'/do-detail'` |
| `AppRoutes.parkingHistory` | `AppRoutes.parkingHistoryPath` | `'/parking-history'` |
