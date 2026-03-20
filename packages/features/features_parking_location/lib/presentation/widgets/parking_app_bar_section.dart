import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ParkingAppBarSection extends StatelessWidget
    implements PreferredSizeWidget {
  const ParkingAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      centerTitle: false,
      title: context.l10n.chooseParkingLocation,
      subtitle: context.l10n.businessAreaClassification,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
