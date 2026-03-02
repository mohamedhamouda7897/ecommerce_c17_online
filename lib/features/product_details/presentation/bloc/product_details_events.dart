abstract class ProductDetailsEvents {}

class AddToCartEvent extends ProductDetailsEvents {
  String productId;

  AddToCartEvent(this.productId);
}
