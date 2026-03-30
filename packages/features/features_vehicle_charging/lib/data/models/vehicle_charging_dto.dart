import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_charging_dto.freezed.dart';
part 'vehicle_charging_dto.g.dart';

@freezed
abstract class VehicleChargingDto with _$VehicleChargingDto {
  const factory VehicleChargingDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'serialNumber') String? serialNumber,
    @JsonKey(name: 'materialCode') String? materialCode,
    @JsonKey(name: 'model') String? model,
    @JsonKey(name: 'manufacturingDate') String? manufacturingDate,
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'statusLabel') String? statusLabel,
    @JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,
    @JsonKey(name: 'exportedAt') String? exportedAt,
    @JsonKey(name: 'storageDays') int? storageDays,
    @JsonKey(name: 'qcDefectDescription') String? qcDefectDescription,
    @JsonKey(name: 'factory') VehicleChargingFactoryDto? factory,
    @JsonKey(name: 'parkingLot') VehicleChargingParkingLotDto? parkingLot,
  }) = _VehicleChargingDto;

  factory VehicleChargingDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleChargingDtoFromJson(json);
}

@freezed
abstract class VehicleChargingFactoryDto with _$VehicleChargingFactoryDto {
  const factory VehicleChargingFactoryDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'address') String? address,
  }) = _VehicleChargingFactoryDto;

  factory VehicleChargingFactoryDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleChargingFactoryDtoFromJson(json);
}

@freezed
abstract class VehicleChargingParkingZoneDto
    with _$VehicleChargingParkingZoneDto {
  const factory VehicleChargingParkingZoneDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'isActive') bool? isActive,
    @JsonKey(name: 'factoryId') int? factoryId,
  }) = _VehicleChargingParkingZoneDto;

  factory VehicleChargingParkingZoneDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleChargingParkingZoneDtoFromJson(json);
}

@freezed
abstract class VehicleChargingParkingLotDto
    with _$VehicleChargingParkingLotDto {
  const factory VehicleChargingParkingLotDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'parkingZoneId') int? parkingZoneId,
    @JsonKey(name: 'parkingZone') VehicleChargingParkingZoneDto? parkingZone,
    @JsonKey(name: 'maxCapacity') int? maxCapacity,
    @JsonKey(name: 'currentOccupied') int? currentOccupied,
  }) = _VehicleChargingParkingLotDto;

  factory VehicleChargingParkingLotDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleChargingParkingLotDtoFromJson(json);
}
