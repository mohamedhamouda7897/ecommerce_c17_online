import 'package:ecommerce_c17_online/features/cart/data/models/cart_reponse.dart';

abstract class CartRepo {
  Future<bool> addToCart(String productId);

  Future<CartResponse> getCartDetails();
}
