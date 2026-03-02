import 'package:bloc/bloc.dart';
import 'package:ecommerce_c17_online/core/error_handling/exceptions.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:ecommerce_c17_online/features/cart/domain/usecases/add_to_cart.dart';
import 'package:ecommerce_c17_online/features/product_details/presentation/bloc/product_details_events.dart';
import 'package:ecommerce_c17_online/features/product_details/presentation/bloc/product_details_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsBloc
    extends Bloc<ProductDetailsEvents, ProductDetailsState> {
  AddToCartUseCase addToCartUseCase;

  ProductDetailsBloc(this.addToCartUseCase) : super(ProductDetailsState()) {
    on<AddToCartEvent>(_addToCart);
  }

  _addToCart(AddToCartEvent event, Emitter<ProductDetailsState> emit) async {
    emit(state.copyWith(getProductsDetailsStatus: RequestStatus.loading));
    try {
      var result = await addToCartUseCase.call(event.productId);

      emit(
        state.copyWith(
          getProductsDetailsStatus: RequestStatus.success,
          isAdded: result,
        ),
      );
    } on BaseException catch (e) {
      emit(
        state.copyWith(
          getProductsDetailsStatus: RequestStatus.failure,
          exception: e,
        ),
      );
    }
  }
}
