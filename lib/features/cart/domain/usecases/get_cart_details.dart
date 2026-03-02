import 'package:ecommerce_c17_online/features/cart/data/models/cart_reponse.dart';
import 'package:ecommerce_c17_online/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCartDetailsUseCase {
  CartRepo repo;

  GetCartDetailsUseCase(this.repo);

  Future<CartResponse> call() => repo.getCartDetails();
}
