import 'package:ecommerce_c17_online/features/main_layout/favourite/data/models/WishResponse.dart';
import 'package:ecommerce_c17_online/features/main_layout/favourite/domain/repo/wish_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetWishListUseCase {
  WishRepo repo;

  GetWishListUseCase(this.repo);

  Future<WishResponse> call() => repo.getWishList();
}
