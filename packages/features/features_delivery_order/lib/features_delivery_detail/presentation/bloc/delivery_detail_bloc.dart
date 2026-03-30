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
    on<DeliveryDetailScannedVinReceived>(_onScannedVinReceived);
    on<DeliveryDetailScanReset>(_onScanReset);
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

    emit(
      state.copyWith(
        addVehicleStatus: AddVehicleStatus.loading,
        addVehicleFailure: null,
      ),
    );

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
        add(const DeliveryDetailRefreshVehiclesRequested());
        add(const DeliveryDetailSuggestedVehiclesRequested());
      },
    );
  }

  /// Handler for scanned VIN: uses pre-fetched vehicle → compares with DO items.
  Future<void> _onScannedVinReceived(
    DeliveryDetailScannedVinReceived event,
    Emitter<DeliveryDetailState> emit,
  ) async {
    final scannedVehicle = event.scannedVehicle;
    final doItems = state.deliveryOrder?.items ?? [];
    final scannedSerial = scannedVehicle.serialNumber;
    final selectedSerial = event.selectedVehicleSerialNumber;

    // Case 1: exact match — same serial number
    if (scannedSerial == selectedSerial) {
      emit(
        state.copyWith(
          scanVerificationStatus: ScanVerificationStatus.exactMatch,
          scannedVehicle: () => scannedVehicle,
        ),
      );
      return;
    }

    // Check if scanned vehicle's model+color matches any DO item
    final isCompatible = doItems.any(
      (item) =>
          item.vehicleModel == scannedVehicle.model &&
          item.color == scannedVehicle.color,
    );

    if (isCompatible) {
      // Case 2: different vehicle but compatible model/color
      emit(
        state.copyWith(
          scanVerificationStatus: ScanVerificationStatus.compatibleMatch,
          scannedVehicle: () => scannedVehicle,
        ),
      );
    } else {
      // Case 3: incompatible model/color
      emit(
        state.copyWith(
          scanVerificationStatus: ScanVerificationStatus.incompatible,
          scannedVehicle: () => scannedVehicle,
        ),
      );
    }
  }

  /// Resets scan verification state to initial.
  Future<void> _onScanReset(
    DeliveryDetailScanReset event,
    Emitter<DeliveryDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        scanVerificationStatus: ScanVerificationStatus.initial,
        scannedVehicle: () => null,
        scanFailure: () => null,
      ),
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
        suggestedVehicles: [],
        suggestedVehiclesFailure: null,
      ),
    );

    final result = await _getClientVehiclesUseCase(
      page: 1,
      size: 50,
      serialNumber: state.vinFilter?.isNotEmpty == true
          ? state.vinFilter
          : null,
      model: state.modelFilter,
      color: state.colorFilter,
      isUnassigned: true,
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
