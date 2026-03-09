import 'package:dio/dio.dart';
import 'package:ecommerce_c17_online/core/api/api_manager.dart';
import 'package:ecommerce_c17_online/core/api/endPoints.dart';
import 'package:ecommerce_c17_online/core/caching/cache_helper.dart';
import 'package:ecommerce_c17_online/features/main_layout/favourite/data/models/WishResponse.dart';
import 'package:injectable/injectable.dart';

abstract class WishDs {
  Future<bool> addProductToWishList(String prodId);

  Future<WishResponse> getWishList();
}
@Injectable(as:WishDs )
class WishDsImpl implements WishDs {
  ApiManager apiManager;
  CacheHelper _cacheHelper;

  WishDsImpl(this.apiManager, this._cacheHelper);

  @override
  Future<bool> addProductToWishList(String prodId) async {
    var result = await apiManager.post(
      Endpoints.wishlist,
      data: {"productId": prodId},
      options: Options(headers: {"token": _cacheHelper.getString("token")}),
    );

    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<WishResponse> getWishList() async {
    var result = await apiManager.get(
      Endpoints.wishlist,
      options: Options(headers: {"token": _cacheHelper.getString("token")}),
    );

    return WishResponse.fromJson(result.data);
  }
}
