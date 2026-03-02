import 'package:ecommerce_c17_online/features/products_screen/data/models/ProductResponse.dart';

abstract class ProductRepo {
  Future<ProductResponse> getProducts(String catID);
}
