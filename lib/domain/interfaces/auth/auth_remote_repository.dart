import 'package:chat_pet/domain/models/auth/auth_request.dart';
import 'package:chat_pet/domain/models/auth/tokens.dart';

abstract interface class AuthRemoteRepository {
  Future<Tokens> login(AuthRequest authRequest);

  Future<void> logout();

  Future<Tokens> refresh(String refreshToken);
}
