import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_model_dto.freezed.dart';
part 'vehicle_model_dto.g.dart';

@freezed
abstract class ParkingZoneDto with _$ParkingZoneDto {
  const factory ParkingZoneDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'isActive') required bool isActive,
    @JsonKey(name: 'factoryId') required int factoryId,
  }) = _ParkingZoneDto;

  factory ParkingZoneDto.fromJson(Map<String, Object?> json) =>
      _$ParkingZoneDtoFromJson(json);
}

@freezed
abstract class ParkingLotDto with _$ParkingLotDto {
  const factory ParkingLotDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'parkingZoneId') required int parkingZoneId,
    @JsonKey(name: 'parkingZone') required ParkingZoneDto parkingZone,
    @JsonKey(name: 'maxCapacity') required int maxCapacity,
    @JsonKey(name: 'currentOccupied') required int currentOccupied,
  }) = _ParkingLotDto;

  factory ParkingLotDto.fromJson(Map<String, Object?> json) =>
      _$ParkingLotDtoFromJson(json);
}

@freezed
abstract class VehicleFactoryDto with _$VehicleFactoryDto {
  const factory VehicleFactoryDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'address') required String address,
  }) = _VehicleFactoryDto;

  factory VehicleFactoryDto.fromJson(Map<String, Object?> json) =>
      _$VehicleFactoryDtoFromJson(json);
}

@freezed
abstract class VehicleDto with _$VehicleDto {
  const factory VehicleDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'serialNumber') required String serialNumber,
    @JsonKey(name: 'materialCode') required String materialCode,
    @JsonKey(name: 'model') required String model,
    @JsonKey(name: 'manufacturingDate') required String manufacturingDate,
    @JsonKey(name: 'color') required String color,
    @JsonKey(name: 'status') required int status,
    @JsonKey(name: 'statusLabel') required String statusLabel,
    @JsonKey(name: 'warehouseImportedAt') required String warehouseImportedAt,
    @JsonKey(name: 'storageDays') @Default(0) int storageDays,
    @JsonKey(name: 'exportedAt') String? exportedAt,
    @JsonKey(name: 'qcDefectDescription') String? qcDefectDescription,
    @JsonKey(name: 'factory') VehicleFactoryDto? factory,
    @JsonKey(name: 'parkingLot') ParkingLotDto? parkingLot,
  }) = _VehicleDto;

  factory VehicleDto.fromJson(Map<String, Object?> json) =>
      _$VehicleDtoFromJson(json);
}
