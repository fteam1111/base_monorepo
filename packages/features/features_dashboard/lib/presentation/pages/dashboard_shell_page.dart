import 'package:features_dashboard/presentation/pages/custom_floating_action_button.dart';
import 'package:features_dashboard/presentation/pages/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share/share.dart';

class DashboardShellPage extends StatelessWidget {
  const DashboardShellPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      resizeToAvoidBottomInset: true,
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          AppRoutes.navigateToQrScanner(
            context,
            onVehicleFound: (vehicle) {
              context.pop();
              context.push(AppRoutes.vehicleDetailPath, extra: vehicle);
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigatorBar(
        bottomNavIndex: navigationShell.currentIndex,
        onChange: _onTap,
      ),
    );
  }
}
