/*
Exercício 1:
Crie uma variável com o nome Pedro de Alcântara Francisco Antônio 
João Carlos Xavier de Paula Miguel Rafael Joaquim José Gonzaga Pascoal Cipriano Serafim de Bragança e Bourbon
Imprima a quantidade de caracteres que tem nessa variável.
*/

void main() {
  var nome =
      'Pedro de Alcântara Francisco Antônio João Carlos Xavier de Paula Miguel Rafael Joaquim José Gonzaga Pascoal Cipriano Serafim de Bragança e Bourbon';

  print('Quantidade de caracteres na variável nome:');
  print('Contando os espaços ${nome.length}');
  var nomeCaractere = nome.replaceAll(' ', '');
  print('Sem contar os espaços ${nomeCaractere.length}');

  print(nome.trim()); // remove apenas espaça o início e final da string
}
