import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:features_parking_location/domain/entities/export_area_entity.dart';
import 'package:features_parking_location/domain/entities/parking_lot_entity.dart';
import 'package:features_parking_location/domain/entities/parking_vehicle_entity.dart';

enum ParkingLocationStatus { initial, loading, success, failure }

enum AddVehicleStatus { initial, loading, success, failure }

class ParkingLocationState extends Equatable {
  const ParkingLocationState({
    this.status = ParkingLocationStatus.initial,
    this.parkingLots = const [],
    this.failure,
    this.page = 1,
    this.hasReachedMax = false,
    this.dischargingStatus = ParkingLocationStatus.initial,
    this.dischargingVehicles = const [],
    this.dischargingFailure,
    this.dischargingPage = 1,
    this.dischargingHasReachedMax = false,
    this.qcStatus = ParkingLocationStatus.initial,
    this.qcVehicles = const [],
    this.qcFailure,
    this.qcPage = 1,
    this.qcHasReachedMax = false,
    this.addVehicleStatus = AddVehicleStatus.initial,
    this.addVehicleFailure,
    this.exportAreasStatus = ParkingLocationStatus.initial,
    this.exportAreas = const [],
    this.exportAreasFailure,
  });

  final ParkingLocationStatus status;
  final List<ParkingLotEntity> parkingLots;
  final ApiFailure? failure;
  final int page;
  final bool hasReachedMax;

  final ParkingLocationStatus dischargingStatus;
  final List<ParkingVehicleEntity> dischargingVehicles;
  final ApiFailure? dischargingFailure;
  final int dischargingPage;
  final bool dischargingHasReachedMax;

  final ParkingLocationStatus qcStatus;
  final List<ParkingVehicleEntity> qcVehicles;
  final ApiFailure? qcFailure;
  final int qcPage;
  final bool qcHasReachedMax;

  final AddVehicleStatus addVehicleStatus;
  final ApiFailure? addVehicleFailure;

  final ParkingLocationStatus exportAreasStatus;
  final List<ExportAreaEntity> exportAreas;
  final ApiFailure? exportAreasFailure;

  @override
  List<Object?> get props => [
    status,
    parkingLots,
    failure,
    page,
    hasReachedMax,
    dischargingStatus,
    dischargingVehicles,
    dischargingFailure,
    dischargingPage,
    dischargingHasReachedMax,
    qcStatus,
    qcVehicles,
    qcFailure,
    qcPage,
    qcHasReachedMax,
    addVehicleStatus,
    addVehicleFailure,
    exportAreasStatus,
    exportAreas,
    exportAreasFailure,
  ];

  ParkingLocationState copyWith({
    ParkingLocationStatus? status,
    List<ParkingLotEntity>? parkingLots,
    ApiFailure? failure,
    int? page,
    bool? hasReachedMax,
    ParkingLocationStatus? dischargingStatus,
    List<ParkingVehicleEntity>? dischargingVehicles,
    ApiFailure? dischargingFailure,
    int? dischargingPage,
    bool? dischargingHasReachedMax,
    ParkingLocationStatus? qcStatus,
    List<ParkingVehicleEntity>? qcVehicles,
    ApiFailure? qcFailure,
    int? qcPage,
    bool? qcHasReachedMax,
    AddVehicleStatus? addVehicleStatus,
    ApiFailure? addVehicleFailure,
    ParkingLocationStatus? exportAreasStatus,
    List<ExportAreaEntity>? exportAreas,
    ApiFailure? exportAreasFailure,
  }) {
    return ParkingLocationState(
      status: status ?? this.status,
      parkingLots: parkingLots ?? this.parkingLots,
      failure: failure ?? this.failure,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      dischargingStatus: dischargingStatus ?? this.dischargingStatus,
      dischargingVehicles: dischargingVehicles ?? this.dischargingVehicles,
      dischargingFailure: dischargingFailure ?? this.dischargingFailure,
      dischargingPage: dischargingPage ?? this.dischargingPage,
      dischargingHasReachedMax:
          dischargingHasReachedMax ?? this.dischargingHasReachedMax,
      qcStatus: qcStatus ?? this.qcStatus,
      qcVehicles: qcVehicles ?? this.qcVehicles,
      qcFailure: qcFailure ?? this.qcFailure,
      qcPage: qcPage ?? this.qcPage,
      qcHasReachedMax: qcHasReachedMax ?? this.qcHasReachedMax,
      addVehicleStatus: addVehicleStatus ?? this.addVehicleStatus,
      addVehicleFailure: addVehicleFailure ?? this.addVehicleFailure,
      exportAreasStatus: exportAreasStatus ?? this.exportAreasStatus,
      exportAreas: exportAreas ?? this.exportAreas,
      exportAreasFailure: exportAreasFailure ?? this.exportAreasFailure,
    );
  }
}
