import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:core/core.dart';
import 'package:features_parking_history/domain/usecases/get_vehicle_histories_usecase.dart';
import 'package:features_parking_history/presentation/bloc/vehicle_history_event.dart';
import 'package:features_parking_history/presentation/bloc/vehicle_history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';

class VehicleHistoryBloc
    extends Bloc<VehicleHistoryEvent, VehicleHistoryState> {
  VehicleHistoryBloc(this._getVehicleHistoriesUseCase)
    : super(const VehicleHistoryState()) {
    on<VehicleHistoryStarted>(_onStarted);
    on<VehicleHistoryRefreshed>(_onRefreshed);
    on<VehicleHistoryLoadMoreRequested>(
      _onLoadMoreRequested,
      transformer: droppable(),
    );
  }

  final GetVehicleHistoriesUseCase _getVehicleHistoriesUseCase;
  int _vehicleId = 0;

  Future<void> _onStarted(
    VehicleHistoryStarted event,
    Emitter<VehicleHistoryState> emit,
  ) async {
    _vehicleId = event.vehicleId;
    await _fetchData(emit, isRefresh: true);
  }

  Future<void> _onRefreshed(
    VehicleHistoryRefreshed event,
    Emitter<VehicleHistoryState> emit,
  ) async {
    if (_vehicleId == 0) return;
    await _fetchData(emit, isRefresh: true);
  }

  Future<void> _onLoadMoreRequested(
    VehicleHistoryLoadMoreRequested event,
    Emitter<VehicleHistoryState> emit,
  ) async {
    if (_vehicleId == 0 || state.hasReachedMax || state.isLoading) return;
    await _fetchData(emit, isRefresh: false);
  }

  Future<void> _fetchData(
    Emitter<VehicleHistoryState> emit, {
    required bool isRefresh,
  }) async {
    if (isRefresh) {
      emit(
        state.copyWith(
          status: VehicleHistoryStatus.loading,
          page: 1,
          hasReachedMax: false,
          errorMessage: () => null,
        ),
      );
    }

    final currentPage = state.page;
    final result = await _getVehicleHistoriesUseCase(
      GetVehicleHistoriesParams(
        vehicleId: _vehicleId,
        page: currentPage,
        size: AppConstants.defaultPageSize,
      ),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: VehicleHistoryStatus.failure,
            errorMessage: () => failure.nonTranslatedFailureMessage,
          ),
        );
      },
      (pagination) {
        final newItems = pagination.data ?? [];
        final isLastPage = newItems.length < AppConstants.defaultPageSize;

        final allHistories = isRefresh
            ? newItems
            : [...state.allHistories, ...newItems];

        emit(
          state.copyWith(
            status: VehicleHistoryStatus.success,
            allHistories: allHistories,
            hasReachedMax: isLastPage,
            page: currentPage + 1,
          ),
        );
      },
    );
  }
}
