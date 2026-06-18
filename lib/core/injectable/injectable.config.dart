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
import '../../data/common/services/web_socket/web_socket_service.dart' as _i865;
import '../../data/repositories/auth/auth_local_repository_impl.dart' as _i236;
import '../../data/repositories/auth/auth_remote_repository_impl.dart' as _i370;
import '../../data/repositories/auth/auth_repository_impl.dart' as _i24;
import '../../data/repositories/contacts/contacts_repository_impl.dart'
    as _i447;
import '../../data/repositories/registration/registration_repository_impl.dart'
    as _i891;
import '../../data/repositories/token/token_manager_impl.dart' as _i1003;
import '../../data/repositories/users/users_repository_impl.dart' as _i866;
import '../../domain/interfaces/auth/auth_local_repository.dart' as _i615;
import '../../domain/interfaces/auth/auth_remote_repository.dart' as _i286;
import '../../domain/interfaces/auth/auth_repository.dart' as _i508;
import '../../domain/interfaces/contacts/contacts_repository.dart' as _i113;
import '../../domain/interfaces/registration/registration_repository.dart'
    as _i374;
import '../../domain/interfaces/token/token_manager.dart' as _i866;
import '../../domain/interfaces/user/user_repository.dart' as _i73;
import '../../domain/usecases/auth/init_use_case.dart' as _i104;
import '../../domain/usecases/auth/login_use_case.dart' as _i629;
import '../../domain/usecases/auth/logout_use_case.dart' as _i635;
import '../../domain/usecases/auth/registration_use_case.dart' as _i314;
import '../../domain/usecases/contacts/accept_request_use_case.dart' as _i889;
import '../../domain/usecases/contacts/delete_contact_use_case.dart' as _i845;
import '../../domain/usecases/contacts/get_contacts_use_case.dart' as _i805;
import '../../domain/usecases/contacts/incoming_request_stream_use_case.dart'
    as _i781;
import '../../domain/usecases/contacts/incoming_requests_use_case.dart'
    as _i1011;
import '../../domain/usecases/contacts/reject_request_use_case.dart' as _i493;
import '../../domain/usecases/contacts/search_contacts_use_case.dart' as _i19;
import '../../domain/usecases/contacts/send_request_use_case.dart' as _i555;
import '../../domain/usecases/users/get_me_use_case.dart' as _i791;
import '../../domain/usecases/users/update_avatar_use_case.dart' as _i462;
import '../../domain/usecases/users/update_me_use_case.dart' as _i274;
import '../../presentation/cubits/contact_request/contact_requests_cubit.dart'
    as _i241;
import '../../presentation/pages/contacts/cubit/contacts_cubit.dart' as _i728;
import '../../presentation/pages/contacts/find_contact/cubit/find_contact_cubit.dart'
    as _i1019;
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
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.singleton<_i566.SecureStorageService>(
      () => _i415.SecureStorageServiceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i73.UserRepository>(
      () => _i866.UsersRepositoryImpl(gh<_i361.Dio>()),
    );
    gh.singleton<_i866.TokenManager>(() => _i1003.TokenManagerImpl());
    gh.factory<_i361.Dio>(() => registerModule.dio, instanceName: 'basicDio');
    gh.factory<_i791.GetMeUseCase>(
      () => _i791.GetMeUseCase(gh<_i73.UserRepository>()),
    );
    gh.factory<_i462.UpdateAvatarUseCase>(
      () => _i462.UpdateAvatarUseCase(gh<_i73.UserRepository>()),
    );
    gh.factory<_i274.UpdateMeUseCase>(
      () => _i274.UpdateMeUseCase(gh<_i73.UserRepository>()),
    );
    gh.lazySingleton<_i865.WebSocketService>(
      () => _i865.WebSocketService(gh<_i866.TokenManager>()),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i615.AuthLocalRepository>(
      () => _i236.AuthLocalRepositoryImpl(gh<_i566.SecureStorageService>()),
    );
    gh.factory<_i374.RegistrationRepository>(
      () => _i891.RegistrationRepositoryImpl(
        gh<_i361.Dio>(instanceName: 'basicDio'),
      ),
    );
    gh.factory<_i286.AuthRemoteRepository>(
      () => _i370.AuthRemoteRepositoryImpl(
        gh<_i361.Dio>(instanceName: 'basicDio'),
        gh<_i866.TokenManager>(),
      ),
    );
    gh.factory<_i508.AuthRepository>(
      () => _i24.AuthRepositoryImpl(
        authLocalRepository: gh<_i615.AuthLocalRepository>(),
        authRemoteRepository: gh<_i286.AuthRemoteRepository>(),
        tokenCache: gh<_i866.TokenManager>(),
        webSocketService: gh<_i865.WebSocketService>(),
      ),
    );
    gh.factory<_i629.LoginUseCase>(
      () => _i629.LoginUseCase(gh<_i508.AuthRepository>()),
    );
    gh.factory<_i635.LogoutUseCase>(
      () => _i635.LogoutUseCase(gh<_i508.AuthRepository>()),
    );
    gh.factory<_i113.ContactsRepository>(
      () => _i447.ContactsRepositoryImpl(
        gh<_i361.Dio>(),
        gh<_i865.WebSocketService>(),
      ),
    );
    gh.factory<_i104.InitUseCase>(
      () => _i104.InitUseCase(gh<_i508.AuthRepository>()),
    );
    gh.factory<_i314.RegistrationUseCase>(
      () => _i314.RegistrationUseCase(gh<_i374.RegistrationRepository>()),
    );
    gh.lazySingleton<_i419.LoginCubit>(
      () => _i419.LoginCubit(gh<_i629.LoginUseCase>()),
    );
    gh.factory<_i889.AcceptRequestUseCase>(
      () => _i889.AcceptRequestUseCase(gh<_i113.ContactsRepository>()),
    );
    gh.factory<_i845.DeleteContactUseCase>(
      () => _i845.DeleteContactUseCase(gh<_i113.ContactsRepository>()),
    );
    gh.factory<_i805.GetContactsUseCase>(
      () => _i805.GetContactsUseCase(gh<_i113.ContactsRepository>()),
    );
    gh.factory<_i781.IncomingRequestStreamUseCase>(
      () => _i781.IncomingRequestStreamUseCase(gh<_i113.ContactsRepository>()),
    );
    gh.factory<_i1011.IncomingRequestsUseCase>(
      () => _i1011.IncomingRequestsUseCase(gh<_i113.ContactsRepository>()),
    );
    gh.factory<_i493.RejectRequestUseCase>(
      () => _i493.RejectRequestUseCase(gh<_i113.ContactsRepository>()),
    );
    gh.factory<_i19.SearchContactsUseCase>(
      () => _i19.SearchContactsUseCase(gh<_i113.ContactsRepository>()),
    );
    gh.factory<_i555.SendRequestUseCase>(
      () => _i555.SendRequestUseCase(gh<_i113.ContactsRepository>()),
    );
    gh.lazySingleton<_i241.ContactRequestsCubit>(
      () => _i241.ContactRequestsCubit(
        gh<_i1011.IncomingRequestsUseCase>(),
        gh<_i889.AcceptRequestUseCase>(),
        gh<_i493.RejectRequestUseCase>(),
        gh<_i781.IncomingRequestStreamUseCase>(),
      ),
    );
    gh.factory<_i1019.FindContactCubit>(
      () => _i1019.FindContactCubit(
        gh<_i19.SearchContactsUseCase>(),
        gh<_i555.SendRequestUseCase>(),
        gh<_i845.DeleteContactUseCase>(),
      ),
    );
    gh.factory<_i728.ContactsCubit>(
      () => _i728.ContactsCubit(
        gh<_i805.GetContactsUseCase>(),
        gh<_i845.DeleteContactUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
