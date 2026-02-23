import 'package:ecommerce_c17_online/features/auth/data/models/AuthResponse.dart';
import 'package:ecommerce_c17_online/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<AuthResponse> call(String username, String password) {
    return authRepository.login(username, password);
  }
}
