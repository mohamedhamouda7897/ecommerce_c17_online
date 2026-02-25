import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/data/models/SubCategoryModel.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/data/model/CategoryModel.dart';

class CategoryState {
  RequestStatus? getCategoriesStatus;
  String? getCategoriesErrorMessage;
  CategoryModel? categoryModel;
  int selectedIndex;
  RequestStatus? getSubCategoriesStatus;
  String? getSubCategoriesErrorMessage;
  SubCategoryModel? subCategoryModel;

  CategoryState({
    this.getCategoriesStatus = RequestStatus.init,
    this.getCategoriesErrorMessage,
    this.categoryModel,
    this.selectedIndex = 0,
    this.getSubCategoriesStatus = RequestStatus.init,
    this.getSubCategoriesErrorMessage,
    this.subCategoryModel,
  });

  CategoryState copyWith({
    RequestStatus? getCategoriesStatus,
    String? getCategoriesErrorMessage,
    CategoryModel? categoryModel,
    int? selectedIndex,
    RequestStatus? getSubCategoriesStatus,
    String? getSubCategoriesErrorMessage,
    SubCategoryModel? subCategoryModel,
  }) {
    return CategoryState(
      getCategoriesStatus: getCategoriesStatus ?? this.getCategoriesStatus,
      getCategoriesErrorMessage:
          getCategoriesErrorMessage ?? this.getCategoriesErrorMessage,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      categoryModel: categoryModel ?? this.categoryModel,
      getSubCategoriesStatus:
          getSubCategoriesStatus ?? this.getSubCategoriesStatus,
      getSubCategoriesErrorMessage:
          getSubCategoriesErrorMessage ?? this.getSubCategoriesErrorMessage,

      subCategoryModel: subCategoryModel ?? this.subCategoryModel,
    );
  }
}
