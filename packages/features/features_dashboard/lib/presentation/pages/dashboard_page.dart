import 'package:features_find_bike/presentation/pages/find_bike_page.dart';
import 'package:features_home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/dashboard_cubit.dart';
import '../cubit/dashboard_state.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DashboardView();
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.index,
            children: const [HomePage(), FindBikePage()],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: context.read<DashboardCubit>().setIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.directions_bike_outlined),
                activeIcon: Icon(Icons.directions_bike),
                label: 'Find bike',
              ),
            ],
          ),
        );
      },
    );
  }
}
