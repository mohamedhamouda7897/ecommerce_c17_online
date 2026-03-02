import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:ecommerce_c17_online/features/cart/data/models/cart_reponse.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/data/model/CategoryModel.dart';

class HomeState {
  RequestStatus? getCategoriesStatus;
  String? getCategoriesErrorMessage;
  CategoryModel? categoryModel;


  RequestStatus? getCartDetailsStatus;
  String? getCartDetailsErrorMessage;
  CartResponse? cartResponse;

  HomeState({
    this.getCategoriesStatus = RequestStatus.init,
    this.getCategoriesErrorMessage,
    this.categoryModel,
    this.getCartDetailsStatus=RequestStatus.init,
    this.getCartDetailsErrorMessage,
    this.cartResponse,
  });

  HomeState copyWith({
    RequestStatus? getCategoriesStatus,
    String? getCategoriesErrorMessage,
    CategoryModel? categoryModel,
    RequestStatus? getCartDetailsStatus,
    String? getCartDetailsErrorMessage,
    CartResponse? cartResponse,
  }) {
    return HomeState(
      getCategoriesStatus: getCategoriesStatus ?? this.getCategoriesStatus,
      getCategoriesErrorMessage:
          getCategoriesErrorMessage ?? this.getCategoriesErrorMessage,
      categoryModel: categoryModel ?? this.categoryModel,
      getCartDetailsStatus: getCartDetailsStatus ?? this.getCartDetailsStatus,
      getCartDetailsErrorMessage:
          getCartDetailsErrorMessage ?? this.getCartDetailsErrorMessage,
      cartResponse: cartResponse ?? this.cartResponse,
    );
  }
}
