import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/extensions/context_ext.dart';

class CustomBottomNavigatorBar extends StatefulWidget {
  final int bottomNavIndex;
  final Function(int) onChange;

  const CustomBottomNavigatorBar({
    super.key,
    required this.bottomNavIndex,
    required this.onChange,
  });

  @override
  State<CustomBottomNavigatorBar> createState() =>
      _CustomBottomNavigatorBarState();
}

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: iconList.length,
      tabBuilder: (index, isActive) {
        final color = isActive
            ? AppColors.brandPrimary
            : context.theme.colorScheme.secondary.withValues(alpha: 0.6);
        final textStyle = isActive
            ? AppTypography.captionTextBold(color: color)
            : AppTypography.captionTextRegular(color: color);
        final iconUrl = iconList[index].iconUrl;
        final navigatorTitle = iconList[index].index == NavigatorIndex.home
            ? context.l10n.home
            : context.l10n.parkingHistoryTitle;

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconUrl,
              package: AppAssets.package,
              color: color,
              width: AppSpacing.iconDefault,
              height: AppSpacing.iconDefault,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(navigatorTitle, maxLines: 1, style: textStyle),
            ),
          ],
        );
      },
      activeIndex: widget.bottomNavIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.sharpEdge,
      borderWidth: 0,
      notchMargin: 3,
      leftCornerRadius: 0,
      rightCornerRadius: 0,
      onTap: widget.onChange,
    );
  }
}

class NavigatorItem {
  NavigatorIndex index;
  String iconUrl;

  NavigatorItem(this.index, this.iconUrl);
}

enum NavigatorIndex { home, history }

List<NavigatorItem> iconList = [
  NavigatorItem(NavigatorIndex.home, AppIcons.icHome),
  NavigatorItem(NavigatorIndex.history, AppIcons.icHistory),
];
