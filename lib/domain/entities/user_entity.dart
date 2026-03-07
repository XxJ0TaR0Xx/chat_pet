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
    this.authProvider,
  });

  final String id;
  final String? name;
  final String? lastName;
  final String? address;
  final String? avatarUrl;
  final String? email;
  final String? number;
  final String? authProvider;

  @override
  List<Object> get props => [
    id,
    name ?? '',
    lastName ?? '',
    avatarUrl ?? '',
    email ?? '',
    number ?? '',
    authProvider ?? '',
    address ?? '',
  ];

  UserEntity copyWith({
    String? id,
    String? name,
    String? lastName,
    String? avatarUrl,
    String? email,
    String? number,
    String? address,
    String? authProvider,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
      address: address ?? this.address,
      lastName: lastName ?? this.lastName,
      authProvider: authProvider ?? this.authProvider,
    );
  }

  @override
  bool get stringify => true;
}
