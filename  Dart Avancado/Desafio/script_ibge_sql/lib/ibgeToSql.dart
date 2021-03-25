import 'package:mysql1/mysql1.dart';
import 'package:script_ibge_sql/models/distrito_model.dart';
import 'package:script_ibge_sql/models/estado_model.dart';
import 'package:script_ibge_sql/repository/connection.dart';
import 'package:script_ibge_sql/service/ibge_api.dart';

void run({bool excluirTabelas}) async {
  if (excluirTabelas) {
    await excluaTabelas();
  }
  await criarTabela();
  await inserirDadosSql();
}

Future<void> excluaTabelas() async {
  MySqlConnection conn;
  try {
    conn = await getConnection();
    await conn.query('drop table tbl_distrito');
    await conn.query('drop table tbl_estado');
    print('Tabelas excluidas');
  } catch (error) {
    print(error);
  } finally {
    await conn.close();
  }
}

Future<void> criarTabela() async {
  MySqlConnection conn;
  try {
    conn = await getConnection();

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
  } finally {
    await conn.close();
  }
}

Future<void> inserirDadosSql() async {
  MySqlConnection conn;
  try {
    conn = await getConnection();
    var dataEstado = await IbgeRepository().getEstado();
    await Future.forEach(
      dataEstado,
      (cadaEstado) async {
        var estado = EstadoModel.fromMap(cadaEstado);
        //   listaDeIdEstados.add(estado.id);
        await conn.query(
            'INSERT INTO tbl_estado (id_api, nome, sigla) VALUES (?, ?, ?)',
            [estado.id, estado.nome, estado.sigla]);
        print(
            '\nGravado do Bando de Dados o estado ${estado.nome} com Id = ${estado.id}');
        var dataDistrito = await IbgeRepository().getDistrito(estado.id);
        print(
            'Aguarde: gravando ${dataDistrito.length} distritos do estado ${estado.nome}');
        await Future.forEach(dataDistrito, (cadaDistrito) async {
          var distrito = DistritoModel.fromMap(cadaDistrito);
          await conn.query(
            'INSERT INTO tbl_distrito (id_api, nome, fk_id_estado) VALUES (?, ?, ?);',
            [distrito.id, distrito.nome, estado.id],
          );
        });
      },
    );
  } catch (error) {
    print(error);
  } finally {
    await conn.close();
  }
}
