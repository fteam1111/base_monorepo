import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_order_dto.freezed.dart';
part 'delivery_order_dto.g.dart';

/// DTO for Delivery Order from list/detail APIs.
@freezed
abstract class DeliveryOrderDto with _$DeliveryOrderDto {
  const factory DeliveryOrderDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'doCode') String? doCode,
    @JsonKey(name: 'factoryId') int? factoryId,
    @JsonKey(name: 'storeName') String? storeName,
    @JsonKey(name: 'storeBranch') String? storeBranch,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'totalQuantity') int? totalQuantity,
    @JsonKey(name: 'fulfilledQuantity') int? fulfilledQuantity,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    @JsonKey(name: 'items') List<DeliveryOrderItemDto>? items,
    @JsonKey(name: 'vehicles') List<DeliveryOrderVehicleDto>? vehicles,
  }) = _DeliveryOrderDto;

  factory DeliveryOrderDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderDtoFromJson(json);
}

/// DTO for a line item within a Delivery Order.
@freezed
abstract class DeliveryOrderItemDto with _$DeliveryOrderItemDto {
  const factory DeliveryOrderItemDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'vehicleModel') String? vehicleModel,
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'quantity') int? quantity,
  }) = _DeliveryOrderItemDto;

  factory DeliveryOrderItemDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderItemDtoFromJson(json);
}

/// DTO for a Vehicle assigned to a Delivery Order.
@freezed
abstract class DeliveryOrderVehicleDto with _$DeliveryOrderVehicleDto {
  const factory DeliveryOrderVehicleDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'serialNumber') String? serialNumber,
    @JsonKey(name: 'model') String? model,
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'materialCode') String? materialCode,
    @JsonKey(name: 'manufacturingDate') String? manufacturingDate,
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'statusLabel') String? statusLabel,
    @JsonKey(name: 'warehouseImportedAt') String? warehouseImportedAt,
    @JsonKey(name: 'exportedAt') String? exportedAt,
    @JsonKey(name: 'storageDays') int? storageDays,
    @JsonKey(name: 'qcDefectDescription') String? qcDefectDescription,
  }) = _DeliveryOrderVehicleDto;

  factory DeliveryOrderVehicleDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderVehicleDtoFromJson(json);
}

/// Request body DTO for adding a vehicle to a delivery order.
@freezed
abstract class AddVehicleToDeliveryOrderRequestDto
    with _$AddVehicleToDeliveryOrderRequestDto {
  const factory AddVehicleToDeliveryOrderRequestDto({
    @JsonKey(name: 'vehicleId') required String vehicleId,
  }) = _AddVehicleToDeliveryOrderRequestDto;

  factory AddVehicleToDeliveryOrderRequestDto.fromJson(
    Map<String, dynamic> json,
  ) => _$AddVehicleToDeliveryOrderRequestDtoFromJson(json);
}
