import 'package:equatable/equatable.dart';

/// Entity representing app initialization status
class AppInitEntity extends Equatable {
  final bool isInitialized;
  final bool isAuthenticated;
  final String? userId;
  final String? errorMessage;

  const AppInitEntity({
    required this.isInitialized,
    required this.isAuthenticated,
    this.userId,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
    isInitialized,
    isAuthenticated,
    userId,
    errorMessage,
  ];

  @override
  String toString() {
    return 'AppInitEntity(isInitialized: $isInitialized, isAuthenticated: $isAuthenticated, userId: $userId)';
  }
}
