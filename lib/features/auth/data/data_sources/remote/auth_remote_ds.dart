import 'package:ecommerce_c17_online/features/auth/data/models/AuthResponse.dart';

abstract class AuthRemoteDs {
  Future<AuthResponse> login(String userName, String password);
}
