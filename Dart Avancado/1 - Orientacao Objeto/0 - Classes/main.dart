import './camiseta.dart';

void main() {
  Camiseta camiseta = Camiseta();

  print(camiseta.tamanho);

  camiseta.tamanho = 'gg';
  print(camiseta.tamanho);

  print(camiseta.marca);

  print('Funcao recuperaCor = ${camiseta.recuperaCor()}');
  camiseta.alterarCor('azul');
  print('Funcao recuperaCor = ${camiseta.recuperaCor()}');

  // recuperando cor pelo Getter
  print('Método get cor = ${camiseta.getCor}');

  // alterando cor pelo Setter
  camiseta.cor = 'azul';
  print('Cor alterada para ${camiseta.getCor} utilizando o Set');
}
