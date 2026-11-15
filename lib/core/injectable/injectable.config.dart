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
import '../../data/common/services/web_socket/notification_web_socket.dart'
    as _i969;
import '../../data/repositories/auth/auth_local_repository_impl.dart' as _i236;
import '../../data/repositories/auth/auth_remote_repository_impl.dart' as _i370;
import '../../data/repositories/auth/auth_repository_impl.dart' as _i24;
import '../../data/repositories/chats/chat_repository_impl.dart' as _i310;
import '../../data/repositories/contacts/contacts_repository_impl.dart'
    as _i447;
import '../../data/repositories/notifications/notification_repository_impl.dart'
    as _i756;
import '../../data/repositories/registration/registration_repository_impl.dart'
    as _i891;
import '../../data/repositories/token/token_manager_impl.dart' as _i1003;
import '../../data/repositories/user/user_repository_impl.dart' as _i991;
import '../../domain/interfaces/auth/auth_local_repository.dart' as _i615;
import '../../domain/interfaces/auth/auth_remote_repository.dart' as _i286;
import '../../domain/interfaces/auth/auth_repository.dart' as _i508;
import '../../domain/interfaces/chats/chat_repository.dart' as _i316;
import '../../domain/interfaces/contacts/contacts_repository.dart' as _i113;
import '../../domain/interfaces/notifications/notification_repository.dart'
    as _i136;
import '../../domain/interfaces/registration/registration_repository.dart'
    as _i374;
import '../../domain/interfaces/token/token_manager.dart' as _i866;
import '../../domain/interfaces/user/user_repository.dart' as _i73;
import '../../domain/models/chat/chat_member_model.dart' as _i1072;
import '../../domain/usecases/auth/init_use_case.dart' as _i104;
import '../../domain/usecases/auth/login_use_case.dart' as _i629;
import '../../domain/usecases/auth/logout_use_case.dart' as _i635;
import '../../domain/usecases/auth/registration_use_case.dart' as _i314;
import '../../domain/usecases/chats/chat_web_socket_use_case.dart' as _i190;
import '../../domain/usecases/chats/create_chat_use_case.dart' as _i396;
import '../../domain/usecases/chats/delete_chat_use_case.dart' as _i730;
import '../../domain/usecases/chats/delete_message_use_case.dart' as _i61;
import '../../domain/usecases/chats/delete_messages_use_case.dart' as _i707;
import '../../domain/usecases/chats/disconnect_from_chat_use_case.dart'
    as _i345;
import '../../domain/usecases/chats/get_chats_use_case.dart' as _i625;
import '../../domain/usecases/chats/get_messages_use_case.dart' as _i1050;
import '../../domain/usecases/chats/read_messages_use_case.dart' as _i253;
import '../../domain/usecases/chats/send_message_use_case.dart' as _i585;
import '../../domain/usecases/chats/update_message_use_case.dart' as _i1032;
import '../../domain/usecases/chats/watch_chat_messages_use_case.dart' as _i716;
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
import '../../domain/usecases/user/get_me_use_case.dart' as _i59;
import '../../domain/usecases/user/update_avatar_use_case.dart' as _i74;
import '../../domain/usecases/user/update_me_use_case.dart' as _i778;
import '../../domain/usecases/user/watch_current_user_use_case.dart' as _i317;
import '../../presentation/cubits/contact_request/contact_requests_cubit.dart'
    as _i241;
import '../../presentation/cubits/user/user_cubit.dart' as _i40;
import '../../presentation/pages/chats/cubit/chat_cubit.dart' as _i130;
import '../../presentation/pages/contacts/cubit/contacts_cubit.dart' as _i728;
import '../../presentation/pages/contacts/find_contact/cubit/find_contact_cubit.dart'
    as _i1019;
import '../../presentation/pages/login/cubit/login_cubit.dart' as _i419;
import '../../presentation/pages/message_page/cubit/message_cubit.dart'
    as _i538;
import '../../presentation/pages/profile/cubit/profile_cubit.dart' as _i855;
import '../../presentation/pages/settings/cubit/setting_cubit.dart' as _i657;
import '../../presentation/utils/chat_session/open_chat_tracker.dart' as _i53;
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
    gh.lazySingleton<_i53.OpenChatTracker>(() => _i53.OpenChatTracker());
    gh.singleton<_i566.SecureStorageService>(
      () => _i415.SecureStorageServiceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.singleton<_i866.TokenManager>(
      () => _i1003.TokenManagerImpl(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio,
      instanceName: 'basicDio',
    );
    gh.lazySingleton<_i969.NotificationWebSocket>(
      () => _i969.NotificationWebSocket(gh<_i866.TokenManager>()),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i615.AuthLocalRepository>(
      () => _i236.AuthLocalRepositoryImpl(gh<_i566.SecureStorageService>()),
    );
    gh.lazySingleton<_i136.NotificationRepository>(
      () => _i756.NotificationRepositoryImpl(gh<_i969.NotificationWebSocket>()),
    );
    gh.factory<_i374.RegistrationRepository>(
      () => _i891.RegistrationRepositoryImpl(
        gh<_i361.Dio>(instanceName: 'basicDio'),
      ),
    );
    gh.factory<_i286.AuthRemoteRepository>(
      () => _i370.AuthRemoteRepositoryImpl(
        gh<_i361.Dio>(instanceName: 'basicDio'),
        gh<_i361.Dio>(),
      ),
    );
    gh.lazySingleton<_i73.UserRepository>(
      () => _i991.UserRepositoryImpl(gh<_i361.Dio>(), gh<_i866.TokenManager>()),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i316.ChatRepository>(
      () => _i310.ChatRepositoryImpl(gh<_i361.Dio>(), gh<_i866.TokenManager>()),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i113.ContactsRepository>(
      () => _i447.ContactsRepositoryImpl(
        gh<_i361.Dio>(),
        gh<_i136.NotificationRepository>(),
      ),
    );
    gh.lazySingleton<_i508.AuthRepository>(
      () => _i24.AuthRepositoryImpl(
        authLocalRepository: gh<_i615.AuthLocalRepository>(),
        authRemoteRepository: gh<_i286.AuthRemoteRepository>(),
        tokenCache: gh<_i866.TokenManager>(),
        webSocketService: gh<_i969.NotificationWebSocket>(),
      ),
    );
    gh.factory<_i104.InitUseCase>(
      () => _i104.InitUseCase(gh<_i508.AuthRepository>()),
    );
    gh.factory<_i59.GetMeUseCase>(
      () => _i59.GetMeUseCase(gh<_i73.UserRepository>()),
    );
    gh.factory<_i74.UpdateAvatarUseCase>(
      () => _i74.UpdateAvatarUseCase(gh<_i73.UserRepository>()),
    );
    gh.factory<_i778.UpdateMeUseCase>(
      () => _i778.UpdateMeUseCase(gh<_i73.UserRepository>()),
    );
    gh.factory<_i314.RegistrationUseCase>(
      () => _i314.RegistrationUseCase(gh<_i374.RegistrationRepository>()),
    );
    gh.factory<_i317.WatchCurrentUserUseCase>(
      () => _i317.WatchCurrentUserUseCase(gh<_i73.UserRepository>()),
    );
    gh.factory<_i190.ChatWebSocketUseCase>(
      () => _i190.ChatWebSocketUseCase(gh<_i316.ChatRepository>()),
    );
    gh.factory<_i396.CreateChatUseCase>(
      () => _i396.CreateChatUseCase(gh<_i316.ChatRepository>()),
    );
    gh.factory<_i730.DeleteChatUseCase>(
      () => _i730.DeleteChatUseCase(gh<_i316.ChatRepository>()),
    );
    gh.factory<_i61.DeleteMessageUseCase>(
      () => _i61.DeleteMessageUseCase(gh<_i316.ChatRepository>()),
    );
    gh.factory<_i707.DeleteMessagesUseCase>(
      () => _i707.DeleteMessagesUseCase(gh<_i316.ChatRepository>()),
    );
    gh.factory<_i345.DisconnectFromChatUseCase>(
      () => _i345.DisconnectFromChatUseCase(gh<_i316.ChatRepository>()),
    );
    gh.factory<_i625.GetChatsUseCase>(
      () => _i625.GetChatsUseCase(gh<_i316.ChatRepository>()),
    );
    gh.factory<_i1050.GetMessagesUseCase>(
      () => _i1050.GetMessagesUseCase(gh<_i316.ChatRepository>()),
    );
    gh.factory<_i253.ReadMessagesUseCase>(
      () => _i253.ReadMessagesUseCase(gh<_i316.ChatRepository>()),
    );
    gh.factory<_i585.SendMessageUseCase>(
      () => _i585.SendMessageUseCase(gh<_i316.ChatRepository>()),
    );
    gh.factory<_i1032.UpdateMessageUseCase>(
      () => _i1032.UpdateMessageUseCase(gh<_i316.ChatRepository>()),
    );
    gh.lazySingleton<_i40.UserCubit>(
      () => _i40.UserCubit(
        gh<_i59.GetMeUseCase>(),
        gh<_i104.InitUseCase>(),
        gh<_i317.WatchCurrentUserUseCase>(),
      ),
    );
    gh.factory<_i716.WatchChatMessagesUseCase>(
      () => _i716.WatchChatMessagesUseCase(gh<_i316.ChatRepository>()),
    );
    gh.factory<_i629.LoginUseCase>(
      () => _i629.LoginUseCase(
        gh<_i508.AuthRepository>(),
        gh<_i73.UserRepository>(),
      ),
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
    gh.factory<_i635.LogoutUseCase>(
      () => _i635.LogoutUseCase(gh<_i508.AuthRepository>()),
    );
    gh.factory<_i130.ChatCubit>(
      () => _i130.ChatCubit(
        gh<_i625.GetChatsUseCase>(),
        gh<_i396.CreateChatUseCase>(),
        gh<_i730.DeleteChatUseCase>(),
        gh<_i136.NotificationRepository>(),
        gh<_i716.WatchChatMessagesUseCase>(),
        gh<_i53.OpenChatTracker>(),
      ),
    );
    gh.factory<_i538.MessageCubit>(
      () => _i538.MessageCubit(
        gh<_i1050.GetMessagesUseCase>(),
        gh<_i61.DeleteMessageUseCase>(),
        gh<_i707.DeleteMessagesUseCase>(),
        gh<_i1032.UpdateMessageUseCase>(),
        gh<_i190.ChatWebSocketUseCase>(),
        gh<_i345.DisconnectFromChatUseCase>(),
        gh<_i585.SendMessageUseCase>(),
        gh<_i253.ReadMessagesUseCase>(),
        chatId: gh<String>(),
        currentUserId: gh<String>(),
        otherMembers: gh<List<_i1072.ChatMemberModel>>(),
      ),
    );
    gh.factory<_i241.ContactModelRequestsCubit>(
      () => _i241.ContactModelRequestsCubit(
        gh<_i1011.IncomingRequestsUseCase>(),
        gh<_i889.AcceptRequestUseCase>(),
        gh<_i493.RejectRequestUseCase>(),
        gh<_i781.IncomingRequestStreamUseCase>(),
      ),
    );
    gh.factory<_i855.ProfileCubit>(
      () => _i855.ProfileCubit(
        gh<_i778.UpdateMeUseCase>(),
        gh<_i74.UpdateAvatarUseCase>(),
        gh<_i317.WatchCurrentUserUseCase>(),
      ),
    );
    gh.factory<_i419.LoginCubit>(
      () => _i419.LoginCubit(gh<_i629.LoginUseCase>()),
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
    gh.factory<_i657.SettingCubit>(
      () => _i657.SettingCubit(
        gh<_i635.LogoutUseCase>(),
        gh<_i317.WatchCurrentUserUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
