import 'package:core/core.dart';
import 'package:features_auth/features_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Authentication BLoC
/// Handles all authentication-related business logic
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  AuthBloc({
    required LoginUseCase loginUseCase,
    required LogoutUseCase logoutUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
  }) : _loginUseCase = loginUseCase,
       _logoutUseCase = logoutUseCase,
       _getCurrentUserUseCase = getCurrentUserUseCase,
       super(const AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    on<AuthTokenRefreshRequested>(_onAuthTokenRefreshRequested);
    on<AuthWebViewBackAvailabilityChanged>(_onWebViewBackAvailabilityChanged);
    on<AuthWebViewTokenExtracted>(_onWebViewTokenExtracted);
  }

  void _onWebViewBackAvailabilityChanged(
    AuthWebViewBackAvailabilityChanged event,
    Emitter<AuthState> emit,
  ) {
    final current = state;
    if (current is AuthWebViewState) {
      if (current.canGoBack == event.canGoBack) return;

      if (current is AuthInitial) {
        emit(AuthInitial(canGoBack: event.canGoBack));
      } else if (current is AuthLoading) {
        emit(AuthLoading(canGoBack: event.canGoBack));
      } else if (current is AuthUnauthenticated) {
        emit(AuthUnauthenticated(canGoBack: event.canGoBack));
      } else if (current is AuthError) {
        emit(AuthError(current.message, canGoBack: event.canGoBack));
      } else if (current is AuthAuthenticated) {
        emit(AuthAuthenticated(current.user, canGoBack: event.canGoBack));
      }
    }
  }

  void _onWebViewTokenExtracted(
    AuthWebViewTokenExtracted event,
    Emitter<AuthState> emit,
  ) {
    add(AuthLoginRequested(email: event.rawToken, password: ''));
  }

  /// Check authentication status on app start
  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final result = await _getCurrentUserUseCase();

    result.fold(
      (error) => emit(const AuthUnauthenticated()),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  /// Handle login request
  Future<void> _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final result = await _loginUseCase.loginForTest();

    await result.fold(
      (error) async => emit(AuthError(error.failureMessage.message)),
      (token) async {
        final userResult = await _getCurrentUserUseCase();

        userResult.fold(
          (error) => emit(AuthError(error.failureMessage.message)),
          (user) => emit(AuthAuthenticated(user)),
        );
      },
    );
  }

  /// Handle logout request
  Future<void> _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final result = await _logoutUseCase();

    result.fold(
      (error) => emit(AuthError(error.failureMessage.message)),
      (_) => emit(const AuthUnauthenticated()),
    );
  }

  /// Handle token refresh
  Future<void> _onAuthTokenRefreshRequested(
    AuthTokenRefreshRequested event,
    Emitter<AuthState> emit,
  ) async {
    // Fetch user data again with refreshed token
    final userResult = await _getCurrentUserUseCase();

    userResult.fold(
      (error) => emit(const AuthUnauthenticated()),
      (user) => emit(AuthAuthenticated(user)),
    );
  }
}
