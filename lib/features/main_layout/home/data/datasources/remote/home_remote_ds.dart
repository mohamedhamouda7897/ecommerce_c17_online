import 'package:ecommerce_c17_online/features/main_layout/home/data/model/CategoryModel.dart';

abstract class HomeRemoteDs {
  Future<CategoryModel> getCategories();
}
