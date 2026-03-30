import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:features_delivery_order/domain/entities/client_vehicle_entity.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_entity.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_vehicle_entity.dart';

/// Status for [DeliveryDetailState].
enum DeliveryDetailStatus { initial, loading, success, failure }

/// Status for the add-vehicle action.
enum AddVehicleStatus { initial, loading, success, failure }

/// Verification result after scanning a VIN and comparing to DO.
enum ScanVerificationStatus {
  /// No scan in progress.
  initial,

  /// Looking up vehicle by serial number.
  loading,

  /// Scanned VIN matches the selected vehicle exactly.
  exactMatch,

  /// Different vehicle but model+color is compatible with DO.
  compatibleMatch,

  /// Vehicle model/color does not match any DO item.
  incompatible,

  /// API call to look up vehicle failed.
  failure,
}

/// State for [DeliveryDetailBloc].
class DeliveryDetailState extends Equatable {
  const DeliveryDetailState({
    this.status = DeliveryDetailStatus.initial,
    this.deliveryOrder,
    this.vehicles = const [],
    this.failure,
    this.addVehicleStatus = AddVehicleStatus.initial,
    this.addVehicleFailure,
    this.tabIndex = 0,
    this.suggestedVehicles = const [],
    this.suggestedVehiclesStatus = DeliveryDetailStatus.initial,
    this.suggestedVehiclesFailure,
    this.vinFilter,
    this.modelFilter,
    this.colorFilter,
    this.scanVerificationStatus = ScanVerificationStatus.initial,
    this.scannedVehicle,
    this.scanFailure,
  });

  final DeliveryDetailStatus status;
  final DeliveryOrderEntity? deliveryOrder;
  final List<DeliveryOrderVehicleEntity> vehicles;
  final ApiFailure? failure;
  final AddVehicleStatus addVehicleStatus;
  final ApiFailure? addVehicleFailure;

  final int tabIndex;
  final List<ClientVehicleEntity> suggestedVehicles;
  final DeliveryDetailStatus suggestedVehiclesStatus;
  final ApiFailure? suggestedVehiclesFailure;
  final String? vinFilter;
  final String? modelFilter;
  final String? colorFilter;

  /// Scan verification fields.
  final ScanVerificationStatus scanVerificationStatus;
  final ClientVehicleEntity? scannedVehicle;
  final ApiFailure? scanFailure;

  @override
  List<Object?> get props => [
    status,
    deliveryOrder,
    vehicles,
    failure,
    addVehicleStatus,
    addVehicleFailure,
    tabIndex,
    suggestedVehicles,
    suggestedVehiclesStatus,
    suggestedVehiclesFailure,
    vinFilter,
    modelFilter,
    colorFilter,
    scanVerificationStatus,
    scannedVehicle,
    scanFailure,
  ];

  DeliveryDetailState copyWith({
    DeliveryDetailStatus? status,
    DeliveryOrderEntity? deliveryOrder,
    List<DeliveryOrderVehicleEntity>? vehicles,
    ApiFailure? failure,
    AddVehicleStatus? addVehicleStatus,
    ApiFailure? addVehicleFailure,
    int? tabIndex,
    List<ClientVehicleEntity>? suggestedVehicles,
    DeliveryDetailStatus? suggestedVehiclesStatus,
    ApiFailure? suggestedVehiclesFailure,
    String? Function()? vinFilter,
    String? Function()? modelFilter,
    String? Function()? colorFilter,
    ScanVerificationStatus? scanVerificationStatus,
    ClientVehicleEntity? Function()? scannedVehicle,
    ApiFailure? Function()? scanFailure,
  }) {
    return DeliveryDetailState(
      status: status ?? this.status,
      deliveryOrder: deliveryOrder ?? this.deliveryOrder,
      vehicles: vehicles ?? this.vehicles,
      failure: failure ?? this.failure,
      addVehicleStatus: addVehicleStatus ?? this.addVehicleStatus,
      addVehicleFailure: addVehicleFailure ?? this.addVehicleFailure,
      tabIndex: tabIndex ?? this.tabIndex,
      suggestedVehicles: suggestedVehicles ?? this.suggestedVehicles,
      suggestedVehiclesStatus:
          suggestedVehiclesStatus ?? this.suggestedVehiclesStatus,
      suggestedVehiclesFailure:
          suggestedVehiclesFailure ?? this.suggestedVehiclesFailure,
      vinFilter: vinFilter != null ? vinFilter() : this.vinFilter,
      modelFilter: modelFilter != null ? modelFilter() : this.modelFilter,
      colorFilter: colorFilter != null ? colorFilter() : this.colorFilter,
      scanVerificationStatus:
          scanVerificationStatus ?? this.scanVerificationStatus,
      scannedVehicle: scannedVehicle != null
          ? scannedVehicle()
          : this.scannedVehicle,
      scanFailure: scanFailure != null ? scanFailure() : this.scanFailure,
    );
  }
}
