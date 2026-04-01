import 'package:equatable/equatable.dart';

sealed class ParkingLocationEvent extends Equatable {
  const ParkingLocationEvent();

  @override
  List<Object?> get props => [];
}

final class ParkingLocationLoad extends ParkingLocationEvent {
  const ParkingLocationLoad();
}

final class ParkingLocationLoadMore extends ParkingLocationEvent {
  const ParkingLocationLoadMore();
}

final class ParkingLocationAddVehicle extends ParkingLocationEvent {
  const ParkingLocationAddVehicle({
    required this.lotId,
    required this.vehicleId,
  });

  final int lotId;
  final int vehicleId;

  @override
  List<Object?> get props => [lotId, vehicleId];
}

final class ParkingLocationLoadDischargingVehicles
    extends ParkingLocationEvent {
  const ParkingLocationLoadDischargingVehicles();
}

final class ParkingLocationLoadMoreDischargingVehicles
    extends ParkingLocationEvent {
  const ParkingLocationLoadMoreDischargingVehicles();
}

final class ParkingLocationLoadQcVehicles extends ParkingLocationEvent {
  const ParkingLocationLoadQcVehicles();
}

final class ParkingLocationLoadMoreQcVehicles extends ParkingLocationEvent {
  const ParkingLocationLoadMoreQcVehicles();
}
