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

import '../../data/repositories/auth_repository_impl.dart' as _i895;
import '../../domain/repositories/auth_repository.dart' as _i1073;
import '../../domain/usecases/auth/login_usecase.dart' as _i461;
import '../../domain/usecases/auth/logout_usecase.dart' as _i320;
import '../../domain/usecases/auth/register_usecase.dart' as _i659;
import '../../presentation/pages/signup_page/bloc/signup_bloc.dart' as _i904;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1073.AuthRepository>(() => _i895.AuthRepositoryImpl());
    gh.factory<_i461.LoginUseCase>(
        () => _i461.LoginUseCase(gh<_i1073.AuthRepository>()));
    gh.factory<_i320.LogoutUseCase>(
        () => _i320.LogoutUseCase(gh<_i1073.AuthRepository>()));
    gh.factory<_i659.RegisterUseCase>(
        () => _i659.RegisterUseCase(gh<_i1073.AuthRepository>()));
    gh.singleton<_i904.SignupBloc>(
        () => _i904.SignupBloc(gh<_i659.RegisterUseCase>()));
    return this;
  }
}
