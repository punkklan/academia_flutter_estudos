import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_desafio_revenda_gas/app/model/revenda_model.dart';

class RevendasRepository {
  Future<List<RevendaModel>> buscarTodasRevendas() async {
    var jsonFile = await rootBundle.loadString('assets/dados.json');
    var revendas = json.decode(jsonFile) as List;
    return revendas.map((r) => RevendaModel.fromMap(r)).toList();
  }
}
