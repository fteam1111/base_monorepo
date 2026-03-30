import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_vehicle_dto.freezed.dart';
part 'client_vehicle_dto.g.dart';

@freezed
abstract class ClientVehicleFactoryDto with _$ClientVehicleFactoryDto {
  const factory ClientVehicleFactoryDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'address') String? address,
  }) = _ClientVehicleFactoryDto;

  factory ClientVehicleFactoryDto.fromJson(Map<String, dynamic> json) =>
      _$ClientVehicleFactoryDtoFromJson(json);
}

@freezed
abstract class ClientVehicleParkingZoneDto with _$ClientVehicleParkingZoneDto {
  const factory ClientVehicleParkingZoneDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'isActive') bool? isActive,
    @JsonKey(name: 'factoryId') int? factoryId,
  }) = _ClientVehicleParkingZoneDto;

  factory ClientVehicleParkingZoneDto.fromJson(Map<String, dynamic> json) =>
      _$ClientVehicleParkingZoneDtoFromJson(json);
}

@freezed
abstract class ClientVehicleParkingLotDto with _$ClientVehicleParkingLotDto {
  const factory ClientVehicleParkingLotDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'parkingZoneId') int? parkingZoneId,
    @JsonKey(name: 'parkingZone') ClientVehicleParkingZoneDto? parkingZone,
    @JsonKey(name: 'maxCapacity') int? maxCapacity,
    @JsonKey(name: 'currentOccupied') int? currentOccupied,
  }) = _ClientVehicleParkingLotDto;

  factory ClientVehicleParkingLotDto.fromJson(Map<String, dynamic> json) =>
      _$ClientVehicleParkingLotDtoFromJson(json);
}

@freezed
abstract class ClientVehicleDto with _$ClientVehicleDto {
  const factory ClientVehicleDto({
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
    @JsonKey(name: 'factory') ClientVehicleFactoryDto? factory,
    @JsonKey(name: 'parkingLot') ClientVehicleParkingLotDto? parkingLot,
  }) = _ClientVehicleDto;

  factory ClientVehicleDto.fromJson(Map<String, dynamic> json) =>
      _$ClientVehicleDtoFromJson(json);
}
