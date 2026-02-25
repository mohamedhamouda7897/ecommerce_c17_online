import 'package:ecommerce_c17_online/features/auth/domain/entity/SignUpRequest.dart';

abstract class AuthEvents {}

class LoginEvent extends AuthEvents {
  String userName;
  String password;

  LoginEvent(this.userName, this.password);
}

class SignUpEvent extends AuthEvents {
  SignUpRequest request;

  SignUpEvent(this.request);
}
