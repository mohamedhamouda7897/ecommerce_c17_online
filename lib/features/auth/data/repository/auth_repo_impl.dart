import 'package:ecommerce_c17_online/features/auth/data/data_sources/remote/auth_remote_ds.dart';
import 'package:ecommerce_c17_online/features/auth/data/models/AuthResponse.dart';
import 'package:ecommerce_c17_online/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepository)
class AuthRepoImpl implements AuthRepository {
  AuthRemoteDs authRemoteDs;

  AuthRepoImpl(this.authRemoteDs);

  @override
  Future<AuthResponse> login(String username, String password) async {
    try {
      AuthResponse response = await authRemoteDs.login(username, password);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
