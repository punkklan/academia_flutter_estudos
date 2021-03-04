import 'dart:convert';

class CidadeModel {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String unidade;
  String ibge;
  String gia;

  CidadeModel({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.unidade,
    this.ibge,
    this.gia,
  });

  CidadeModel copyWith({
    String cep,
    String logradouro,
    String complemento,
    String bairro,
    String localidade,
    String uf,
    String unidade,
    String ibge,
    String gia,
  }) {
    return CidadeModel(
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
      unidade: unidade ?? this.unidade,
      ibge: ibge ?? this.ibge,
      gia: gia ?? this.gia,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'unidade': unidade,
      'ibge': ibge,
      'gia': gia,
    };
  }

  factory CidadeModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CidadeModel(
      cep: map['cep'],
      logradouro: map['logradouro'],
      complemento: map['complemento'],
      bairro: map['bairro'],
      localidade: map['localidade'],
      uf: map['uf'],
      unidade: map['unidade'],
      ibge: map['ibge'],
      gia: map['gia'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CidadeModel.fromJson(String source) =>
      CidadeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CidadeModel(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade, uf: $uf, unidade: $unidade, ibge: $ibge, gia: $gia)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CidadeModel &&
        o.cep == cep &&
        o.logradouro == logradouro &&
        o.complemento == complemento &&
        o.bairro == bairro &&
        o.localidade == localidade &&
        o.uf == uf &&
        o.unidade == unidade &&
        o.ibge == ibge &&
        o.gia == gia;
  }

  @override
  int get hashCode {
    return cep.hashCode ^
        logradouro.hashCode ^
        complemento.hashCode ^
        bairro.hashCode ^
        localidade.hashCode ^
        uf.hashCode ^
        unidade.hashCode ^
        ibge.hashCode ^
        gia.hashCode;
  }
}
