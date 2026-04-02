import 'package:freezed_annotation/freezed_annotation.dart';

part 'export_area_delivery_order_dto.freezed.dart';
part 'export_area_delivery_order_dto.g.dart';

@freezed
abstract class ExportAreaDeliveryOrderDto with _$ExportAreaDeliveryOrderDto {
  const factory ExportAreaDeliveryOrderDto({
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
  }) = _ExportAreaDeliveryOrderDto;

  factory ExportAreaDeliveryOrderDto.fromJson(Map<String, dynamic> json) =>
      _$ExportAreaDeliveryOrderDtoFromJson(json);
}
