import 'package:script_ibge_sql/ibgeToSql.dart' as ibge_to_sql;

Future<void> main() async {
  ibge_to_sql.run(excluirTabelas: false);
}
