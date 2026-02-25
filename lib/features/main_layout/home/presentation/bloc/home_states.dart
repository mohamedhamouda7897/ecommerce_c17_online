import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/data/model/CategoryModel.dart';

class HomeState {
  RequestStatus? getCategoriesStatus;
  String? getCategoriesErrorMessage;
  CategoryModel? categoryModel;

  HomeState({
    this.getCategoriesStatus = RequestStatus.init,
    this.getCategoriesErrorMessage,
    this.categoryModel,
  });

  HomeState copyWith({
    RequestStatus? getCategoriesStatus,
    String? getCategoriesErrorMessage,
    CategoryModel? categoryModel,
  }) {
    return HomeState(
      getCategoriesStatus: getCategoriesStatus ?? this.getCategoriesStatus,
      getCategoriesErrorMessage:
          getCategoriesErrorMessage ?? this.getCategoriesErrorMessage,
      categoryModel: categoryModel ?? this.categoryModel,
    );
  }
}
