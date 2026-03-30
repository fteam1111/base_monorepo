import 'package:equatable/equatable.dart';

abstract class VehicleChargingEvent extends Equatable {
  const VehicleChargingEvent();

  @override
  List<Object?> get props => [];
}

class VehicleChargingStarted extends VehicleChargingEvent {
  const VehicleChargingStarted({this.serialNumber});

  final String? serialNumber;

  @override
  List<Object?> get props => [serialNumber];
}

class VehicleChargingRefreshRequested extends VehicleChargingEvent {
  const VehicleChargingRefreshRequested();
}

class VehicleChargingLoadMoreRequested extends VehicleChargingEvent {
  const VehicleChargingLoadMoreRequested();
}

class VehicleChargingDischargeRequested extends VehicleChargingEvent {
  const VehicleChargingDischargeRequested(this.vehicleId);

  final int vehicleId;

  @override
  List<Object?> get props => [vehicleId];
}

