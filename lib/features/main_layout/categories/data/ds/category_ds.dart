import 'package:ecommerce_c17_online/features/main_layout/categories/data/models/SubCategoryModel.dart';

abstract class CategoryDs {
  Future<SubCategoryModel> getSubCategory();
}
