abstract class ProductEvents {}

class GetProductsEvent extends ProductEvents {
  String catID;

  GetProductsEvent(this.catID);
}
