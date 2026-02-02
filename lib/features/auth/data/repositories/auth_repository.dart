import '../models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(String email, String password);
  Future<UserModel> loginWithOtp(String email, String otp);
  Future<UserModel> signup(UserModel user);
}
