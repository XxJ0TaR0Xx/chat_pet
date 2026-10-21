import 'package:json_annotation/json_annotation.dart';

part 'update_user_dto.g.dart';

///`PATCH users/me`.
@JsonSerializable(includeIfNull: false, createFactory: false)
class UpdateUserDto {
  const UpdateUserDto({
    this.name,
    this.lastName,
    this.address,
    this.phoneNumber,
  });

  @JsonKey(name: 'username')
  final String? name;

  @JsonKey(name: 'last_name')
  final String? lastName;

  final String? address;

  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  Map<String, dynamic> toJson() => _$UpdateUserDtoToJson(this);
}
