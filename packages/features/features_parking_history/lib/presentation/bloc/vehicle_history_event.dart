import 'package:equatable/equatable.dart';

abstract class VehicleHistoryEvent extends Equatable {
  const VehicleHistoryEvent();

  @override
  List<Object?> get props => [];
}

class VehicleHistoryStarted extends VehicleHistoryEvent {
  const VehicleHistoryStarted(this.vehicleId);
  final int vehicleId;

  @override
  List<Object?> get props => [vehicleId];
}

class VehicleHistoryRefreshed extends VehicleHistoryEvent {
  const VehicleHistoryRefreshed();
}

class VehicleHistoryLoadMoreRequested extends VehicleHistoryEvent {
  const VehicleHistoryLoadMoreRequested();
}
