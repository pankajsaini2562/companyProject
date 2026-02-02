import 'package:equatable/equatable.dart';
import '../../data/models/user_model.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class LoginOtpEvent extends AuthEvent {
  final String email;
  final String otp;

  LoginOtpEvent(this.email, this.otp);
}

class SignupEvent extends AuthEvent {
  final UserModel user;

  SignupEvent(this.user);
}
