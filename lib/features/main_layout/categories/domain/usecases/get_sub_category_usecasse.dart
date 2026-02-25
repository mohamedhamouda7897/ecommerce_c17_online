import 'package:ecommerce_c17_online/features/main_layout/categories/data/models/SubCategoryModel.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/domain/repo/category_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoryUseCasse {
  CategoryRepo repo;

  GetSubCategoryUseCasse(this.repo);

  Future<SubCategoryModel> call() {
    return repo.getSubCategory();
  }
}
