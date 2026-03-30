import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

/// Kiểu nút leading của AppBar.
enum CustomAppBarLeadingType {
  /// Hiển thị nút quay lại.
  back,

  /// Không hiển thị leading.
  none,
}

/// AppBar dùng chung trong Design System.
///
/// Hỗ trợ:
/// - Title dạng String (có thể kèm subtitle) hoặc Widget tuỳ chỉnh.
/// - Nút quay lại mặc định với [AppRoutes.navigateBack].
/// - Tuỳ chỉnh toàn bộ thuộc tính của Material [AppBar].
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leadingType = CustomAppBarLeadingType.back,
    this.onBack,
    this.leading,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.centerTitle = false,
    this.actions,
    this.backgroundColor,
    this.elevation,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.bottom,
    this.toolbarHeight,
    this.leadingWidth,
    this.titleSpacing,
    this.automaticallyImplyLeading = false,
    this.isDarkBackground = false,
  });

  /// Kiểu leading: back hoặc none.
  final CustomAppBarLeadingType leadingType;

  /// Callback khi nhấn nút back. Mặc định là [AppRoutes.navigateBack].
  final VoidCallback? onBack;

  /// Widget leading tuỳ chỉnh (ưu tiên hơn [leadingType]).
  final Widget? leading;

  /// Tiêu đề dạng String. Nếu cần tuỳ chỉnh hơn, dùng [titleWidget].
  final String? title;

  /// Widget tiêu đề tuỳ chỉnh (ưu tiên hơn [title] + [subtitle]).
  final Widget? titleWidget;

  /// Phụ đề hiển thị dưới [title].
  final String? subtitle;

  /// Căn giữa tiêu đề.
  final bool? centerTitle;

  /// Các action buttons bên phải.
  final List<Widget>? actions;

  /// Màu nền AppBar.
  final Color? backgroundColor;

  /// Elevation.
  final double? elevation;

  /// Elevation khi cuộn.
  final double? scrolledUnderElevation;

  /// Màu shadow.
  final Color? shadowColor;

  /// Màu surface tint.
  final Color? surfaceTintColor;

  /// Widget phía dưới AppBar (ví dụ TabBar).
  final PreferredSizeWidget? bottom;

  /// Chiều cao toolbar.
  final double? toolbarHeight;

  /// Chiều rộng leading.
  final double? leadingWidth;

  /// Khoảng cách title.
  final double? titleSpacing;

  /// Tự động thêm leading.
  final bool automaticallyImplyLeading;

  final bool isDarkBackground;

  @override
  Size get preferredSize {
    final height = toolbarHeight ?? kToolbarHeight;
    return Size.fromHeight(height + (bottom?.preferredSize.height ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      titleSpacing: titleSpacing ??
          (leadingType == CustomAppBarLeadingType.back && !isDarkBackground
              ? 0
              : null),
      actions: actions,
      bottom: bottom,
      leading: leading ?? _buildLeading(context),
      title: titleWidget ?? _buildTitle(context),
    );
  }

  Widget? _buildLeading(BuildContext context) {
    switch (leadingType) {
      case CustomAppBarLeadingType.none:
        return null;

      case CustomAppBarLeadingType.back:
        if (isDarkBackground) {
          return Padding(
            padding: const EdgeInsets.only(left: AppSpacing.xs),
            child: Material(
              color: Colors.white.withValues(alpha: .12),
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onBack ?? () => AppRoutes.navigateBack(context),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          );
        }

        return IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack ?? () => AppRoutes.navigateBack(context),
        );
    }
  }

  Widget? _buildTitle(BuildContext context) {
    if (title == null) return null;

    if (subtitle == null) {
      return Text(
        title!,
        style: context.appTypography.sectionHeader,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: context.appTypography.sectionHeader.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          subtitle!,
          style: context.appTypography.bodySmall.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            letterSpacing: 1.1,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
