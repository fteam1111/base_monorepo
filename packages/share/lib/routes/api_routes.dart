/// Centralized API routes management
class ApiRoutes {
  // API version prefix
  static const String v1 = '/api/v1';

  // Auth endpoints
  static const String login = '$v1/auth/login';
  static const String loginForTest = '$v1/auth/test-login';
  static const String logout = '$v1/auth/logout';
  static const String refreshToken = '$v1/auth/refresh';

  // User endpoints
  static const String getUser = '$v1/users/me';
  static const String getUsers = '$v1/users';

  static String userById(String id) => '$v1/user/$id';
}
