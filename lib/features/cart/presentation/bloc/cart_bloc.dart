import 'package:bloc/bloc.dart';
import 'package:ecommerce_c17_online/features/cart/domain/usecases/get_cart_details.dart';
import 'package:ecommerce_c17_online/features/cart/presentation/bloc/cart_events.dart';
import 'package:ecommerce_c17_online/features/cart/presentation/bloc/cart_state.dart';
import 'package:injectable/injectable.dart';

import '../../../auth/presentation/bloc/auth_states.dart';
@injectable
class CartBloc extends Bloc<CartEvents, CartState> {
  GetCartDetailsUseCase getCartDetailsUseCase;

  CartBloc(this.getCartDetailsUseCase) : super(CartState()) {
    on<GetCartDetailsDataEvent>(_getCartDetailsData);
  }

  _getCartDetailsData(
    GetCartDetailsDataEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(getCartDetailsStatus: RequestStatus.loading));
    try {
      var result = await getCartDetailsUseCase.call();
      emit(
        state.copyWith(
          getCartDetailsStatus: RequestStatus.success,
          cartResponse: result,
        ),
      );
    } catch (e) {
      emit(state.copyWith(getCartDetailsStatus: RequestStatus.failure));
    }
  }
}
