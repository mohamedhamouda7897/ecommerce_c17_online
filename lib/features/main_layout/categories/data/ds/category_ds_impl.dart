import 'package:ecommerce_c17_online/core/api/api_manager.dart';
import 'package:ecommerce_c17_online/core/api/endPoints.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/data/ds/category_ds.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/data/models/SubCategoryModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryDs)
class CategoryDsImpl implements CategoryDs {
  ApiManager apiManager;

  CategoryDsImpl(this.apiManager);

  @override
  Future<SubCategoryModel> getSubCategory() async {
    try {
      var response = await apiManager.get(Endpoints.subcategories);
      return SubCategoryModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
