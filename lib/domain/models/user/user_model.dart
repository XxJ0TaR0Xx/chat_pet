import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    @JsonKey(name: 'user_tag') required String userTag,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? email,
    @JsonKey(name: 'username') String? name,
    String? address,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'phone_number') String? number,
    String? authProvider,
    DateTime? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
