import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class MapControlPanelSection extends StatelessWidget {
  const MapControlPanelSection({
    super.key,
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onReset,
  });

  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ControlButton(icon: Icons.add, onPressed: onZoomIn),
        const Gap(AppSpacing.sectionPadding),
        _ControlButton(icon: Icons.remove, onPressed: onZoomOut),
        const Gap(AppSpacing.sectionPadding),
        _ControlButton(icon: Icons.refresh, onPressed: onReset),
      ],
    );
  }
}

class _ControlButton extends StatelessWidget {
  const _ControlButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.colorScheme.surface,
      elevation: 4,
      shadowColor: Colors.black.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: AppIconContainer(
          icon: Icon(icon, color: context.theme.colorScheme.onSurface),
          backgroundColor: Colors.transparent,
          borderColor: Colors.transparent,
        ),
      ),
    );
  }
}
