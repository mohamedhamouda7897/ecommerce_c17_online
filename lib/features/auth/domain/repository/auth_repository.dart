import 'package:ecommerce_c17_online/features/auth/data/models/AuthResponse.dart';
import 'package:ecommerce_c17_online/features/auth/domain/entity/SignUpRequest.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(String username, String password);
  Future<AuthResponse> signUp(SignUpRequest request);
}
