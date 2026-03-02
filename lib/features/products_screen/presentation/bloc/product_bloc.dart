import 'package:bloc/bloc.dart';
import 'package:ecommerce_c17_online/core/error_handling/exceptions.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:ecommerce_c17_online/features/products_screen/domain/usecases/get_products_useCase.dart';
import 'package:ecommerce_c17_online/features/products_screen/presentation/bloc/product_events.dart';
import 'package:ecommerce_c17_online/features/products_screen/presentation/bloc/product_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductBloc extends Bloc<ProductEvents, ProductState> {
  GetProductsUseCase getProductsUseCase;

  ProductBloc(this.getProductsUseCase) : super(ProductState()) {
    on<GetProductsEvent>(_getproducts);
  }

  _getproducts(GetProductsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(getProductsStatus: RequestStatus.loading));
    try {
      var result = await getProductsUseCase.call(event.catID);

      emit(
        state.copyWith(
          getProductsStatus: RequestStatus.success,
          productResponse: result,
        ),
      );
    } on BaseException catch (e) {
      emit(
        state.copyWith(getProductsStatus: RequestStatus.failure, exception: e),
      );
    }
  }
}
