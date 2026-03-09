import 'package:ecommerce_c17_online/features/main_layout/favourite/data/models/WishResponse.dart';

abstract class WishRepo {
  Future<bool> addProductToWishList(String prodId);

  Future<WishResponse> getWishList();
}
