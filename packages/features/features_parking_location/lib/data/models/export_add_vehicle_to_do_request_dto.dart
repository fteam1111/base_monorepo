import 'package:freezed_annotation/freezed_annotation.dart';

part 'export_add_vehicle_to_do_request_dto.freezed.dart';
part 'export_add_vehicle_to_do_request_dto.g.dart';

@freezed
abstract class ExportAddVehicleToDoRequestDto
    with _$ExportAddVehicleToDoRequestDto {
  const factory ExportAddVehicleToDoRequestDto({
    @JsonKey(name: 'vehicleId') required String vehicleId,
  }) = _ExportAddVehicleToDoRequestDto;

  factory ExportAddVehicleToDoRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ExportAddVehicleToDoRequestDtoFromJson(json);
}
