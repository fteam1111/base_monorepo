import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:features_parking_location/domain/entities/export_area_delivery_order_entity.dart';

enum ExportAreaDoStatus { initial, loading, success, failure }

enum ExportAreaDoAddVehicleStatus { initial, loading, success, failure }

class ExportAreaDoState extends Equatable {
  const ExportAreaDoState({
    this.status = ExportAreaDoStatus.initial,
    this.deliveryOrders = const [],
    this.failure,
    this.addVehicleStatus = ExportAreaDoAddVehicleStatus.initial,
    this.addVehicleFailure,
  });

  final ExportAreaDoStatus status;
  final List<ExportAreaDeliveryOrderEntity> deliveryOrders;
  final ApiFailure? failure;

  final ExportAreaDoAddVehicleStatus addVehicleStatus;
  final ApiFailure? addVehicleFailure;

  @override
  List<Object?> get props => [
    status,
    deliveryOrders,
    failure,
    addVehicleStatus,
    addVehicleFailure,
  ];

  ExportAreaDoState copyWith({
    ExportAreaDoStatus? status,
    List<ExportAreaDeliveryOrderEntity>? deliveryOrders,
    ApiFailure? failure,
    ExportAreaDoAddVehicleStatus? addVehicleStatus,
    ApiFailure? addVehicleFailure,
  }) {
    return ExportAreaDoState(
      status: status ?? this.status,
      deliveryOrders: deliveryOrders ?? this.deliveryOrders,
      failure: failure ?? this.failure,
      addVehicleStatus: addVehicleStatus ?? this.addVehicleStatus,
      addVehicleFailure: addVehicleFailure ?? this.addVehicleFailure,
    );
  }
}
