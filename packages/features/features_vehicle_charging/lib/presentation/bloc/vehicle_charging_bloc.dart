import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:core/core.dart';
import 'package:features_auth/features_auth.dart';
import 'package:features_vehicle_charging/features_vehicle_charging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

const _pageSize = 20;

@injectable
class VehicleChargingBloc
    extends Bloc<VehicleChargingEvent, VehicleChargingState> {
  final AuthBloc _authBloc;
  final GetVehicleChargingListUseCase _getVehicleChargingListUseCase;
  final SendForDischargingUseCase _sendForDischargingUseCase;

  VehicleChargingBloc({
    required GetVehicleChargingListUseCase getVehicleChargingListUseCase,
    required SendForDischargingUseCase sendForDischargingUseCase,
    required AuthBloc authBloc,
  }) : _getVehicleChargingListUseCase = getVehicleChargingListUseCase,
       _sendForDischargingUseCase = sendForDischargingUseCase,
       _authBloc = authBloc,
       super(const VehicleChargingState()) {
    on<VehicleChargingStarted>(_onStarted);
    on<VehicleChargingRefreshRequested>(_onRefreshRequested);
    on<VehicleChargingLoadMoreRequested>(
      _onLoadMoreRequested,
      transformer: droppable(),
    );
    on<VehicleChargingDischargeRequested>(_onDischargeRequested);
  }

  int? get _factoryId {
    final authState = _authBloc.state;
    if (authState is AuthAuthenticated) {
      return authState.user.factory?.id;
    }
    return null;
  }

  Future<void> _onStarted(
    VehicleChargingStarted event,
    Emitter<VehicleChargingState> emit,
  ) async {
    if (_authBloc.state is! AuthAuthenticated) {
      emit(
        state.copyWith(
          status: VehicleChargingStatus.failure,
          failure: const ApiFailure.other('User not authenticated'),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: VehicleChargingStatus.loading,
        failure: null,
      ),
    );

    await _fetchVehicles(
      emit: emit,
      page: 1,
      serialNumber: event.serialNumber,
      isRefresh: true,
    );
  }

  Future<void> _onRefreshRequested(
    VehicleChargingRefreshRequested event,
    Emitter<VehicleChargingState> emit,
  ) async {
    await _fetchVehicles(emit: emit, page: 1, isRefresh: true);
  }

  Future<void> _onLoadMoreRequested(
    VehicleChargingLoadMoreRequested event,
    Emitter<VehicleChargingState> emit,
  ) async {
    if (state.hasReachedMax) return;

    final nextPage = state.page + 1;
    emit(state.copyWith(status: VehicleChargingStatus.loading));

    await _fetchVehicles(emit: emit, page: nextPage, isRefresh: false);
  }

  Future<void> _onDischargeRequested(
    VehicleChargingDischargeRequested event,
    Emitter<VehicleChargingState> emit,
  ) async {
    emit(state.copyWith(dischargeStatus: DischargeStatus.loading));

    final result = await _sendForDischargingUseCase(vehicleId: event.vehicleId);

    result.fold(
      (failure) => emit(
        state.copyWith(
          dischargeStatus: DischargeStatus.failure,
          dischargeFailure: failure,
        ),
      ),
      (vehicle) => emit(
        state.copyWith(
          dischargeStatus: DischargeStatus.success,
          lastDischargedVehicle: vehicle,
          dischargeFailure: null,
        ),
      ),
    );
  }

  Future<void> _fetchVehicles({
    required Emitter<VehicleChargingState> emit,
    required int page,
    required bool isRefresh,
    String? serialNumber,
  }) async {
    final result = await _getVehicleChargingListUseCase(
      page: page,
      size: _pageSize,
      serialNumber: serialNumber,
      factoryId: _factoryId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: VehicleChargingStatus.failure,
          failure: failure,
        ),
      ),
      (vehicles) {
        final allVehicles = isRefresh
            ? vehicles
            : [...state.vehicles, ...vehicles];

        emit(
          state.copyWith(
            status: VehicleChargingStatus.success,
            vehicles: allVehicles,
            page: page,
            hasReachedMax: vehicles.length < _pageSize,
            failure: null,
          ),
        );
      },
    );
  }
}
