import 'package:mobile_crm/features/auth/data/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserModel> login(String email, String password) {
    return remoteDataSource.login(email: email, password: password);
  }

  @override
  Future<UserModel> loginWithOtp(String email, String otp) {
    return remoteDataSource.loginWithOtp(email: email, otp: otp);
  }

  @override
  Future<UserModel> signup(UserModel user) {
    return remoteDataSource.signup(user);
  }
}
