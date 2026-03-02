import 'package:ecommerce_c17_online/core/api/api_manager.dart';
import 'package:ecommerce_c17_online/core/api/endPoints.dart';
import 'package:ecommerce_c17_online/features/products_screen/data/models/ProductResponse.dart';
import 'package:injectable/injectable.dart';

abstract class ProductDs {
  Future<ProductResponse> getProducts(String catId);
}

@Injectable(as: ProductDs)
class ProductDSImpl implements ProductDs {
  ApiManager apiManager;

  ProductDSImpl(this.apiManager);

  @override
  Future<ProductResponse> getProducts(String catId) async {
    try {
      var result = await apiManager.get(
        Endpoints.products,
        queryParameters: {"category[in]": catId},
      );

      return ProductResponse.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }
}
