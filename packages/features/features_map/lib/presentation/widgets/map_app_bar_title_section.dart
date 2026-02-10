import 'package:flutter/material.dart';
import 'package:share/share.dart';

class MapAppBarTitleSection extends StatelessWidget {
  const MapAppBarTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.l10n.factoryMapTitle,
          style: context.appTypography.sectionHeader.copyWith(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          context.l10n.exportWaitingAreaSubtitle,
          style: context.appTypography.bodySmall.copyWith(
            color: colorScheme.onSurfaceVariant,
            letterSpacing: 1.1,
          ),
        ),
      ],
    );
  }
}
