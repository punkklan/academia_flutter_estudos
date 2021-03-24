import 'package:script_ibge_sql/connection.dart' as sql;

Future<void> main() async {
  await sql.excluirTabelas();
  await sql.criarTabela();
  await sql.inserirEstado();
}
