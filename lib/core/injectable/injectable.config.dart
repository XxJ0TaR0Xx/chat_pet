// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/common/services/secure_storage_service_impl.dart' as _i415;
import '../../data/repositories/auth/auth_local_repository_impl.dart' as _i236;
import '../../data/repositories/auth/auth_remote_repository_impl.dart' as _i370;
import '../../data/repositories/auth/auth_repository_impl.dart' as _i24;
import '../../data/repositories/registration/registration_repository_impl.dart'
    as _i891;
import '../../data/repositories/token/token_manager_impl.dart' as _i1003;
import '../../data/repositories/users/users_repository_impl.dart' as _i866;
import '../../domain/interfaces/auth/auth_local_repository.dart' as _i615;
import '../../domain/interfaces/auth/auth_remote_repository.dart' as _i286;
import '../../domain/interfaces/auth/auth_repository.dart' as _i508;
import '../../domain/interfaces/registration/registration_repository.dart'
    as _i374;
import '../../domain/interfaces/token/token_manager.dart' as _i866;
import '../../domain/interfaces/users/users_repository.dart' as _i1016;
import '../../domain/usecases/auth/init_use_case.dart' as _i104;
import '../../domain/usecases/auth/login_use_case.dart' as _i629;
import '../../domain/usecases/auth/logout_use_case.dart' as _i635;
import '../../domain/usecases/auth/registration_use_case.dart' as _i314;
import '../../domain/usecases/users/get_me_use_case.dart' as _i791;
import '../../domain/usecases/users/update_avatar_use_case.dart' as _i462;
import '../../domain/usecases/users/update_me_use_case.dart' as _i274;
import '../../presentation/pages/login/cubit/login_cubit.dart' as _i419;
import '../storages/interfaces/secure_storage_service.dart' as _i566;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.singleton<_i566.SecureStorageService>(
      () => _i415.SecureStorageServiceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i286.AuthRemoteRepository>(
      () => _i370.AuthRemoteRepositoryImpl(gh<_i361.Dio>()),
    );
    gh.singleton<_i866.TokenManager>(() => _i1003.TokenManagerImpl());
    gh.factory<_i374.RegistrationRepository>(
      () => const _i891.RegistrationRepositoryImpl(),
    );
    gh.singleton<_i1016.UsersRepository>(
      () => const _i866.UsersRepositoryImpl(),
    );
    gh.factory<_i791.GetMeUseCase>(
      () => _i791.GetMeUseCase(gh<_i1016.UsersRepository>()),
    );
    gh.factory<_i462.UpdateAvatarUseCase>(
      () => _i462.UpdateAvatarUseCase(gh<_i1016.UsersRepository>()),
    );
    gh.factory<_i274.UpdateMeUseCase>(
      () => _i274.UpdateMeUseCase(gh<_i1016.UsersRepository>()),
    );
    gh.factory<_i314.RegistrationUseCase>(
      () => _i314.RegistrationUseCase(gh<_i374.RegistrationRepository>()),
    );
    gh.factory<_i615.AuthLocalRepository>(
      () => _i236.AuthLocalRepositoryImpl(gh<_i566.SecureStorageService>()),
    );
    gh.factory<_i508.AuthRepository>(
      () => _i24.AuthRepositoryImpl(
        authLocalRepository: gh<_i615.AuthLocalRepository>(),
        authRemoteRepository: gh<_i286.AuthRemoteRepository>(),
        tokenCache: gh<_i866.TokenManager>(),
      ),
    );
    gh.factory<_i104.InitUseCase>(
      () => _i104.InitUseCase(gh<_i508.AuthRepository>()),
    );
    gh.factory<_i629.LoginUseCase>(
      () => _i629.LoginUseCase(gh<_i508.AuthRepository>()),
    );
    gh.factory<_i635.LogoutUseCase>(
      () => _i635.LogoutUseCase(gh<_i508.AuthRepository>()),
    );
    gh.singleton<_i419.LoginCubit>(
      () =>
          _i419.LoginCubit(gh<_i791.GetMeUseCase>(), gh<_i629.LoginUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
