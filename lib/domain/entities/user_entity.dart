import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String? name;
  final String? avatarUrl;
  final String? email;

  const UserEntity({
    required this.id,
    this.name,
    this.avatarUrl,
    this.email,
  });

  @override
  List<Object> get props => [
        id,
        name ?? '',
        avatarUrl ?? '',
        email ?? '',
      ];

  UserEntity copyWith({
    String? id,
    String? name,
    String? avatarUrl,
    String? email,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
    );
  }

  @override
  bool get stringify => true;
}
