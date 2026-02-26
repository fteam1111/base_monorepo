import 'package:equatable/equatable.dart';

class UserRoleEntity extends Equatable {
  final int id;
  final String name;

  const UserRoleEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  @override
  String toString() => 'UserRoleEntity(id: $id, name: $name)';
}

/// Extension để check role type từ UserRoleEntity
extension UserRoleEntityExtension on UserRoleEntity {
  /// Check nếu role là super_admin
  bool get isSuperAdmin => name == 'super_admin' || id == 1;

  /// Check nếu role là team_leader
  bool get isTeamLeader => name == 'team_leader' || id == 2;

  /// Check nếu role là qc
  bool get isQc => name == 'qc' || id == 3;

  /// Check nếu role là employee
  bool get isEmployee => name == 'employee' || id == 4;

  /// Check nếu role là unknown
  bool get isUnknown => name == 'unknown' || id == 0;
}