import 'package:ecommerce_c17_online/features/auth/data/models/AuthResponse.dart';
import 'package:ecommerce_c17_online/features/auth/domain/entity/SignUpRequest.dart';

abstract class AuthRemoteDs {
  Future<AuthResponse> login(String userName, String password);
  Future<AuthResponse> signUp(SignUpRequest request);
}
