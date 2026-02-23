import 'package:design_system/app_assets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

part 'circular.dart';
part 'logo.dart';
part 'tile.dart';
part 'with_child.dart';

enum LoadingShimmerType { withChild, tile, logo, circular }

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer._({
    super.key,
    required this.type,
    this.child,
    this.enabled = true,
    this.line = 1,
    this.center = true,
  });

  final LoadingShimmerType type;
  final Widget? child;
  final bool enabled;
  final int line;
  final bool center;

  factory LoadingShimmer.withChild({
    required Widget child,
    bool enabled = true,
    bool center = true,
  }) {
    return LoadingShimmer._(
      type: LoadingShimmerType.withChild,
      enabled: enabled,
      center: center,
      child: child,
    );
  }

  factory LoadingShimmer.tile({bool enabled = true, int line = 1}) {
    return LoadingShimmer._(
      type: LoadingShimmerType.tile,
      enabled: enabled,
      line: line,
    );
  }

  factory LoadingShimmer.logo({Key? key}) {
    return LoadingShimmer._(
      type: LoadingShimmerType.logo,
      key: key ?? WidgetKeys.loaderImage,
    );
  }

  factory LoadingShimmer.circular({Key? key}) => LoadingShimmer._(
    type: LoadingShimmerType.circular,
    key: key ?? WidgetKeys.circularLoader,
  );

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LoadingShimmerType.withChild:
        return _WithChild(
          enabled: enabled,
          center: center,
          child: child ?? const SizedBox.shrink(),
        );
      case LoadingShimmerType.logo:
        return const _Logo();
      case LoadingShimmerType.tile:
        return _Tile(enabled: enabled, line: line);
      case LoadingShimmerType.circular:
        return const _CircularLoader();
    }
  }
}
