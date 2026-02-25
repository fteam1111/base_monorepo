import 'package:core/core.dart';

/// Domain entity đại diện cho trang danh sách role từ API client roles.
class UserRolePageEntity {
  UserRolePageEntity({
    required this.total,
    required this.page,
    required this.size,
    required this.totalPages,
    required this.roles,
  });

  final int total;
  final int page;
  final int size;
  final int totalPages;
  final List<UserRole> roles;
}

