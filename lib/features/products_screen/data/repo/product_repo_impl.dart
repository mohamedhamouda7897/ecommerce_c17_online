import 'package:ecommerce_c17_online/features/products_screen/data/datasources/product_ds.dart';
import 'package:ecommerce_c17_online/features/products_screen/data/models/ProductResponse.dart';
import 'package:ecommerce_c17_online/features/products_screen/domain/repo/product_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_handling/exceptions.dart' show GeneralException;

@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo {
  ProductDs dataSource;

  ProductRepoImpl(this.dataSource);

  @override
  Future<ProductResponse> getProducts(String catID) async {
    try {
      var result = await dataSource.getProducts(catID);

      return result;
    } catch (e) {
      throw GeneralException(message: "Something went wrong");
    }
  }
}
