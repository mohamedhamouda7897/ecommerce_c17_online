import 'package:ecommerce_c17_online/core/error_handling/exceptions.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/data/ds/category_ds.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/data/models/SubCategoryModel.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/domain/repo/category_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRepo)
class CategoryRepoImpl implements CategoryRepo {
  CategoryDs categoryDs;

  CategoryRepoImpl(this.categoryDs);

  @override
  Future<SubCategoryModel> getSubCategory() async {
    try {
      var response = await categoryDs.getSubCategory();
      return response;
    } catch (e) {
      throw ServerRouteException();
    }
  }
}
