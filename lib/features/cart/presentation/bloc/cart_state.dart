import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:ecommerce_c17_online/features/cart/data/models/cart_reponse.dart';

class CartState {
  RequestStatus? getCartDetailsStatus;
  CartResponse? cartResponse;
  String? getCartDetailsErrorMessage;

  CartState({
    this.getCartDetailsStatus,
    this.cartResponse,
    this.getCartDetailsErrorMessage,
  });

  CartState copyWith({
    RequestStatus? getCartDetailsStatus,
    CartResponse? cartResponse,
    String? getCartDetailsErrorMessage,
  }) {
    return CartState(
      getCartDetailsStatus: getCartDetailsStatus ?? this.getCartDetailsStatus,
      cartResponse: cartResponse ?? this.cartResponse,
      getCartDetailsErrorMessage:
          getCartDetailsErrorMessage ?? this.getCartDetailsErrorMessage,
    );
  }
}
