import 'package:equatable/equatable.dart';

class DashboardState extends Equatable {
  const DashboardState({this.index = 0});

  final int index;

  @override
  List<Object> get props => [index];

  DashboardState copyWith({int? index}) {
    return DashboardState(index: index ?? this.index);
  }
}
