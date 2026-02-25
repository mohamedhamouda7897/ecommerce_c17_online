import 'package:ecommerce_c17_online/features/auth/data/models/AuthResponse.dart';
import 'package:ecommerce_c17_online/features/auth/domain/entity/SignUpRequest.dart';
import 'package:ecommerce_c17_online/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUseCase {
  AuthRepository authRepository;

  SignupUseCase(this.authRepository);

  Future<AuthResponse> call(SignUpRequest request) {

    return authRepository.signUp(request);
  }
}
