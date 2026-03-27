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
  }) = _ClientVehicleDto;

  factory ClientVehicleDto.fromJson(Map<String, dynamic> json) =>
      _$ClientVehicleDtoFromJson(json);
}
