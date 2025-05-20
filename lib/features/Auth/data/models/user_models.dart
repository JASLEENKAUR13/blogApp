import 'package:clean_architecture_app/core/entities/user.dart';

class UserModels extends User {
  UserModels({required super.id, required super.email, required super.name});

  factory UserModels.fromJson(Map<String, dynamic> map) {
    return UserModels(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
    );
  }
  UserModels copyWith({String? id, String? email, String? name}) {
    return UserModels(
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
