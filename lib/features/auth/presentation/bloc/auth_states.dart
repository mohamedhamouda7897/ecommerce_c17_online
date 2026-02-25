import 'package:ecommerce_c17_online/features/auth/data/models/AuthResponse.dart';

enum RequestStatus { init, loading, success, failure }

class AuthStates {
  RequestStatus? loginRequestStatus;
  RequestStatus? signUpRequestStatus;
  AuthResponse? authResponse;
  AuthResponse? signUpResponse;
  String? errorMessage;
  String? signUpErrorMessage;

  AuthStates({
    this.loginRequestStatus = RequestStatus.init,
    this.authResponse,
    this.errorMessage,
    this.signUpRequestStatus = RequestStatus.init,
    this.signUpResponse,
    this.signUpErrorMessage,
  });

  AuthStates copyWith({
    RequestStatus? loginRequestStatus,
    AuthResponse? authResponse,
    String? errorMessage,
    RequestStatus? signUpRequestStatus,
    AuthResponse? signUpResponse,
    String? signUpErrorMessage,
  }) {
    return AuthStates(
      loginRequestStatus: loginRequestStatus ?? this.loginRequestStatus,
      authResponse: authResponse ?? this.authResponse,
      errorMessage: errorMessage ?? this.errorMessage,
      signUpRequestStatus: signUpRequestStatus ?? this.signUpRequestStatus,
      signUpResponse: signUpResponse ?? this.signUpResponse,
    );
  }
}
