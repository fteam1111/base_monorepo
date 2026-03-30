import 'package:equatable/equatable.dart';

import 'package:features_delivery_order/domain/entities/delivery_order_entity.dart';

/// Events for [DeliveryDetailBloc].
abstract class DeliveryDetailEvent extends Equatable {
  const DeliveryDetailEvent();

  @override
  List<Object?> get props => [];
}

/// Initial load of delivery order detail and its vehicles.
class DeliveryDetailStarted extends DeliveryDetailEvent {
  const DeliveryDetailStarted({required this.deliveryOrder});

  final DeliveryOrderEntity deliveryOrder;

  @override
  List<Object?> get props => [deliveryOrder];
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

/// Change currently active tab.
class DeliveryDetailTabChanged extends DeliveryDetailEvent {
  const DeliveryDetailTabChanged(this.tabIndex);

  final int tabIndex;

  @override
  List<Object?> get props => [tabIndex];
}

/// User changed the VIN search filter text.
class DeliveryDetailVinFilterChanged extends DeliveryDetailEvent {
  const DeliveryDetailVinFilterChanged(this.vin);

  final String? vin;

  @override
  List<Object?> get props => [vin];
}

/// User changed the model dropdown filter.
class DeliveryDetailModelFilterChanged extends DeliveryDetailEvent {
  const DeliveryDetailModelFilterChanged(this.model);

  final String? model;

  @override
  List<Object?> get props => [model];
}

/// User changed the color dropdown filter.
class DeliveryDetailColorFilterChanged extends DeliveryDetailEvent {
  const DeliveryDetailColorFilterChanged(this.color);

  final String? color;

  @override
  List<Object?> get props => [color];
}

/// Request fetching suggested vehicles from the client API.
class DeliveryDetailSuggestedVehiclesRequested extends DeliveryDetailEvent {
  const DeliveryDetailSuggestedVehiclesRequested();
}
