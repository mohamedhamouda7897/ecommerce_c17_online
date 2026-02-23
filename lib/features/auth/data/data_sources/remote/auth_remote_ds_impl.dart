import 'package:ecommerce_c17_online/core/api/api_manager.dart';
import 'package:ecommerce_c17_online/core/api/endPoints.dart';
import 'package:ecommerce_c17_online/features/auth/data/data_sources/remote/auth_remote_ds.dart';
import 'package:ecommerce_c17_online/features/auth/data/models/AuthResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDs)
class AuthRemoteDsImpl implements AuthRemoteDs {
  ApiManager apiManager;

  AuthRemoteDsImpl(this.apiManager);

  @override
  Future<AuthResponse> login(String userName, String password) async {
    try {
      var response = await apiManager.post(
        Endpoints.signIn,
        data: {"email": userName, "password": password},
      );
      AuthResponse authResponse = AuthResponse.fromJson(response.data);
      return authResponse;
    } catch (e) {
      rethrow;
    }
  }
}
