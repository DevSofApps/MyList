import 'dart:convert';

class ListaModel {
  int? id;
  String? name;
  int? userId;
  String? created_at;

  ListaModel({
    this.id,
    this.name,
    this.userId,
    this.created_at,
  });

  ListaModel copyWith({
    int? id,
    String? name,
    int? userId,
    String? created_at,
  }) {
    return ListaModel(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userId': userId,
      'created_at': created_at,
    };
  }

  factory ListaModel.fromMap(Map<String, dynamic> map) {
    return ListaModel(
      id: map['id']?.toInt(),
      name: map['name'],
      userId: map['userId']?.toInt(),
      created_at: map['created_at'],
    );
  }

  static List<ListaModel> fromList(list) {
    return List<ListaModel>.from(list.map((x) => ListaModel.fromMap(x)));
  }

  String toJson() => json.encode(toMap());

  factory ListaModel.fromJson(String source) =>
      ListaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListaModel(id: $id, name: $name, userId: $userId, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListaModel &&
        other.id == id &&
        other.name == name &&
        other.userId == userId &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ userId.hashCode ^ created_at.hashCode;
  }
}
