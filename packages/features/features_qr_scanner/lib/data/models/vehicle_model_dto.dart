import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_model_dto.freezed.dart';
part 'vehicle_model_dto.g.dart';

@freezed
abstract class ParkingZoneDto with _$ParkingZoneDto {
  const factory ParkingZoneDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'isActive') bool? isActive,
    @JsonKey(name: 'factoryId') int? factoryId,
  }) = _ParkingZoneDto;

  factory ParkingZoneDto.fromJson(Map<String, Object?> json) =>
      _$ParkingZoneDtoFromJson(json);
}

@freezed
abstract class ParkingLotDto with _$ParkingLotDto {
  const factory ParkingLotDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'parkingZoneId') int? parkingZoneId,
    @JsonKey(name: 'parkingZone') ParkingZoneDto? parkingZone,
    @JsonKey(name: 'maxCapacity') int? maxCapacity,
    @JsonKey(name: 'currentOccupied') int? currentOccupied,
  }) = _ParkingLotDto;

  factory ParkingLotDto.fromJson(Map<String, Object?> json) =>
      _$ParkingLotDtoFromJson(json);
}

@freezed
abstract class VehicleFactoryDto with _$VehicleFactoryDto {
  const factory VehicleFactoryDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'address') String? address,
  }) = _VehicleFactoryDto;

  factory VehicleFactoryDto.fromJson(Map<String, Object?> json) =>
      _$VehicleFactoryDtoFromJson(json);
}

@freezed
abstract class VehicleDto with _$VehicleDto {
  const factory VehicleDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'serialNumber') String? serialNumber,
    @JsonKey(name: 'materialCode') String? materialCode,
    @JsonKey(name: 'model') String? model,
    @JsonKey(name: 'manufacturingDate') String? manufacturingDate,
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'statusLabel') String? statusLabel,
    @JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,
    @JsonKey(name: 'storageDays') int? storageDays,
    @JsonKey(name: 'exportedAt') String? exportedAt,
    @JsonKey(name: 'qcDefectDescription') String? qcDefectDescription,
    @JsonKey(name: 'factory') VehicleFactoryDto? factory,
    @JsonKey(name: 'parkingLot') ParkingLotDto? parkingLot,
  }) = _VehicleDto;

  factory VehicleDto.fromJson(Map<String, Object?> json) =>
      _$VehicleDtoFromJson(json);
}
