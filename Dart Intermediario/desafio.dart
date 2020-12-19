import 'dart:collection';

// Baseado na lista acima.
// 1 - Remover os duplicados
// 2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino
// 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos
//     e mostre a quantidade de pessoas com mais de 18 anos
// 4 - Encontre a pessoa mais velha.

void main() {
  var pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Masculino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  List<List<String>> pessoa = filtro(pessoas);

  printcontaGenero(pessoa);

  printMais18(pessoa);

  printMaisVelha(pessoa);
}

List<List<String>> filtro(List<String> pessoas) {
  List<List<String>> pessoa = [];
  // Utilizando o SplauTreeSet para remover itens completamente iguais da Lista
  SplayTreeSet<String> dados = SplayTreeSet();
  for (var i in pessoas) {
    dados.add(i);
  }
  for (int p = 0; p < dados.length; p++) {
    List<String> pSplit = dados.elementAt(p).split('|');
    pessoa.add(pSplit);
  }
  return pessoa;
}

void printcontaGenero(List<List<String>> pessoa) {
  int numMasc = 0;
  int numFem = 0;
  for (int index = 0; index < pessoa.length; index++) {
    if (pessoa[index][2] == 'Masculino') {
      numMasc++;
    } else if (pessoa[index][2] == 'Feminino') {
      numFem++;
    }
  }
  print(
      'A lista contêm pessoas do sexo: \nMasculino = $numMasc pessoas. \nFeminino  = $numFem pessoas.');
}

void printMais18(List<List<String>> pessoa) {
  int numero = 0;
  for (int index = 0; index < pessoa.length; index++) {
    int idade = int.tryParse(pessoa[index][1]) ?? 0;
    if (idade > 18) {
      numero++;
    }
  }
  print('Com mais de 18 anos = $numero de pessoas.');
}

void printMaisVelha(List<List<String>> pessoa) {
  int idade1 = 0, idade2 = 0;
  String pessoaMaisVelha = '';
  for (int index = 0; index < pessoa.length; index++) {
    idade2 = int.tryParse(pessoa[index][1]) ?? 0;
    if (idade1 < idade2) {
      idade1 = idade2;
      pessoaMaisVelha = pessoa[index][0];
    }
  }
  print('Pessoa com maior idade = $pessoaMaisVelha, tem $idade1 anos.');
}
