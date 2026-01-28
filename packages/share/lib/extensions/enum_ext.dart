/// Extension cho Enum
extension EnumExtension on Enum {
  /// Lấy tên enum dưới dạng string (ví dụ: MyEnum.value -> "value")
  ///
  /// Ví dụ:
  /// ```dart
  /// enum UserRole { admin, customer, guest }
  /// final role = UserRole.admin;
  /// print(role.name); // "admin"
  /// ```
  String get name => toString().split('.').last;

  /// Lấy tên đầy đủ của enum (ví dụ: MyEnum.value -> "MyEnum.value")
  ///
  /// Ví dụ:
  /// ```dart
  /// enum UserRole { admin, customer }
  /// final role = UserRole.admin;
  /// print(role.fullName); // "UserRole.admin"
  /// ```
  String get fullName => toString();

  /// So sánh enum với string
  ///
  /// Ví dụ:
  /// ```dart
  /// enum Status { active, inactive }
  /// final status = Status.active;
  /// if (status.isEqual('active')) {
  ///   print('Status is active');
  /// }
  /// ```
  bool isEqual(String value) => name == value;

  /// So sánh enum với enum khác (không cần cùng type)
  ///
  /// Ví dụ:
  /// ```dart
  /// enum Status1 { active }
  /// enum Status2 { active }
  /// final s1 = Status1.active;
  /// final s2 = Status2.active;
  /// if (s1.isEqualEnum(s2)) {
  ///   print('Both are active');
  /// }
  /// ```
  bool isEqualEnum(Enum other) => name == other.name;
}

/// Extension cho `List<Enum>` để hỗ trợ các thao tác với danh sách enum
extension EnumListExtension<T extends Enum> on List<T> {
  /// Tìm enum theo tên
  ///
  /// Ví dụ:
  /// ```dart
  /// enum UserRole { admin, customer, guest }
  /// final roles = [UserRole.admin, UserRole.customer, UserRole.guest];
  /// final found = roles.findByName('admin'); // UserRole.admin
  /// final notFound = roles.findByName('moderator'); // null
  /// ```
  T? findByName(String name) {
    try {
      return firstWhere((e) => e.name == name);
    } catch (_) {
      return null;
    }
  }

  /// Kiểm tra có chứa enum với tên cụ thể không
  ///
  /// Ví dụ:
  /// ```dart
  /// enum UserRole { admin, customer }
  /// final roles = [UserRole.admin, UserRole.customer];
  /// if (roles.containsName('admin')) {
  ///   print('Has admin role');
  /// }
  /// ```
  bool containsName(String name) => any((e) => e.name == name);

  /// Lấy danh sách tên của các enum
  ///
  /// Ví dụ:
  /// ```dart
  /// enum UserRole { admin, customer, guest }
  /// final roles = [UserRole.admin, UserRole.customer];
  /// final names = roles.names; // ["admin", "customer"]
  /// ```
  List<String> get names => map((e) => e.name).toList();

  /// Lấy danh sách tên đầy đủ của các enum
  ///
  /// Ví dụ:
  /// ```dart
  /// enum UserRole { admin, customer }
  /// final roles = [UserRole.admin];
  /// final fullNames = roles.fullNames; // ["UserRole.admin"]
  /// ```
  List<String> get fullNames => map((e) => e.fullName).toList();
}

/// Extension để convert String thành Enum
extension StringToEnumExtension on String {
  /// Convert string thành enum từ list
  ///
  /// Ví dụ:
  /// ```dart
  /// enum UserRole { admin, customer, guest }
  /// final role = 'admin'.toEnum([UserRole.admin, UserRole.customer]);
  /// print(role); // UserRole.admin
  ///
  /// final invalid = 'moderator'.toEnum([UserRole.admin]); // null
  /// ```
  T? toEnum<T extends Enum>(List<T> enumValues) {
    try {
      return enumValues.firstWhere(
        (e) => e.name.toLowerCase() == toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }

  /// Convert string thành enum (case-insensitive)
  ///
  /// Ví dụ:
  /// ```dart
  /// enum UserRole { admin, customer }
  /// final role1 = 'ADMIN'.toEnumCaseInsensitive([UserRole.admin]); // UserRole.admin
  /// final role2 = 'Admin'.toEnumCaseInsensitive([UserRole.admin]); // UserRole.admin
  /// ```
  T? toEnumCaseInsensitive<T extends Enum>(List<T> enumValues) {
    try {
      return enumValues.firstWhere(
        (e) => e.name.toLowerCase() == toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }
}

/// Extension để format enum name thành display text
extension EnumDisplayExtension on Enum {
  /// Format enum name thành display text (ví dụ: "myEnum" -> "My Enum")
  ///
  /// Ví dụ:
  /// ```dart
  /// enum UserRole { adminUser, customerService }
  /// final role = UserRole.adminUser;
  /// print(role.displayName); // "Admin User"
  /// ```
  String get displayName {
    final name = this.name;
    // Thêm space trước chữ hoa và capitalize
    final spaced = name.replaceAllMapped(
      RegExp(r'([A-Z])'),
      (match) => ' ${match.group(1)}',
    );
    return spaced
        .trim()
        .split(' ')
        .map((word) {
          if (word.isEmpty) return '';
          return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
        })
        .join(' ');
  }

  /// Format enum name thành camelCase
  ///
  /// Ví dụ:
  /// ```dart
  /// enum UserRole { AdminUser }
  /// final role = UserRole.AdminUser;
  /// print(role.camelCase); // "adminUser"
  /// ```
  String get camelCase {
    final name = this.name;
    if (name.isEmpty) return name;
    return '${name[0].toLowerCase()}${name.substring(1)}';
  }

  /// Format enum name thành PascalCase
  ///
  /// Ví dụ:
  /// ```dart
  /// enum UserRole { adminUser }
  /// final role = UserRole.adminUser;
  /// print(role.pascalCase); // "AdminUser"
  /// ```
  String get pascalCase {
    final name = this.name;
    if (name.isEmpty) return name;
    return '${name[0].toUpperCase()}${name.substring(1)}';
  }

  /// Format enum name thành snake_case
  ///
  /// Ví dụ:
  /// ```dart
  /// enum UserRole { adminUser, customerService }
  /// final role = UserRole.adminUser;
  /// print(role.snakeCase); // "admin_user"
  /// ```
  String get snakeCase {
    return name
        .replaceAllMapped(
          RegExp(r'([A-Z])'),
          (match) => '_${match.group(1)!.toLowerCase()}',
        )
        .replaceFirst(RegExp(r'^_'), '');
  }

  /// Format enum name thành kebab-case
  ///
  /// Ví dụ:
  /// ```dart
  /// enum UserRole { adminUser }
  /// final role = UserRole.adminUser;
  /// print(role.kebabCase); // "admin-user"
  /// ```
  String get kebabCase {
    return name
        .replaceAllMapped(
          RegExp(r'([A-Z])'),
          (match) => '-${match.group(1)!.toLowerCase()}',
        )
        .replaceFirst(RegExp(r'^-'), '');
  }
}
