part of 'loading_shimmer.dart';

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 1),
      interval: const Duration(seconds: 1),
      color: context.appColors.neutralVariant,
      enabled: true,
      direction: const ShimmerDirection.fromLTRB(),
      child: Image.asset(AppIcons.icHome, package: AppAssets.package),
    );
  }
}
