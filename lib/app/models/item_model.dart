import 'dart:convert';

class ItemModel {
  int? id;
  String? name;
  num? quantidade;
  bool? comprado;
  int? lista_id;

  ItemModel({
    this.id,
    this.name,
    this.quantidade,
    this.comprado,
    this.lista_id,
  });

  ItemModel copyWith({
    int? id,
    String? name,
    num? quantidade,
    bool? comprado,
    int? lista_id,
  }) {
    return ItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      quantidade: quantidade ?? this.quantidade,
      comprado: comprado ?? this.comprado,
      lista_id: lista_id ?? this.lista_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantidade': quantidade,
      'comprado': comprado,
      'lista_id': lista_id,
    };
  }

  static List<ItemModel> fromList(list) {
    return List<ItemModel>.from(list.map((x) => ItemModel.fromMap(x)));
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id']?.toInt(),
      name: map['name'],
      quantidade: map['quantidade'],
      comprado: map['comprado'],
      lista_id: map['lista_id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ItemModel(id: $id, name: $name, quantidade: $quantidade, comprado: $comprado, lista_id: $lista_id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemModel &&
        other.id == id &&
        other.name == name &&
        other.quantidade == quantidade &&
        other.comprado == comprado &&
        other.lista_id == lista_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        quantidade.hashCode ^
        comprado.hashCode ^
        lista_id.hashCode;
  }
}
