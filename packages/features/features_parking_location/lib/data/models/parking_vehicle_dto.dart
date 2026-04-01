import 'package:freezed_annotation/freezed_annotation.dart';

part 'parking_vehicle_dto.freezed.dart';
part 'parking_vehicle_dto.g.dart';

@freezed
abstract class ParkingVehicleDto with _$ParkingVehicleDto {
  const factory ParkingVehicleDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'serialNumber') String? serialNumber,
    @JsonKey(name: 'materialCode') String? materialCode,
    @JsonKey(name: 'model') String? model,
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'statusLabel') String? statusLabel,
    @JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,
    @JsonKey(name: 'exportedAt') String? exportedAt,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'agingDays') int? agingDays,
  }) = _ParkingVehicleDto;

  factory ParkingVehicleDto.fromJson(Map<String, dynamic> json) =>
      _$ParkingVehicleDtoFromJson(json);
}
