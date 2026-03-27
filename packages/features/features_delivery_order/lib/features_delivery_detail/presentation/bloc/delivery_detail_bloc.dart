import 'package:features_delivery_order/domain/usecases/add_vehicle_to_delivery_order_usecase.dart';
import 'package:features_delivery_order/domain/usecases/get_client_vehicles_usecase.dart';
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
    required GetClientVehiclesUseCase getClientVehiclesUseCase,
  }) : _getDeliveryOrderVehiclesUseCase = getDeliveryOrderVehiclesUseCase,
       _addVehicleToDeliveryOrderUseCase = addVehicleToDeliveryOrderUseCase,
       _getClientVehiclesUseCase = getClientVehiclesUseCase,
       super(const DeliveryDetailState()) {
    on<DeliveryDetailStarted>(_onStarted);
    on<DeliveryDetailAddVehicleRequested>(_onAddVehicleRequested);
    on<DeliveryDetailRefreshVehiclesRequested>(_onRefreshVehiclesRequested);
    on<DeliveryDetailTabChanged>(_onTabChanged);
    on<DeliveryDetailVinFilterChanged>(_onVinFilterChanged);
    on<DeliveryDetailModelFilterChanged>(_onModelFilterChanged);
    on<DeliveryDetailColorFilterChanged>(_onColorFilterChanged);
    on<DeliveryDetailSuggestedVehiclesRequested>(_onSuggestedVehiclesRequested);
  }

  final GetDeliveryOrderVehiclesUseCase _getDeliveryOrderVehiclesUseCase;
  final AddVehicleToDeliveryOrderUseCase _addVehicleToDeliveryOrderUseCase;
  final GetClientVehiclesUseCase _getClientVehiclesUseCase;

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

    // Initial load: fetch both the assigned DO vehicles and the suggested ones.
    await Future.wait([
      _fetchVehicles(emit: emit, deliveryOrderId: event.deliveryOrder.id),
      _fetchSuggestedVehicles(emit: emit),
    ]);
  }

  Future<void> _onTabChanged(
    DeliveryDetailTabChanged event,
    Emitter<DeliveryDetailState> emit,
  ) async {
    emit(state.copyWith(tabIndex: event.tabIndex));
  }

  Future<void> _onVinFilterChanged(
    DeliveryDetailVinFilterChanged event,
    Emitter<DeliveryDetailState> emit,
  ) async {
    emit(state.copyWith(vinFilter: () => event.vin));
  }

  Future<void> _onModelFilterChanged(
    DeliveryDetailModelFilterChanged event,
    Emitter<DeliveryDetailState> emit,
  ) async {
    emit(state.copyWith(modelFilter: () => event.model));
  }

  Future<void> _onColorFilterChanged(
    DeliveryDetailColorFilterChanged event,
    Emitter<DeliveryDetailState> emit,
  ) async {
    emit(state.copyWith(colorFilter: () => event.color));
  }

  Future<void> _onSuggestedVehiclesRequested(
    DeliveryDetailSuggestedVehiclesRequested event,
    Emitter<DeliveryDetailState> emit,
  ) async {
    await _fetchSuggestedVehicles(emit: emit);
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
        // Refresh both lists after a successful addition
        add(const DeliveryDetailRefreshVehiclesRequested());
        add(const DeliveryDetailSuggestedVehiclesRequested());
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

  Future<void> _fetchSuggestedVehicles({
    required Emitter<DeliveryDetailState> emit,
  }) async {
    emit(
      state.copyWith(
        suggestedVehiclesStatus: DeliveryDetailStatus.loading,
        suggestedVehiclesFailure: null,
      ),
    );

    final result = await _getClientVehiclesUseCase(
      page: 1,
      size: 50,
      // Fetch top 50 suggested vehicles
      serialNumber: state.vinFilter?.isNotEmpty == true
          ? state.vinFilter
          : null,
      model: state.modelFilter,
      color: state.colorFilter,
      isUnassigned: true, // Only show unassigned vehicles for pickup guide
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          suggestedVehiclesStatus: DeliveryDetailStatus.failure,
          suggestedVehiclesFailure: failure,
        ),
      ),
      (vehicles) => emit(
        state.copyWith(
          suggestedVehiclesStatus: DeliveryDetailStatus.success,
          suggestedVehicles: vehicles,
          suggestedVehiclesFailure: null,
        ),
      ),
    );
  }
}
