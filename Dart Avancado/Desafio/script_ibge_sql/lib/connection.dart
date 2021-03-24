import 'package:mysql1/mysql1.dart';
import 'package:script_ibge_sql/models/estado_model.dart';
import 'package:script_ibge_sql/repository/ibge_api.dart';

Future<MySqlConnection> getConnection() async {
  final settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
    db: 'desafio_ibge',
  );

  return await MySqlConnection.connect(settings);
}

Future<void> excluirTabelas() async {
  try {
    var conn = await getConnection();
    await conn.query('drop table tbl_distrito');
    await conn.query('drop table tbl_estado');
    await conn.close();
    print('Tableas excluidas');
  } catch (error) {
    print(error);
  }
}

Future<void> criarTabela() async {
  try {
    var conn = await getConnection();
    await conn.query('''
    CREATE TABLE IF NOT EXISTS tbl_estado (
    id_api INT NOT NULL UNIQUE PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sigla VARCHAR(2) NOT NULL
    );
  ''');

    print('Tabela tbl_estado criada');

    await conn.query('''
    CREATE TABLE IF NOT EXISTS tbl_distrito (
      id_api INT NOT NULL UNIQUE PRIMARY KEY,
      nome VARCHAR(50) NOT NULL,
      fk_id_estado INT NOT NULL,
      CONSTRAINT fk_id_estado FOREIGN KEY (fk_id_estado)
      REFERENCES tbl_estado(id_api)
      ON DELETE CASCADE
      ON UPDATE CASCADE
      );
  ''');

    print('Tabela tbl_distrit criada');

    await conn.close();
  } catch (error) {
    print(error);
  }
}

Future<void> inserirEstado() async {
  var dataEstado = await IbgeRepository().getEstado();
  dataEstado.forEach((elemento) async {
    var estado = EstadoModel.fromMap(elemento);
    try {
      var conn = await getConnection();
      await conn.query(
          'INSERT INTO tbl_estado (id_api, nome, sigla) VALUES (?, ?, ?)',
          [estado.id, estado.nome, estado.sigla]);
      print('Gravado do DB o estado ${estado.nome}');
      await conn.close();
    } catch (error) {
      print(error);
    }
  });
}
