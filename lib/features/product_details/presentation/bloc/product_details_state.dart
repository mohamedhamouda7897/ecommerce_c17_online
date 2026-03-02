import 'package:ecommerce_c17_online/core/error_handling/exceptions.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:ecommerce_c17_online/features/products_screen/data/models/ProductResponse.dart';

class ProductDetailsState {
  RequestStatus? getProductsDetailsStatus;
  bool? isAdded;
  BaseException? exception;

  ProductDetailsState({
    this.getProductsDetailsStatus = RequestStatus.init,
    this.isAdded,
    this.exception,
  });

  ProductDetailsState copyWith({
    RequestStatus? getProductsDetailsStatus,
    bool? isAdded,
    BaseException? exception,
  }) {
    return ProductDetailsState(
      getProductsDetailsStatus:
          getProductsDetailsStatus ?? this.getProductsDetailsStatus,
      isAdded: isAdded ?? this.isAdded,
      exception: exception ?? this.exception,
    );
  }
}
