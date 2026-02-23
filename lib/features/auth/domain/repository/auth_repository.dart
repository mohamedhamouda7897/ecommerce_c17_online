import 'package:ecommerce_c17_online/features/auth/data/models/AuthResponse.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(String username, String password);
}
