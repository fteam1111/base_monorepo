import 'package:features_delivery_order/domain/usecases/add_vehicle_to_delivery_order_usecase.dart';
import 'package:features_delivery_order/domain/usecases/get_delivery_order_vehicles_usecase.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_event.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// BLoC managing the Delivery Order detail screen.
@injectable
class DeliveryDetailBloc
    extends Bloc<DeliveryDetailEvent, DeliveryDetailState> {
  DeliveryDetailBloc({
    required GetDeliveryOrderVehiclesUseCase getDeliveryOrderVehiclesUseCase,
    required AddVehicleToDeliveryOrderUseCase addVehicleToDeliveryOrderUseCase,
  }) : _getDeliveryOrderVehiclesUseCase = getDeliveryOrderVehiclesUseCase,
       _addVehicleToDeliveryOrderUseCase = addVehicleToDeliveryOrderUseCase,
       super(const DeliveryDetailState()) {
    on<DeliveryDetailStarted>(_onStarted);
    on<DeliveryDetailAddVehicleRequested>(_onAddVehicleRequested);
    on<DeliveryDetailRefreshVehiclesRequested>(_onRefreshVehiclesRequested);
  }

  final GetDeliveryOrderVehiclesUseCase _getDeliveryOrderVehiclesUseCase;
  final AddVehicleToDeliveryOrderUseCase _addVehicleToDeliveryOrderUseCase;

  Future<void> _onStarted(
    DeliveryDetailStarted event,
    Emitter<DeliveryDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        status: DeliveryDetailStatus.loading,
        deliveryOrder: event.deliveryOrder,
        failure: null,
      ),
    );

    await _fetchVehicles(emit: emit, deliveryOrderId: event.deliveryOrder.id);
  }

  Future<void> _onRefreshVehiclesRequested(
    DeliveryDetailRefreshVehiclesRequested event,
    Emitter<DeliveryDetailState> emit,
  ) async {
    final doId = state.deliveryOrder?.id;
    if (doId == null) return;

    await _fetchVehicles(emit: emit, deliveryOrderId: doId);
  }

  Future<void> _onAddVehicleRequested(
    DeliveryDetailAddVehicleRequested event,
    Emitter<DeliveryDetailState> emit,
  ) async {
    final doId = state.deliveryOrder?.id;
    if (doId == null) return;

    emit(state.copyWith(addVehicleStatus: AddVehicleStatus.loading));

    final result = await _addVehicleToDeliveryOrderUseCase(
      deliveryOrderId: doId,
      vehicleId: event.vehicleId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          addVehicleStatus: AddVehicleStatus.failure,
          addVehicleFailure: failure,
        ),
      ),
      (updatedOrder) {
        emit(
          state.copyWith(
            addVehicleStatus: AddVehicleStatus.success,
            deliveryOrder: updatedOrder,
            addVehicleFailure: null,
          ),
        );
        // Refresh vehicles list after successful add
        add(const DeliveryDetailRefreshVehiclesRequested());
      },
    );
  }

  Future<void> _fetchVehicles({
    required Emitter<DeliveryDetailState> emit,
    required int deliveryOrderId,
  }) async {
    final result = await _getDeliveryOrderVehiclesUseCase(
      deliveryOrderId: deliveryOrderId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(status: DeliveryDetailStatus.failure, failure: failure),
      ),
      (vehicles) => emit(
        state.copyWith(
          status: DeliveryDetailStatus.success,
          vehicles: vehicles,
          failure: null,
        ),
      ),
    );
  }
}
