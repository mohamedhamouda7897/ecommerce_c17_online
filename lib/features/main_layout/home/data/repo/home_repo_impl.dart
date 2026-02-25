import 'package:ecommerce_c17_online/core/error_handling/exceptions.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/data/datasources/remote/home_remote_ds.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/data/model/CategoryModel.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:HomeRepo )
class HomeRepoImpl implements HomeRepo {
  HomeRemoteDs remoteDs;

  HomeRepoImpl(this.remoteDs);

  @override
  Future<CategoryModel> getCategories() async {
    try {
      return await remoteDs.getCategories();
    } catch (e) {
      throw ServerRouteException("Something went wrong");
    }
  }
}
