import 'dart:convert';

class DistritoModel {
  int id;
  String nome;
  int id_estado;
  DistritoModel({
    this.id,
    this.nome,
    this.id_estado,
  });

  DistritoModel copyWith({
    int id,
    String nome,
    int id_estado,
  }) {
    return DistritoModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      id_estado: id_estado ?? this.id_estado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'id_estado': id_estado,
    };
  }

  factory DistritoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DistritoModel(
      id: map['id'],
      nome: map['nome'],
      id_estado: map['id_estado'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DistritoModel.fromJson(String source) =>
      DistritoModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'DistritoModel(id: $id, nome: $nome, id_estado: $id_estado)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DistritoModel &&
        o.id == id &&
        o.nome == nome &&
        o.id_estado == id_estado;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ id_estado.hashCode;
}
