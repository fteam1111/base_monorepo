import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_charging_dto.freezed.dart';
part 'vehicle_charging_dto.g.dart';

@freezed
abstract class VehicleModelDto with _$VehicleModelDto {
  const factory VehicleModelDto({
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
    @JsonKey(name: 'factory') VehicleFactoryModelDto? factory,
  }) = _VehicleModelDto;

  factory VehicleModelDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelDtoFromJson(json);
}

@freezed
abstract class VehicleFactoryModelDto with _$VehicleFactoryModelDto {
  const factory VehicleFactoryModelDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'address') String? address,
  }) = _VehicleFactoryModelDto;

  factory VehicleFactoryModelDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleFactoryModelDtoFromJson(json);
}

