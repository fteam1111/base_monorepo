import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_delivery_order/data/datasources/remote/delivery_order_remote_datasource.dart';
import 'package:features_delivery_order/data/mappers/client_vehicle_mapper.dart';
import 'package:features_delivery_order/data/mappers/delivery_order_mapper.dart';
import 'package:features_delivery_order/data/models/delivery_order_dto.dart';
import 'package:features_delivery_order/domain/entities/client_vehicle_entity.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_entity.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_vehicle_entity.dart';
import 'package:features_delivery_order/domain/repositories/delivery_order_repository.dart';
import 'package:injectable/injectable.dart';

/// Repository implementation for Delivery Order operations.
@LazySingleton(as: DeliveryOrderRepository)
class DeliveryOrderRepositoryImpl implements DeliveryOrderRepository {
  DeliveryOrderRepositoryImpl(this._remoteDataSource);

  final DeliveryOrderRemoteDataSource _remoteDataSource;

  @override
  Future<Either<ApiFailure, List<DeliveryOrderEntity>>> getDeliveryOrders({
    required int page,
    required int size,
    String? status,
  }) async {
    try {
      final response = await _remoteDataSource.getDeliveryOrders(
        page: page,
        size: size,
        status: status,
      );

      final pagination = response.data;
      final items = pagination?.data;

      if (items == null || items.isEmpty) {
        return const Right([]);
      }

      final entities = items.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, List<DeliveryOrderVehicleEntity>>>
  getDeliveryOrderVehicles({required int deliveryOrderId}) async {
    try {
      final response = await _remoteDataSource.getDeliveryOrderVehicles(
        deliveryOrderId,
      );
      final data = response.data;

      if (data == null || data.isEmpty) {
        return const Right([]);
      }

      final entities = data.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, DeliveryOrderEntity>> addVehicleToDeliveryOrder({
    required int deliveryOrderId,
    required String vehicleId,
  }) async {
    try {
      final response = await _remoteDataSource.addVehicleToDeliveryOrder(
        deliveryOrderId,
        AddVehicleToDeliveryOrderRequestDto(vehicleId: vehicleId),
      );

      final data = response.data;
      if (data == null) {
        return const Left(ApiFailure.other('Delivery order not found'));
      }

      return Right(data.toEntity());
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, List<ClientVehicleEntity>>> getClientVehicles({
    required int page,
    required int size,
    String? serialNumber,
    String? color,
    String? model,
    bool? isUnassigned,
  }) async {
    try {
      final response = await _remoteDataSource.getClientVehicles(
        page: page,
        size: size,
        serialNumber: serialNumber,
        color: color,
        model: model,
        isUnassigned: isUnassigned,
      );

      final pagination = response.data;
      final items = pagination?.data;

      if (items == null || items.isEmpty) {
        return const Right([]);
      }

      final entities = items.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } on Exception catch (e) {
      return Left(e.toApiFailure());
    }
  }
}
