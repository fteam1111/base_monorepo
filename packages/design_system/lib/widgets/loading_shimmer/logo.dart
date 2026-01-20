part of 'loading_shimmer.dart';

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 1),
      interval: const Duration(seconds: 1),
      color: Colors.black,
      colorOpacity: 0,
      enabled: true,
      direction: const ShimmerDirection.fromLTRB(),
      child: Image.asset('packages/design_system/assets/images/img_logo.png'),
    );
  }
}
