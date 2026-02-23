import 'package:bloc/bloc.dart';
import 'package:ecommerce_c17_online/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_events.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(AuthStates()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(loginRequestStatus: RequestStatus.loading));

      try {
        var response = await loginUseCase.call(event.userName, event.password);

        emit(
          state.copyWith(
            loginRequestStatus: RequestStatus.success,
            authResponse: response,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            loginRequestStatus: RequestStatus.failure,
            errorMessage: "Something went wrong",
          ),
        );
      }
    });
    on<C>((event, emit) {});
  }
}
