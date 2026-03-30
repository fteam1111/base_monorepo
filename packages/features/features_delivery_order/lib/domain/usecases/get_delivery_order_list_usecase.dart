import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_entity.dart';
import 'package:features_delivery_order/domain/repositories/delivery_order_repository.dart';
import 'package:injectable/injectable.dart';

/// Use case: fetch paginated list of delivery orders.
@injectable
class GetDeliveryOrderListUseCase {
  GetDeliveryOrderListUseCase(this._repository);

  final DeliveryOrderRepository _repository;

  Future<Either<ApiFailure, List<DeliveryOrderEntity>>> call({
    required int page,
    required int size,
    String? status,
  }) {
    return _repository.getDeliveryOrders(
      page: page,
      size: size,
      status: status,
    );
  }
}
