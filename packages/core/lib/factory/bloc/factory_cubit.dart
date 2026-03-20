import 'package:bloc/bloc.dart';
import 'package:core/factory/domain/usecases/get_client_factories_usecase.dart';

import 'package:core/factory/bloc/factory_state.dart';

class FactoryCubit extends Cubit<FactoryState> {
  FactoryCubit(this._getClientFactoriesUseCase)
      : super(const FactoryState());

  final GetClientFactoriesUseCase _getClientFactoriesUseCase;

  Future<void> loadFactories() async {
    emit(state.copyWith(
      status: FactoryStatus.loading,
      clearFailure: true,
    ));

    final result = await _getClientFactoriesUseCase();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FactoryStatus.failure,
          failure: failure,
        ),
      ),
      (factories) => emit(
        state.copyWith(
          status: FactoryStatus.success,
          factories: factories,
          clearFailure: true,
        ),
      ),
    );
  }
}

