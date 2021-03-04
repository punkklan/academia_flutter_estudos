/* 
Exercício 3:
Crie uma variável com o nome Pedro de Alcântara Francisco Antônio João Carlos Xavier 
de Paula Miguel Rafael Joaquim José Gonzaga Pascoal Cipriano Serafim de Bragança e Bourbon
Imprima a quantidade de nomes que essa variavel tem.
Dica: Lembre do método (split)  
*/

void main() {
  var nome =
      'Pedro de Alcântara Francisco Antônio João Carlos Xavier de Paula Miguel Rafael Joaquim José Gonzaga Pascoal Cipriano Serafim de Bragança e Bourbon';
  var nomeList = nome.split(' ');
  print(nomeList);
  List<String> nomeList2 = [];
  for (var i = 0; i < nomeList.length; i++) {
    if (nomeList[i] == 'de' || nomeList[i] == 'e') {
      continue;
    }
    nomeList2.add(nomeList[i]);
  }
  print(nomeList2);
  print('A variável nome contêm ${nomeList2.length} nomes');
}
