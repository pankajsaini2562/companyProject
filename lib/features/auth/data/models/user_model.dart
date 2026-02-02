class UserModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String? phone;
  final UserRole? role;

  UserModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.role,
  });

  // json -> Dart

  /// JSON → Dart
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      role: json['role'] != null
          ? UserRoleExtension.fromString(json['role'])
          : null,
    );
  }

  /// Dart → JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      if (phone != null) 'phone': phone,
      if (role != null) 'role': role!.name,
    };
  }
}

extension UserRoleExtension on UserRole {
  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
      (e) => e.name == value,
      orElse: () => UserRole.EMPLOYEE,
    );
  }
}

enum UserRole { ADMIN, HR, EMPLOYEE, ACCOUNTS, PARTNER }
