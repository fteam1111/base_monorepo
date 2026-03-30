import 'package:equatable/equatable.dart';
import 'package:core/core.dart';
import 'package:features_vehicle_charging/domain/entities/vehicle_charging_entity.dart';

enum VehicleChargingStatus { initial, loading, success, failure }

enum DischargeStatus { initial, loading, success, failure }

class VehicleChargingState extends Equatable {
  const VehicleChargingState({
    this.status = VehicleChargingStatus.initial,
    this.vehicles = const [],
    this.failure,
    this.page = 1,
    this.hasReachedMax = false,
    this.searchQuery = '',
    this.dischargeStatus = DischargeStatus.initial,
    this.lastDischargedVehicle,
    this.dischargeFailure,
  });

  final VehicleChargingStatus status;
  final List<VehicleChargingEntity> vehicles;
  final ApiFailure? failure;
  final int page;
  final bool hasReachedMax;
  final String searchQuery;
  final DischargeStatus dischargeStatus;
  final VehicleChargingEntity? lastDischargedVehicle;
  final ApiFailure? dischargeFailure;

  @override
  List<Object?> get props => [
    status,
    vehicles,
    failure,
    page,
    hasReachedMax,
    searchQuery,
    dischargeStatus,
    lastDischargedVehicle,
    dischargeFailure,
  ];

  VehicleChargingState copyWith({
    VehicleChargingStatus? status,
    List<VehicleChargingEntity>? vehicles,
    ApiFailure? failure,
    int? page,
    bool? hasReachedMax,
    String? searchQuery,
    DischargeStatus? dischargeStatus,
    VehicleChargingEntity? lastDischargedVehicle,
    ApiFailure? dischargeFailure,
  }) {
    return VehicleChargingState(
      status: status ?? this.status,
      vehicles: vehicles ?? this.vehicles,
      failure: failure ?? this.failure,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      searchQuery: searchQuery ?? this.searchQuery,
      dischargeStatus: dischargeStatus ?? this.dischargeStatus,
      lastDischargedVehicle:
          lastDischargedVehicle ?? this.lastDischargedVehicle,
      dischargeFailure: dischargeFailure ?? this.dischargeFailure,
    );
  }
}
