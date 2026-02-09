import 'package:design_system/design_system.dart';
import 'package:features_auth/presentation/bloc/auth_bloc.dart';
import 'package:features_auth/presentation/bloc/auth_event.dart';
import 'package:features_home/presentation/widgets/app_bar_home_section.dart';
import 'package:features_home/presentation/widgets/home_menu_grid_section.dart';
import 'package:features_home/presentation/widgets/home_user_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Container(
            height: context.statusBarHeight,
            color: context.theme.appBarTheme.backgroundColor,
          ),
          AppBarHomeSection(
            title: "Trang chủ",
            showLogout: true,
            onLogoutPressed: () {
              context.read<AuthBloc>().add(AuthLogoutRequested());
            },
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.appSpacing.pageHorizontal,
                    ),
                    child: HomeUserSection(
                      userName: 'Nguyen Van B',
                      location: 'Nhà máy Hà Tĩnh',
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: Gap(AppSpacing.sectionSpacing)),
                const HomeMenuGridSliverSection(),
                SliverToBoxAdapter(child: Gap(AppSpacing.sectionSpacing)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
