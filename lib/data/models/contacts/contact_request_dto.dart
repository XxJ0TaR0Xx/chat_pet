import 'package:chat_pet/data/models/user/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_request_dto.freezed.dart';
part 'contact_request_dto.g.dart';

@freezed
abstract class ContactModelRequestDto with _$ContactModelRequestDto {
  const factory ContactModelRequestDto({
    required String id,
    required UserDto sender,
    UserDto? receiver,
  }) = _ContactModelRequestDto;

  factory ContactModelRequestDto.fromJson(Map<String, dynamic> json) => _$ContactModelRequestDtoFromJson(json);
}
