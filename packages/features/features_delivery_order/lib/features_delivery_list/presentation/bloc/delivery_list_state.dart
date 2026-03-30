import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_entity.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_status.dart';

/// Status for [DeliveryListState].
enum DeliveryListStatus { initial, loading, success, failure }

/// State for [DeliveryListBloc].
class DeliveryListState extends Equatable {
  const DeliveryListState({
    this.status = DeliveryListStatus.initial,
    this.deliveryOrders = const [],
    this.failure,
    this.page = 1,
    this.hasReachedMax = false,
    this.selectedStatusFilter,
  });

  final DeliveryListStatus status;
  final List<DeliveryOrderEntity> deliveryOrders;
  final ApiFailure? failure;
  final int page;
  final bool hasReachedMax;

  /// null = "All", otherwise a specific status
  final DeliveryOrderStatus? selectedStatusFilter;

  @override
  List<Object?> get props => [
    status,
    deliveryOrders,
    failure,
    page,
    hasReachedMax,
    selectedStatusFilter,
  ];

  DeliveryListState copyWith({
    DeliveryListStatus? status,
    List<DeliveryOrderEntity>? deliveryOrders,
    ApiFailure? failure,
    int? page,
    bool? hasReachedMax,
    DeliveryOrderStatus? Function()? selectedStatusFilter,
  }) {
    return DeliveryListState(
      status: status ?? this.status,
      deliveryOrders: deliveryOrders ?? this.deliveryOrders,
      failure: failure ?? this.failure,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      selectedStatusFilter: selectedStatusFilter != null
          ? selectedStatusFilter()
          : this.selectedStatusFilter,
    );
  }
}
