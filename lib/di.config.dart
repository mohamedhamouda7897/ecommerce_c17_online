// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/api_manager.dart' as _i237;
import 'features/auth/data/data_sources/remote/auth_remote_ds.dart' as _i981;
import 'features/auth/data/data_sources/remote/auth_remote_ds_impl.dart'
    as _i393;
import 'features/auth/data/repository/auth_repo_impl.dart' as _i674;
import 'features/auth/domain/repository/auth_repository.dart' as _i279;
import 'features/auth/domain/usecases/login_usecase.dart' as _i206;
import 'features/auth/domain/usecases/signUp_usecase.dart' as _i192;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i363;
import 'features/main_layout/categories/data/ds/category_ds.dart' as _i983;
import 'features/main_layout/categories/data/ds/category_ds_impl.dart' as _i284;
import 'features/main_layout/categories/data/repo/category_repo_impl.dart'
    as _i564;
import 'features/main_layout/categories/domain/repo/category_repo.dart'
    as _i159;
import 'features/main_layout/categories/domain/usecases/get_sub_category_usecasse.dart'
    as _i414;
import 'features/main_layout/categories/presentation/bloc/category_bloc.dart'
    as _i916;
import 'features/main_layout/home/data/datasources/remote/home_remote_ds.dart'
    as _i150;
import 'features/main_layout/home/data/datasources/remote/home_remote_ds_impl.dart'
    as _i373;
import 'features/main_layout/home/data/repo/home_repo_impl.dart' as _i573;
import 'features/main_layout/home/domain/repo/home_repo.dart' as _i347;
import 'features/main_layout/home/domain/usecases/get_categories_usecase.dart'
    as _i646;
import 'features/main_layout/home/presentation/bloc/home_bloc.dart' as _i123;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i150.HomeRemoteDs>(
      () => _i373.HomeRemoteDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i983.CategoryDs>(
      () => _i284.CategoryDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i159.CategoryRepo>(
      () => _i564.CategoryRepoImpl(gh<_i983.CategoryDs>()),
    );
    gh.factory<_i981.AuthRemoteDs>(
      () => _i393.AuthRemoteDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i347.HomeRepo>(
      () => _i573.HomeRepoImpl(gh<_i150.HomeRemoteDs>()),
    );
    gh.factory<_i279.AuthRepository>(
      () => _i674.AuthRepoImpl(gh<_i981.AuthRemoteDs>()),
    );
    gh.factory<_i414.GetSubCategoryUseCasse>(
      () => _i414.GetSubCategoryUseCasse(gh<_i159.CategoryRepo>()),
    );
    gh.factory<_i646.GetCategoriesUseCase>(
      () => _i646.GetCategoriesUseCase(gh<_i347.HomeRepo>()),
    );
    gh.factory<_i916.CategoryBloc>(
      () => _i916.CategoryBloc(
        gh<_i646.GetCategoriesUseCase>(),
        gh<_i414.GetSubCategoryUseCasse>(),
      ),
    );
    gh.factory<_i206.LoginUseCase>(
      () => _i206.LoginUseCase(gh<_i279.AuthRepository>()),
    );
    gh.factory<_i192.SignupUseCase>(
      () => _i192.SignupUseCase(gh<_i279.AuthRepository>()),
    );
    gh.factory<_i123.HomeBloc>(
      () => _i123.HomeBloc(gh<_i646.GetCategoriesUseCase>()),
    );
    gh.factory<_i363.AuthBloc>(
      () => _i363.AuthBloc(gh<_i206.LoginUseCase>(), gh<_i192.SignupUseCase>()),
    );
    return this;
  }
}
