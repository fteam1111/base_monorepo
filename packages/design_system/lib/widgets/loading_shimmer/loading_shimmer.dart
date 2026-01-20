import 'package:design_system/widgets/components/custom_card.dart';
import 'package:design_system/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

part 'with_child.dart';
part 'tile.dart';
part 'logo.dart';
part 'material_loading_shimmer.dart';

enum LoadingShimmerType { withChild, tile, logo, product }

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer._({
    super.key,
    required this.type,
    this.child,
    this.enabled,
    this.line,
    this.center = true,
  });
  final LoadingShimmerType type;
  final Widget? child;
  final bool? enabled;
  final int? line;
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
    return LoadingShimmer._(type: LoadingShimmerType.logo, key: key);
  }

  factory LoadingShimmer.product() =>
      const LoadingShimmer._(type: LoadingShimmerType.product);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LoadingShimmerType.withChild:
        return _WithChild(enabled: enabled!, center: center, child: child!);
      case LoadingShimmerType.logo:
        return const _Logo();
      case LoadingShimmerType.tile:
        return _Tile(enabled: enabled!, line: line!);
      case LoadingShimmerType.product:
        return const MaterialLoading();
    }
  }
}
