import 'package:dio/dio.dart';
import 'package:ecommerce_c17_online/core/api/api_manager.dart';
import 'package:ecommerce_c17_online/core/api/endPoints.dart';
import 'package:ecommerce_c17_online/core/caching/cache_helper.dart';
import 'package:ecommerce_c17_online/features/cart/data/models/cart_reponse.dart';
import 'package:injectable/injectable.dart';

abstract class CartDs {
  Future<bool> addToCart(String productId);

  Future<CartResponse> getCartDetails();
}

@Injectable(as: CartDs)
class CartDsImpl implements CartDs {
  ApiManager apiManager;
  CacheHelper _cacheHelper;

  CartDsImpl(this.apiManager, this._cacheHelper);

  @override
  Future<bool> addToCart(String productId) async {
    try {
      var res = await apiManager.post(
        Endpoints.cart,
        data: {"productId": productId},

        options: Options(
          headers: {"token": _cacheHelper.getString("token") ?? ""},
        ),
      );

      if (res.data['status'] == "success") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CartResponse> getCartDetails() async {
    try {
      var res = await apiManager.get(
        Endpoints.cart,
        options: Options(
          headers: {"token": _cacheHelper.getString("token") ?? ""},
        ),
      );

      return CartResponse.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
