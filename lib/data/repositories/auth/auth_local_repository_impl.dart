import 'package:chat_pet/core/storages/interfaces/secure_storage_service.dart';
import 'package:chat_pet/data/common/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_local_repository.dart';
import 'package:chat_pet/domain/models/auth/tokens.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthLocalRepository)
class AuthLocalRepositoryImpl implements AuthLocalRepository {
  const AuthLocalRepositoryImpl(this._secureStorageService);

  static const _accessToken = 'access_token';

  static const _refreshToken = 'refresh_token';

  final SecureStorageService _secureStorageService;

  @override
  Future<Tokens?> readTokens() async {
    final tokens = await Future.wait([
      _secureStorageService.read(_accessToken),
      _secureStorageService.read(_refreshToken),
    ]);

    if ((tokens[0], tokens[1]) case (
      final accessToken?,
      final refreshToken?,
    ) when accessToken.isNotEmpty && refreshToken.isNotEmpty) {
      return Tokens(accessToken: accessToken, refreshToken: refreshToken);
    }

    return null;
  }

  @override
  Future<void> writeTokens(Tokens tokens) async {
    if (tokens.accessToken.isEmpty || tokens.refreshToken.isEmpty) {
      talk.error('Tokens must not be empty');
      throw ArgumentError('Tokens must not be empty');
    }

    await Future.wait([
      _secureStorageService.write(key: _accessToken, value: tokens.accessToken),
      _secureStorageService.write(key: _refreshToken, value: tokens.refreshToken),
    ]);
  }

  @override
  Future<void> removeTokens() async {
    await Future.wait([
      _secureStorageService.delete(_accessToken),
      _secureStorageService.delete(_refreshToken),
    ]);
  }
}
