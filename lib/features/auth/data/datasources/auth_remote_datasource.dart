import '../models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> loginWithOtp({required String email, required String otp});
  Future<UserModel> signup(UserModel user);
}
