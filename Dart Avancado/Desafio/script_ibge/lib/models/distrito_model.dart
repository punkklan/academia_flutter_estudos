import 'dart:convert';

class DistritoModel {
  int id;
  String nome;
  DistritoModel({
    this.id,
    this.nome,
  });

  DistritoModel copyWith({
    int id,
    String nome,
  }) {
    return DistritoModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  factory DistritoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DistritoModel(
      id: map['id'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DistritoModel.fromJson(String source) =>
      DistritoModel.fromMap(json.decode(source));

  @override
  String toString() => 'DistritoModel(id: $id, nome: $nome)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DistritoModel && o.id == id && o.nome == nome;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode;
}
