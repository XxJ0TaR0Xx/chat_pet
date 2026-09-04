import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokens_dto.freezed.dart';
part 'tokens_dto.g.dart';

@freezed
abstract class TokensDto with _$TokensDto {
  const factory TokensDto({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _TokensDto;

  const TokensDto._();

  factory TokensDto.fromJson(Map<String, dynamic> json) => _$TokensDtoFromJson(json);
}
