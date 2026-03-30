<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# features_vehicle_charging

Vehicle Charging Feature Package. Allows the client app to visualize which vehicles are currently inside the charging area, view aging times, and initiate discharging requests on specific vehicles.

## Features

- View list of vehicles in the charging area with aging statuses.
- Real-time search by VIN using a debounce feature.
- Pull down to refresh and scroll down to paginate the list.
- Make maintenance or discharging requests directly from the app.

## Getting started

Add the package dependency in your pubspec and ensure it aligns with the overall `clean_architecture` monorepo structure. Ensure your dependencies on `core`, `design_system`, and `share` are configured.

## Usage

Register the routes and bloc providers in your main application module as per `SPEC.md`.

```dart
// Example routing setup:
GoRoute(
  path: AppRoutes.vehicleChargingPath,
  name: AppRoutes.vehicleCharging,
  pageBuilder: (context, state) => _buildPageWithTransition(
    child: BlocProvider(
      create: (_) => locator<VehicleChargingBloc>(),
      child: const VehicleChargingPage(),
    ),
  ),
)
```

## Additional information

For a deeper dive into the architecture, component states, and validation rules for this specific module, please refer to the adjoining `SPEC.md` inside this package directory.
