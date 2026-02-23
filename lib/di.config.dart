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
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i363;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i981.AuthRemoteDs>(
      () => _i393.AuthRemoteDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i279.AuthRepository>(
      () => _i674.AuthRepoImpl(gh<_i981.AuthRemoteDs>()),
    );
    gh.factory<_i206.LoginUseCase>(
      () => _i206.LoginUseCase(gh<_i279.AuthRepository>()),
    );
    gh.factory<_i363.AuthBloc>(() => _i363.AuthBloc(gh<_i206.LoginUseCase>()));
    return this;
  }
}
