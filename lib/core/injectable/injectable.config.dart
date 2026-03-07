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
import '../../data/repositories/firebase/firebase_repository_impl.dart'
    as _i838;
import '../../domain/repositories/auth_repository.dart' as _i1073;
import '../../domain/repositories/firebase/firebase_repository.dart' as _i573;
import '../../domain/usecases/auth/login_by_google_usecase.dart' as _i521;
import '../../domain/usecases/auth/login_usecase.dart' as _i461;
import '../../domain/usecases/auth/logout_usecase.dart' as _i320;
import '../../domain/usecases/auth/register_usecase.dart' as _i659;
import '../../domain/usecases/user/update_user_usecase.dart' as _i10;
import '../../presentation/cubits/user/user_cubit.dart' as _i40;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i40.UserCubit>(() => _i40.UserCubit());
    gh.singleton<_i573.FirebaseRepository>(
      () => _i838.FirebaseRepositoryImpl(),
    );
    gh.factory<_i10.UpdateUserUseCase>(
      () => _i10.UpdateUserUseCase(gh<_i573.FirebaseRepository>()),
    );
    gh.singleton<_i1073.AuthRepository>(
      () => _i895.AuthRepositoryImpl(
        firebaseRepository: gh<_i573.FirebaseRepository>(),
        userCubit: gh<_i40.UserCubit>(),
      ),
    );
    gh.factory<_i521.LoginByGoogleUseCase>(
      () => _i521.LoginByGoogleUseCase(gh<_i1073.AuthRepository>()),
    );
    gh.factory<_i461.LoginUseCase>(
      () => _i461.LoginUseCase(gh<_i1073.AuthRepository>()),
    );
    gh.factory<_i320.LogoutUseCase>(
      () => _i320.LogoutUseCase(gh<_i1073.AuthRepository>()),
    );
    gh.factory<_i659.RegisterUseCase>(
      () => _i659.RegisterUseCase(gh<_i1073.AuthRepository>()),
    );
    return this;
  }
}
