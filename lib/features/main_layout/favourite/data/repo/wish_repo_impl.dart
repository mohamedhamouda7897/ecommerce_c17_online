import 'package:ecommerce_c17_online/features/main_layout/favourite/data/data_sources/wish_ds.dart';
import 'package:ecommerce_c17_online/features/main_layout/favourite/data/models/WishResponse.dart';
import 'package:ecommerce_c17_online/features/main_layout/favourite/domain/repo/wish_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: WishRepo)
class WishRepoImpl implements WishRepo {
  WishDs wishDs;

  WishRepoImpl(this.wishDs);

  @override
  Future<bool> addProductToWishList(String prodId) {
    return wishDs.addProductToWishList(prodId);
  }

  @override
  Future<WishResponse> getWishList() {
    return wishDs.getWishList();
  }
}
