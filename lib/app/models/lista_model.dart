import 'dart:convert';

class ListModel {
  int? id;
  String? name;
  int? userId;
  String? created_at;

  ListModel({
    this.id,
    this.name,
    this.userId,
    this.created_at,
  });

  ListModel copyWith({
    int? id,
    String? name,
    int? userId,
    String? created_at,
  }) {
    return ListModel(
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

  factory ListModel.fromMap(Map<String, dynamic> map) {
    return ListModel(
      id: map['id']?.toInt(),
      name: map['name'],
      userId: map['userId']?.toInt(),
      created_at: map['created_at'],
    );
  }

  static List<ListModel> fromList(list) {
    return List<ListModel>.from(list.map((x) => ListModel.fromMap(x)));
  }

  String toJson() => json.encode(toMap());

  factory ListModel.fromJson(String source) =>
      ListModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListaModel(id: $id, name: $name, userId: $userId, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListModel &&
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
