import 'dart:convert';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? password_confirmation;
  bool? isAdmin;
  DateTime? createdAt;
  String? token;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.isAdmin,
      this.createdAt,
      this.token,
      this.password_confirmation});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
      'is_admin': isAdmin ?? false,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      password_confirmation: map['password_confirmation'],
      isAdmin: map['isAdmin'],
      createdAt:
          map["created_at"] != null ? DateTime.parse(map["created_at"]) : null,
      token: map['token'],
    );
  }

  static List<UserModel> fromList(list) {
    return List<UserModel>.from(list.map((x) => UserModel.fromMap(x)));
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, password: $password, isAdmin: $isAdmin, password_confirmation: $password_confirmation createdAt: $createdAt, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.isAdmin == isAdmin &&
        other.createdAt == createdAt &&
        other.password_confirmation == password_confirmation &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        isAdmin.hashCode ^
        createdAt.hashCode ^
        password_confirmation.hashCode ^
        token.hashCode;
  }
}
