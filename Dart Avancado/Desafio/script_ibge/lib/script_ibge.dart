import 'dart:io';
import 'package:script_ibge/models/distrito_model.dart';
import 'package:script_ibge/models/estado_model.dart';
import 'package:script_ibge/repository/ibge_api.dart';
import 'package:intl/intl.dart';

Future<void> myqsl() async {
  print('Script SQL');

  var file = File('build/Scrip_SQL.txt');
  var sink = file.openWrite();

  var formatted = DateFormat('dd-MM-yyyy');
  var day = formatted.format(DateTime.now());

  sink.write('''
#             SCRIPT CREATE: ${day}'

''');

  sink.write('''

# -------------- CREATE TABLES --------------
#                 tbl_estado
#                 tbl_distrito
#                 estado_distrito  

''');

  sink.write('''
CREATE TABLE IF NOT EXISTS tbl_estado (
  id_api INT NOT NULL UNIQUE PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  sigla VARCHAR(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS tbl_distrito (
  id_api INT NOT NULL UNIQUE PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  fk_id_estado INT NOT NULL UNIQUE,
  CONSTRAINT fk_id_estado FOREIGN KEY (fk_id_estado)
  REFERENCES tbl_estado(id_api)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
);

''');

  var dataEstado = await IbgeRepository().getEstado();
  var estado_id = [];

  sink.write('''

# -------------- INSERT ESTADOS --------------

''');

  dataEstado.forEach(
    (listEstado) {
      var estado = EstadoModel.fromMap(listEstado);
      //   var dataDistrito = await IbgeRepository().getDistrito(estado.id);
      estado_id.add(estado.id);
      sink.write('''
INSERT INTO tbl_estado (id_api, nome, sigla) VALUES (${estado.id}, "${estado.nome}", "${estado.sigla}");           
''');
    },
  );

  print('lista de Id`s dos estados $estado_id');

  sink.write('''

# -------------- INSERT DISTRITOS --------------

''');

  sink.write('''
INSERT INTO tbl_distrito (id_api, nome, fk_id_estado) VALUES 
''');

  for (var x = 0; x < estado_id.length; x++) {
    var pontuacao = ',';
    var dataDistrito = await IbgeRepository().getDistrito(estado_id[x]);
    print('\nGravando Distritos do Estado ID ${estado_id[x]}');
    for (var y = 0; y < dataDistrito.length; y++) {
      var distrito = DistritoModel.fromMap(dataDistrito[y]);
      x + 1 == estado_id.length && y + 1 == dataDistrito.length
          ? pontuacao = ';'
          : pontuacao = ',';
      sink.write('''
  (${distrito.id}, "${distrito.nome}", ${estado_id[x]})''');
      sink.write('''$pontuacao
  ''');
    }
  }
  await sink.close();
}
