---
description: API reference for packages/share — context extensions, button styles, widget extensions, AppRoutes, Firebase, connectivity.
paths:
  - "packages/**/*.dart"
  - "lib/**/*.dart"
---
# packages/share — API Reference

> Use `import 'package:share/share.dart';` for everything.

## ContextExtension — MUST use, do NOT call Flutter APIs directly

### Theme & Design Tokens

| Getter | Replaces |
|---|---|
| `context.theme` | `Theme.of(context)` |
| `context.textTheme` | `Theme.of(context).textTheme` |
| `context.colorScheme` | `Theme.of(context).colorScheme` |
| `context.appColors` | `theme.extension<AppColorsExtension>()` |
| `context.appSpacing` | `theme.extension<AppSpacingExtension>()` |
| `context.appRadius` | `theme.extension<AppRadiusExtension>()` |
| `context.appTypography` | `theme.extension<AppTypographyExtension>()` |
| `context.l10n` | `AppLocalizations.of(context)!` |

### Layout & Responsive

| Getter | Description |
|---|---|
| `context.screenWidth / screenHeight` | Screen dimensions |
| `context.statusBarHeight` | Top safe area |
| `context.bottomPadding` | Bottom safe area |
| `context.topPadding / verticalPadding / horizontalPadding` | Safe area composites |
| `context.isKeyboardVisible` | `bool` — keyboard is open |
| `context.keyboardHeight` | `double` — keyboard height |
| `context.isSmallScreen` | `< 600px` (mobile) |
| `context.isMediumScreen` | `600-1024px` (tablet) |
| `context.isLargeScreen` | `>= 1024px` (desktop) |
| `context.isPortrait / isLandscape` | Orientation |
| `context.locale / languageCode` | Current locale |

### Focus

```dart
context.unfocus()            // dismiss keyboard
context.requestFocus(node)   // focus a FocusNode
```

---

## Button Styles

```dart
ElevatedButton(style: context.primaryButtonStyle, ...)   // primary, elevation 2, radius 12
ElevatedButton(style: context.secondaryButtonStyle, ...) // secondary color
```

---

## Widget Extensions (SliverWidget)

```dart
myWidget.toSliverNoPadding()                           // SliverToBoxAdapter
myWidget.toSliverPadding(padding: EdgeInsets.all(16))  // SliverPadding
```

---

## AppRoutes — Navigation

> **Rule**: Always use `AppRoutes.*`. Never call `context.go()` / `context.push()` directly.

```dart
// Available helpers:
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
AppRoutes.canPop(context)  // bool

// Generic (when a helper doesn't exist yet):
AppRoutes.goNamed(context, AppRoutes.home, pathParameters: {'id': '1'})
AppRoutes.pushNamed(context, AppRoutes.vehicleDetail, extra: data)
```

### Route Names & Paths

| Name | Path |
|---|---|
| `AppRoutes.splash` | `/` |
| `AppRoutes.login` | `/login` |
| `AppRoutes.dashboard` | `/dashboard` |
| `AppRoutes.home` | `/home` |
| `AppRoutes.vehicleDetail` | `/vehicle-detail` |
| `AppRoutes.qrScanner` | `/qr_scanner` |
| `AppRoutes.factoryMap` | `/factory-map` |
| `AppRoutes.vehicleCharging` | `/vehicle-charging` |
| `AppRoutes.doList` | `/do-list` |
| `AppRoutes.doDetail` | `/do-detail` |
| `AppRoutes.parkingHistory` | `/parking-history` |

---

## Other Services

- `ConnectivityService` — network state monitoring
- `PermissionService` — request camera/storage/photo permissions
- `PushNotificationService` — FCM token, foreground/background handling
- `AppAnalytics` — Firebase Analytics events
- `AppCrashlytics` — Firebase Crashlytics logging
- `RemoteConfig` — Firebase Remote Config with `RemoteConfigConstants`
- `MyBlocObserver` — global BLoC observer (debug transitions)
- `MyNavigatorObserver` — Navigator observer (screen tracking)
- `DeepLinkingService` — deep link handling
- `AppConstants.apiTimeout`, `.defaultPageSize`, `.dateFormatApi`
