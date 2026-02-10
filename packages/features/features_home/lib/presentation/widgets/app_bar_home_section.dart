import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:localization/bloc/localization_bloc.dart';
import 'package:localization/bloc/localization_event.dart';
import 'package:localization/bloc/localization_state.dart';
import 'package:localization/domain/entities/app_locale.dart';
import 'package:share/share.dart';

const appBarHeight = AppSpacing.gigantic;

class AppBarHomeSection extends StatelessWidget {
  const AppBarHomeSection({
    super.key,
    this.title = '',
    this.showLogout = true,
    this.showLanguageSwitch = true,
    this.onLogoutPressed,
  });

  final String title;
  final bool showLogout;
  final bool showLanguageSwitch;
  final VoidCallback? onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appBarTheme.backgroundColor,
      height: appBarHeight,
      child: LayoutBuilder(
        builder: (context, constrains) {
          final logoHeight = appBarHeight / 2 * (constrains.maxWidth / 411);
          return Stack(
            children: [
              const _BackgroundSection(),
              _LogoSection(logoHeight: logoHeight),
              _ContentSection(
                title: title,
                showLogout: showLogout,
                showLanguageSwitch: showLanguageSwitch,
                onLogoutPressed: onLogoutPressed,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BackgroundSection extends StatelessWidget {
  const _BackgroundSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            AppImages.imgLightLeft,
            package: AppAssets.package,
          ),
        ),
        const Gap(0),
        Expanded(
          child: Image.asset(
            AppImages.imgLightRight,
            package: AppAssets.package,
          ),
        ),
      ],
    );
  }
}

class _LogoSection extends StatelessWidget {
  const _LogoSection({required this.logoHeight});

  final double logoHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSpacing.paddingXXXS,
        bottom: AppSpacing.paddingXS,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset(
          height: logoHeight,
          AppIcons.logoVinfast,
          package: AppAssets.package,
        ),
      ),
    );
  }
}

class _ContentSection extends StatelessWidget {
  const _ContentSection({
    required this.title,
    required this.showLanguageSwitch,
    required this.showLogout,
    this.onLogoutPressed,
  });

  final String title;
  final bool showLanguageSwitch;
  final bool showLogout;
  final VoidCallback? onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.appTypography.sectionHeader,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (showLanguageSwitch) const _LanguageSwitchSection(),
                if (showLogout) ...[
                  const SizedBox(width: 16),
                  _LogoutSection(onPressed: onLogoutPressed),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageSwitchSection extends StatelessWidget {
  const _LanguageSwitchSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        final currentLocale = state is LocalizationLoaded
            ? state.locale
            : AppLocale.english;

        return SizedBox(
          width: 90,
          child: SegmentedButton<AppLocale>(
            segments: const [
              ButtonSegment(value: AppLocale.english, label: Text('EN')),
              ButtonSegment(value: AppLocale.vietnamese, label: Text('VI')),
            ],
            selected: {currentLocale},
            onSelectionChanged: (selected) {
              context.read<LocalizationBloc>().add(
                ChangeLocaleEvent(selected.first),
              );
            },
            showSelectedIcon: false,
            style: const ButtonStyle(visualDensity: VisualDensity.compact),
          ),
        );
      },
    );
  }
}

class _LogoutSection extends StatelessWidget {
  const _LogoutSection({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Image.asset(
        AppIcons.icLogout,
        color: context.theme.colorScheme.primary,
        package: AppAssets.package,
        width: AppSpacing.iconDefault,
        height: AppSpacing.iconDefault,
      ),
    );
  }
}
