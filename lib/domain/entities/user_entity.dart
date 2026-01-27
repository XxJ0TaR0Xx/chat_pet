import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    this.name,
    this.lastName,
    this.address,
    this.avatarUrl,
    this.email,
    this.number,
  });

  final String id;
  final String? name;
  final String? lastName;
  final String? address;
  final String? avatarUrl;
  final String? email;
  final String? number;

  @override
  List<Object> get props => [
    id,
    name ?? '',
    avatarUrl ?? '',
    email ?? '',
    number ?? '',
  ];

  UserEntity copyWith({
    String? id,
    String? name,
    String? avatarUrl,
    String? email,
    String? number,
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
