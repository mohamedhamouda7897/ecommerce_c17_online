import 'package:ecommerce_c17_online/features/products_screen/data/models/ProductResponse.dart';
import 'package:ecommerce_c17_online/features/products_screen/domain/repo/product_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetProductsUseCase {
  ProductRepo repo;

  GetProductsUseCase(this.repo);

  Future<ProductResponse> call(String catID) => repo.getProducts(catID);
}
