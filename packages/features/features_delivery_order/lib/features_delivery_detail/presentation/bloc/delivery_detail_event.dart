import 'package:equatable/equatable.dart';

/// Events for [DeliveryDetailBloc].
abstract class DeliveryDetailEvent extends Equatable {
  const DeliveryDetailEvent();

  @override
  List<Object?> get props => [];
}

/// Initial load of delivery order detail and its vehicles.
class DeliveryDetailStarted extends DeliveryDetailEvent {
  const DeliveryDetailStarted({required this.deliveryOrderId});

  final int deliveryOrderId;

  @override
  List<Object?> get props => [deliveryOrderId];
}

/// Request to add a vehicle to the delivery order.
class DeliveryDetailAddVehicleRequested extends DeliveryDetailEvent {
  const DeliveryDetailAddVehicleRequested({required this.vehicleId});

  final String vehicleId;

  @override
  List<Object?> get props => [vehicleId];
}

/// Refresh vehicles list after adding.
class DeliveryDetailRefreshVehiclesRequested extends DeliveryDetailEvent {
  const DeliveryDetailRefreshVehiclesRequested();
}
