import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());

  void setIndex(int index) {
    if (index == state.index) return;
    emit(state.copyWith(index: index));
  }
}
