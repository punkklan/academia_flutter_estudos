import 'pessoa.dart';

void main() {
  var pessoa = Pessoa(nome: 'João', idade: 30);
  pessoa.nome = 'Marcio Winter';
  pessoa.idade = 40;

  var pessoa2 = Pessoa(nome: 'Zezinho', idade: 15);

  var pessoa3 = Pessoa.soComNome('Maria');

  var pessoa4 = Pessoa.comIdadeOpcional('Marta', 50);

  print(pessoa.nome);
  print('${pessoa2.nome} - ${pessoa2.idade}');
  print(pessoa3.nome);
  print(pessoa4.nome);
}
