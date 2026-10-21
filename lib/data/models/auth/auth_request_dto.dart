import 'package:chat_pet/domain/models/auth/auth_request.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_request_dto.freezed.dart';
part 'auth_request_dto.g.dart';

@Freezed(toJson: true)
abstract class AuthRequestDto with _$AuthRequestDto {
  const factory AuthRequestDto({
    required String email,
    required String password,
  }) = _AuthRequestDto;

  const AuthRequestDto._();

  factory AuthRequestDto.fromDomain(AuthRequest request) => AuthRequestDto(email: request.email, password: request.password);
}
