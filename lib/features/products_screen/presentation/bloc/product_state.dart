import 'package:ecommerce_c17_online/core/error_handling/exceptions.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:ecommerce_c17_online/features/products_screen/data/models/ProductResponse.dart';

class ProductState {
  RequestStatus? getProductsStatus;
  ProductResponse? productResponse;
  BaseException? exception;

  ProductState({
    this.getProductsStatus = RequestStatus.init,
    this.productResponse,
    this.exception,
  });

  ProductState copyWith({
    RequestStatus? getProductsStatus,
    ProductResponse? productResponse,
    BaseException? exception,
  }) {
    return ProductState(
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
      productResponse: productResponse ?? this.productResponse,
      exception: exception ?? this.exception,
    );
  }
}
