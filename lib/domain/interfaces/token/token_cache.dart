import 'package:chat_pet/domain/models/auth/tokens.dart';

abstract interface class TokenCache {
  String? get refreshToken;

  void updateToken(Tokens? tokens);

  void clear();
}
