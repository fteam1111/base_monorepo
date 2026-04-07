import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_history_dto.freezed.dart';
part 'vehicle_history_dto.g.dart';

@freezed
abstract class VehicleHistoryDto with _$VehicleHistoryDto {
  const factory VehicleHistoryDto({
    required int id,
    required String action,
    required String performedBy,
    required DateTime? performedAt,
    required int status,
    String? notes,
    String? performedByName,
    String? performedByAccount,
    FactoryRefDto? factory,
    AreaRefDto? area,
    LocationRefDto? position,
    LocationRefDto? parkingLot,
    LocationRefDto? parkingZone,
    int? storageDays,
    DeliveryOrderRefDto? deliveryOrder,
  }) = _VehicleHistoryDto;

  factory VehicleHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleHistoryDtoFromJson(json);
}

@freezed
abstract class DeliveryOrderRefDto with _$DeliveryOrderRefDto {
  const factory DeliveryOrderRefDto({required int id, required String doCode}) =
      _DeliveryOrderRefDto;

  factory DeliveryOrderRefDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderRefDtoFromJson(json);
}

@freezed
abstract class FactoryRefDto with _$FactoryRefDto {
  const factory FactoryRefDto({
    required int id,
    required String name,
    String? address,
  }) = _FactoryRefDto;

  factory FactoryRefDto.fromJson(Map<String, dynamic> json) =>
      _$FactoryRefDtoFromJson(json);
}

@freezed
abstract class AreaRefDto with _$AreaRefDto {
  const factory AreaRefDto({
    required int id,
    required String name,
    String? type,
  }) = _AreaRefDto;

  factory AreaRefDto.fromJson(Map<String, dynamic> json) =>
      _$AreaRefDtoFromJson(json);
}

@freezed
abstract class LocationRefDto with _$LocationRefDto {
  const factory LocationRefDto({required int id, required String name}) =
      _LocationRefDto;

  factory LocationRefDto.fromJson(Map<String, dynamic> json) =>
      _$LocationRefDtoFromJson(json);
}
