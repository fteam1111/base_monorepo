/// Centralized API routes management
class ApiRoutes {
  // API version prefix
  static const String v1 = '/api/v1';
  static const String clientType = '/client';

  // Auth endpoints
  static const String login = '$v1/auth/login';
  static const String loginForTest = '$v1/auth/test-login';
  static const String logout = '$v1/auth/logout';
  static const String refreshToken = '$v1/auth/refresh';

  // User endpoints
  static const String getUser = '$v1$clientType/users/me';
  static const String getUsers = '$v1$clientType/users';

  // Role endpoints
  static const String getRoles = '$v1$clientType/roles';

  // Factory endpoints
  static const String getFactories = '$v1$clientType/factories';

  // Vehicle endpoints
  static const String vehicles = '$v1$clientType/vehicles';
  static const String vehiclesNeedingCharge = '$vehicles/needing-charge';
  static const String vehicleBySerial = '$vehicles/by-serial/{serialNumber}';
  static const String sendForDischarging =
      '$vehicles/{id}/send-for-discharging';
  static const String sendVehicleToQc = '$vehicles/{id}/send-to-qc';

  // Delivery Order endpoints
  static const String deliveryOrders = '$v1$clientType/delivery-orders';
  static const String deliveryOrderVehicles =
      '$deliveryOrders/{deliveryOrderId}/vehicles';

  static String userById(String id) => '$v1/user/$id';
}
