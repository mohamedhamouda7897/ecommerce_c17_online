import 'package:ecommerce_c17_online/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  CartRepo repo;

  AddToCartUseCase(this.repo);

  Future<bool> call(String productId) => repo.addToCart(productId);
}
