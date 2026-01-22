import 'package:equatable/equatable.dart';
import 'package:features_user/features_user.dart';

/// Authentication states
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

mixin AuthWebViewState on AuthState {
  bool get canGoBack;
}

/// Initial state
class AuthInitial extends AuthState with AuthWebViewState {
  const AuthInitial({this.canGoBack = false});

  @override
  final bool canGoBack;

  @override
  List<Object?> get props => [canGoBack];
}

/// Checking authentication status
class AuthLoading extends AuthState with AuthWebViewState {
  const AuthLoading({this.canGoBack = false});

  @override
  final bool canGoBack;

  @override
  List<Object?> get props => [canGoBack];
}

/// User is authenticated
class AuthAuthenticated extends AuthState with AuthWebViewState {
  final UserEntity user;

  const AuthAuthenticated(this.user, {this.canGoBack = false});

  @override
  final bool canGoBack;

  @override
  List<Object?> get props => [user, canGoBack];
}

/// User is not authenticated
class AuthUnauthenticated extends AuthState with AuthWebViewState {
  const AuthUnauthenticated({this.canGoBack = false});

  @override
  final bool canGoBack;

  @override
  List<Object?> get props => [canGoBack];
}

/// Authentication error
class AuthError extends AuthState with AuthWebViewState {
  final String message;

  const AuthError(this.message, {this.canGoBack = false});

  @override
  final bool canGoBack;

  @override
  List<Object?> get props => [message, canGoBack];
}
