import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> getConnection() async {
  var settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
    db: 'curso_dart_flutter',
  );

  return await MySqlConnection.connect(settings);
}

Future<void> cadastrarAluno(String nome, String turma) async {
  var conn = await getConnection();
  var turmaId = await getIdTurma(turma);
  try {
    var result = await conn.query('insert aluno(cd_aluno, nome) values(?, ?)',
        [null, nome.toLowerCase()]);
    if (result.affectedRows > 0) {
      print('Inserido aluno $nome no ID ${result.insertId}');
      var alunoId = result.insertId;

      result = await conn.query(
          'insert turma_aluno(id_aluno, id_turma) values(?, ?)',
          [alunoId, turmaId]);
    }
    await conn.close;
  } catch (e) {
    print('Erro = $e');
    await conn.close;
  }
}

Future<void> cadastrarTurma(String nome) async {
  var conn = await getConnection();

  try {
    var result = await conn.query(
        'insert turma(id, nome) values(?, ?)', [null, nome.toLowerCase()]);
    if (result.affectedRows > 0) {
      print('Cadastrado turma ${nome.toUpperCase()} no ID ${result.insertId}');
    }
    await conn.close;
  } catch (e) {
    print('Erro = $e');
    await conn.close;
  }
}

Future<void> alterarAluno(int id, String nome) async {
  var conn = await getConnection();
  var result = await conn.query(
      'update aluno set nome=? where cd_aluno = ?', [nome.toLowerCase(), id]);
  if (result.affectedRows > 0) {
    await conn.close;

    print('Aluno do Id: $id foi alterado para "$nome"');
  } else {
    print('Nenhuma alteração realizada');

    await conn.close;
  }
}

Future<int> getIdTurma(String nomeTurma) async {
  var conn = await getConnection();
  try {
    var result = await conn
        .query('SELECT * FROM turma where nome = ?', [nomeTurma.toLowerCase()]);
    var turmaId = result.first[0];
    await conn.close;
    return turmaId;
  } catch (e) {
    print(e);
    await conn.close;
    return null;
  }
}

Future<void> printAllAlunos() async {
  var conn = await getConnection();
  var result = await conn.query('''
        SELECT t.nome, a.cd_aluno, a.nome FROM turma t
	        inner join turma_aluno ta on ta.id_turma = t.id
          inner join aluno a on ta.id_aluno = a.cd_aluno;''');

  print('\n-Alunos cadastrados-\n');
  result.forEach((a) {
    print('Nome: ${a[2]} \nId: ${a[1]} \nTurma: ${a[0]} \n');
  });
  await conn.close;
}
