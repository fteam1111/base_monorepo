import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_entity.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_vehicle_entity.dart';

/// Status for [DeliveryDetailState].
enum DeliveryDetailStatus { initial, loading, success, failure }

/// Status for the add-vehicle action.
enum AddVehicleStatus { initial, loading, success, failure }

/// State for [DeliveryDetailBloc].
class DeliveryDetailState extends Equatable {
  const DeliveryDetailState({
    this.status = DeliveryDetailStatus.initial,
    this.deliveryOrder,
    this.vehicles = const [],
    this.failure,
    this.addVehicleStatus = AddVehicleStatus.initial,
    this.addVehicleFailure,
  });

  final DeliveryDetailStatus status;
  final DeliveryOrderEntity? deliveryOrder;
  final List<DeliveryOrderVehicleEntity> vehicles;
  final ApiFailure? failure;
  final AddVehicleStatus addVehicleStatus;
  final ApiFailure? addVehicleFailure;

  @override
  List<Object?> get props => [
    status,
    deliveryOrder,
    vehicles,
    failure,
    addVehicleStatus,
    addVehicleFailure,
  ];

  DeliveryDetailState copyWith({
    DeliveryDetailStatus? status,
    DeliveryOrderEntity? deliveryOrder,
    List<DeliveryOrderVehicleEntity>? vehicles,
    ApiFailure? failure,
    AddVehicleStatus? addVehicleStatus,
    ApiFailure? addVehicleFailure,
  }) {
    return DeliveryDetailState(
      status: status ?? this.status,
      deliveryOrder: deliveryOrder ?? this.deliveryOrder,
      vehicles: vehicles ?? this.vehicles,
      failure: failure ?? this.failure,
      addVehicleStatus: addVehicleStatus ?? this.addVehicleStatus,
      addVehicleFailure: addVehicleFailure ?? this.addVehicleFailure,
    );
  }
}
