import 'package:chat_pet/data/models/user/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_dto.freezed.dart';
part 'contact_dto.g.dart';

@freezed
abstract class ContactDto with _$ContactDto {
  const factory ContactDto({
    required DateTime since,
    required UserDto user,
  }) = _ContactDto;

  factory ContactDto.fromJson(Map<String, dynamic> json) => _$ContactDtoFromJson(json);
}
