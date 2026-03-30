import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_status.dart';
import 'package:features_delivery_order/domain/usecases/get_delivery_order_list_usecase.dart';
import 'package:features_delivery_order/features_delivery_list/presentation/bloc/delivery_list_event.dart';
import 'package:features_delivery_order/features_delivery_list/presentation/bloc/delivery_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

const _pageSize = 20;

/// BLoC managing the Delivery Order list screen.
@injectable
class DeliveryListBloc extends Bloc<DeliveryListEvent, DeliveryListState> {
  DeliveryListBloc({
    required GetDeliveryOrderListUseCase getDeliveryOrderListUseCase,
  }) : _getDeliveryOrderListUseCase = getDeliveryOrderListUseCase,
       super(const DeliveryListState()) {
    on<DeliveryListStarted>(_onStarted);
    on<DeliveryListRefreshRequested>(_onRefreshRequested);
    on<DeliveryListLoadMoreRequested>(
      _onLoadMoreRequested,
      transformer: droppable(),
    );
    on<DeliveryListStatusFilterChanged>(_onStatusFilterChanged);
  }

  final GetDeliveryOrderListUseCase _getDeliveryOrderListUseCase;

  Future<void> _onStarted(
    DeliveryListStarted event,
    Emitter<DeliveryListState> emit,
  ) async {
    emit(state.copyWith(status: DeliveryListStatus.loading, failure: null));
    await _fetchDeliveryOrders(emit: emit, page: 1, isRefresh: true);
  }

  Future<void> _onRefreshRequested(
    DeliveryListRefreshRequested event,
    Emitter<DeliveryListState> emit,
  ) async {
    await _fetchDeliveryOrders(emit: emit, page: 1, isRefresh: true);
  }

  Future<void> _onLoadMoreRequested(
    DeliveryListLoadMoreRequested event,
    Emitter<DeliveryListState> emit,
  ) async {
    if (state.hasReachedMax) return;

    final nextPage = state.page + 1;
    emit(state.copyWith(status: DeliveryListStatus.loading));
    await _fetchDeliveryOrders(emit: emit, page: nextPage, isRefresh: false);
  }

  Future<void> _onStatusFilterChanged(
    DeliveryListStatusFilterChanged event,
    Emitter<DeliveryListState> emit,
  ) async {
    emit(
      state.copyWith(
        deliveryOrders: [],
        status: DeliveryListStatus.loading,
        selectedStatusFilter: () => event.status,
        failure: null,
      ),
    );

    await _fetchDeliveryOrders(
      emit: emit,
      page: 1,
      isRefresh: true,
      statusFilter: event.status,
    );
  }

  Future<void> _fetchDeliveryOrders({
    required Emitter<DeliveryListState> emit,
    required int page,
    required bool isRefresh,
    DeliveryOrderStatus? statusFilter,
  }) async {
    final filter = statusFilter ?? state.selectedStatusFilter;

    final result = await _getDeliveryOrderListUseCase(
      page: page,
      size: _pageSize,
      status: filter?.apiValue,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(status: DeliveryListStatus.failure, failure: failure),
      ),
      (orders) {
        final allOrders = isRefresh
            ? orders
            : [...state.deliveryOrders, ...orders];

        emit(
          state.copyWith(
            status: DeliveryListStatus.success,
            deliveryOrders: allOrders,
            page: page,
            hasReachedMax: orders.length < _pageSize,
            failure: null,
          ),
        );
      },
    );
  }
}
