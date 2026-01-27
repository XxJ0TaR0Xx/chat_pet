import 'package:chat_pet/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    super.avatarUrl,
    super.email,
    super.name,
    super.address,
    super.lastName,
    super.number,
  });

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()?['user'];
    return UserModel(
      id: data?['id']?.toString() ?? '',
      name: data?['name'],
      lastName: data?['lastName'],
      address: data?['address'],
      avatarUrl: data?['avatarUrl'],
      email: data?['email'],
      number: data?['number'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      if (name != null) 'name': name,
      if (lastName != null) 'lastName': lastName,
      if (address != null) 'address': address,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      if (email != null) 'email': email,
      if (number != null) 'number': number,
    };
  }

  @override
  UserModel copyWith({
    String? id,
    String? name,
    String? lastName,
    String? address,
    String? avatarUrl,
    String? email,
    String? number,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      address: address ?? this.address,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
      number: number ?? this.number,
    );
  }
}
