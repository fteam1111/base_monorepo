import 'package:equatable/equatable.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_status.dart';

/// Events for [DeliveryListBloc].
abstract class DeliveryListEvent extends Equatable {
  const DeliveryListEvent();

  @override
  List<Object?> get props => [];
}

/// Initial load of delivery orders.
class DeliveryListStarted extends DeliveryListEvent {
  const DeliveryListStarted();
}

/// Pull-to-refresh requested.
class DeliveryListRefreshRequested extends DeliveryListEvent {
  const DeliveryListRefreshRequested();
}

/// Load more (pagination) requested.
class DeliveryListLoadMoreRequested extends DeliveryListEvent {
  const DeliveryListLoadMoreRequested();
}

/// Status filter tab changed.
class DeliveryListStatusFilterChanged extends DeliveryListEvent {
  const DeliveryListStatusFilterChanged(this.status);

  /// null = all, otherwise a specific status
  final DeliveryOrderStatus? status;

  @override
  List<Object?> get props => [status];
}
