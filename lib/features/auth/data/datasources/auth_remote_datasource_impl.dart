import 'dart:async';
import '../models/user_model.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1)); // fake API delay

    if (password != '123456') {
      throw Exception('Invalid credentials');
    }

    return UserModel(
      email: email,
      password: password,
      firstName: 'John',
      lastName: 'Doe',
      phone: '9999999999',
      role: UserRole.EMPLOYEE,
    );
  }

  @override
  Future<UserModel> loginWithOtp({
    required String email,
    required String otp,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (otp != '0000') {
      throw Exception('Invalid OTP');
    }

    return UserModel(
      email: email,
      password: '',
      firstName: 'OTP',
      lastName: 'User',
      phone: null,
      role: UserRole.EMPLOYEE,
    );
  }

  @override
  Future<UserModel> signup(UserModel user) async {
    await Future.delayed(const Duration(seconds: 1));
    return user; // backend would return created user
  }
}
