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
      itemCount: 2,
      tabBuilder: (index, isActive) {
        final color = isActive
            ? AppColors.brandPrimary
            : context.appColors.cardBackground;
        final textStyle = isActive
            ? AppTypography.captionTextBold(color: color)
            : AppTypography.captionTextRegular(color: color);
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppIcons.icHome,
              package: AppAssets.package,
              color: color,
              width: 24,
              height: 23,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('home', maxLines: 1, style: textStyle),
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
      backgroundColor: AppColors.neutral80,
      rightCornerRadius: 0,
      onTap: widget.onChange,
    );
  }
}

class NavigatorItem {
  String title;
  String iconUrl;

  NavigatorItem(this.title, this.iconUrl);
}

// List<NavigatorItem> iconList = [
//   NavigatorItem(L.current.lbl_home_page, kIconHome),
//   NavigatorItem(L.current.lbl_history, kIconHistory),
// ];
