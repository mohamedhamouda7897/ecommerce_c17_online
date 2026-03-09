import 'package:ecommerce_c17_online/features/main_layout/favourite/domain/repo/wish_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddProductToWishListUseCase {
  WishRepo repo;

  AddProductToWishListUseCase(this.repo);

  Future<bool> call(String prodId) => repo.addProductToWishList(prodId);
}
