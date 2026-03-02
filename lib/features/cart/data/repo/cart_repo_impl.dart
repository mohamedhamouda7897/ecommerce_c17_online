import 'package:ecommerce_c17_online/core/error_handling/exceptions.dart';
import 'package:ecommerce_c17_online/features/cart/data/datasources/cart_ds.dart';
import 'package:ecommerce_c17_online/features/cart/data/models/cart_reponse.dart';
import 'package:ecommerce_c17_online/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CartRepo  )
class CartRepoImpl implements CartRepo {
  CartDs cartDs;

  CartRepoImpl(this.cartDs);

  @override
  Future<bool> addToCart(String productId) {
    try {
      return cartDs.addToCart(productId);
    } catch (e) {
      throw GeneralException();
    }
  }

  @override
  Future<CartResponse> getCartDetails() {
    try {
      return cartDs.getCartDetails();
    } catch (e) {
      throw GeneralException();
    }
  }
}
