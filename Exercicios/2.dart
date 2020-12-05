/*
Exercício 2:
Construa uma lista com 10 nomes.
Imprima na tela cada nome com a frase: Sejá bem vindo NOME
*/

void main() {
  List<String> nomes = [
    'marcio',
    'joao',
    'josé',
    'pedro',
    'kerlly',
    'rafael',
    'carlos',
    'gabi',
    'tom',
    'lucas'
  ];

  for (int i = 0; i < nomes.length; i++) {
    print('Sejá bem vindo ${nomes[i].toUpperCase()}');
  }
}
