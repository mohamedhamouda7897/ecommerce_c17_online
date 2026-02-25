import 'package:ecommerce_c17_online/features/main_layout/home/data/model/CategoryModel.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCategoriesUseCase {
  HomeRepo repo;

  GetCategoriesUseCase(this.repo);

  Future<CategoryModel> call() {
    return repo.getCategories();
  }
}
