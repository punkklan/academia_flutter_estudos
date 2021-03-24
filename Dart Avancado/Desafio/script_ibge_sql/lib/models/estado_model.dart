import 'dart:convert';

class EstadoModel {
  int id;
  String nome;
  String sigla;
  EstadoModel({
    this.id,
    this.nome,
    this.sigla,
  });

  EstadoModel copyWith({
    int id,
    String nome,
    String sigla,
  }) {
    return EstadoModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      sigla: sigla ?? this.sigla,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sigla': sigla,
    };
  }

  factory EstadoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EstadoModel(
      id: map['id'],
      nome: map['nome'],
      sigla: map['sigla'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EstadoModel.fromJson(String source) =>
      EstadoModel.fromMap(json.decode(source));

  @override
  String toString() => 'EstadoModel(id: $id, nome: $nome, sigla: $sigla)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EstadoModel && o.id == id && o.nome == nome && o.sigla == sigla;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ sigla.hashCode;
}
