part of 'loading_shimmer.dart';

class _WithChild extends StatelessWidget {
  const _WithChild({
    required this.child,
    required this.enabled,
    this.center = true,
  });

  final Widget child;
  final bool enabled;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final widget = !enabled
        ? child
        : Shimmer(
            duration: const Duration(seconds: 1),
            interval: const Duration(seconds: 1),
            color: Colors.black,
            colorOpacity: 0,
            enabled: true,
            direction: const ShimmerDirection.fromLTRB(),
            child: child,
          );

    return center ? Center(child: widget) : widget;
  }
}
