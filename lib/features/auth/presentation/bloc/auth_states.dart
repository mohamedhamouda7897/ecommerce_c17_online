import 'package:ecommerce_c17_online/features/auth/data/models/AuthResponse.dart';

enum RequestStatus { init, loading, success, failure }

class AuthStates {
  RequestStatus? loginRequestStatus;
  AuthResponse? authResponse;
  String? errorMessage;

  AuthStates({
    this.loginRequestStatus = RequestStatus.init,
    this.authResponse,
    this.errorMessage,
  });

  AuthStates copyWith({
    RequestStatus? loginRequestStatus,
    AuthResponse? authResponse,
    String? errorMessage,
  }) {
    return AuthStates(
      loginRequestStatus: loginRequestStatus ?? this.loginRequestStatus,
      authResponse: authResponse ?? this.authResponse,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
