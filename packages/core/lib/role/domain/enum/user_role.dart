/// Global user role definition used across the app.
///
/// Được map trực tiếp từ payload API `/api/v1/client/roles`:
/// ```json
/// {
///   "id": 1,
///   "name": "super_admin"
/// }
/// ```
///
/// Lưu ý:
/// - `id` được lưu dưới dạng `String` để tránh phụ thuộc chặt vào literal `int`.
/// - Các feature (auth, DO, map...) chỉ cần dùng enum này để nhận diện role.
enum UserRole {
  superAdmin(id: '1', apiName: 'super_admin'),
  teamLeader(id: '2', apiName: 'team_leader'),
  qc(id: '3', apiName: 'qc'),
  employee(id: '4', apiName: 'employee'),
  unknown(id: '0', apiName: 'unknown');

  const UserRole({required this.id, required this.apiName});

  /// Id role dưới dạng `String` (không dùng literal `int` trực tiếp).
  final String id;

  /// Tên role trả về từ API.
  final String apiName;

  /// Tìm role từ `name` trả về bởi API.
  static UserRole fromApiName(String name) {
    return values.firstWhere(
      (role) => role.apiName == name,
      orElse: () => UserRole.unknown,
    );
  }

  /// Tìm role từ `id` trả về bởi API.
  static UserRole fromApiId(int apiId) {
    return values.firstWhere(
      (role) => role.id == apiId.toString(),
      orElse: () => UserRole.unknown,
    );
  }
}
