import 'package:ecommerce_c17_online/core/api/api_manager.dart';
import 'package:ecommerce_c17_online/core/api/endPoints.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/data/datasources/remote/home_remote_ds.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/data/model/CategoryModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDs)
class HomeRemoteDsImpl implements HomeRemoteDs {
  ApiManager apiManager;

  HomeRemoteDsImpl(this.apiManager);

  @override
  Future<CategoryModel> getCategories() async {
    try {
      var response = await apiManager.get(Endpoints.categories);
      return CategoryModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
