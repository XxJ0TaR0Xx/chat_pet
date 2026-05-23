import 'package:chat_pet/domain/models/auth/tokens.dart';

abstract interface class AuthLocalRepository {
  Future<Tokens?> readTokens();

  Future<void> writeTokens(Tokens tokens);

  Future<void> removeTokens();
}
