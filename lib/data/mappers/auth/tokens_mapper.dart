import 'package:chat_pet/data/models/auth/tokens_dto.dart';
import 'package:chat_pet/domain/models/auth/tokens.dart';

extension TokensMapper on TokensDto {
  Tokens toDomain() => Tokens(accessToken: accessToken, refreshToken: refreshToken);
}
