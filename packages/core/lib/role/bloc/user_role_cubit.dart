import 'package:bloc/bloc.dart';
import 'package:core/role/domain/usecases/get_client_roles_usecase.dart';

import 'user_role_state.dart';

class UserRoleCubit extends Cubit<UserRoleState> {
  UserRoleCubit(this._getClientRolesUseCase)
      : super(const UserRoleInitial());

  final GetClientRolesUseCase _getClientRolesUseCase;

  Future<void> loadRoles({int page = 1, int size = 10}) async {
    emit(const UserRoleLoading());

    final result = await _getClientRolesUseCase(page: page, size: size);

    result.fold(
      (failure) => emit(UserRoleLoadFailure(failure)),
      (pageEntity) => emit(UserRoleLoadSuccess(pageEntity)),
    );
  }
}

