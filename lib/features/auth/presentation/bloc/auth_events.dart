abstract class AuthEvents {}

class LoginEvent extends AuthEvents {
  String userName;
  String password;

  LoginEvent(this.userName, this.password);
}


class C extends AuthEvents{}