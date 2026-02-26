import 'package:bloc/bloc.dart';
import 'package:core/role/domain/usecases/get_client_roles_usecase.dart';

import 'user_role_state.dart';

class UserRoleCubit extends Cubit<UserRoleState> {
  UserRoleCubit(this._getClientRolesUseCase)
      : super(const UserRoleState());

  final GetClientRolesUseCase _getClientRolesUseCase;

  Future<void> loadRoles({int? page, int? size}) async {
    emit(state.copyWith(
      status: UserRoleStatus.loading,
      clearFailure: true,
    ));

    final result = await _getClientRolesUseCase(page: page, size: size);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: UserRoleStatus.failure,
          failure: failure,
        ),
      ),
      (roles) => emit(
        state.copyWith(
          status: UserRoleStatus.success,
          roles: roles,
          clearFailure: true,
        ),
      ),
    );
  }
}
