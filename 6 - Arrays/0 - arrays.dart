void main() {
  List<int> numeros = [20, 50, 690, 695, 700, 710, 750];
  print(numeros);

  numeros.add(750); // add adiciona no final da lista
  print(numeros);

  numeros.insert(0, 1); // primeiro item é o indice e o segundo o valor
  print(numeros);

  numeros.removeAt(3); // removou o item do indice 3 "690"
  print(numeros);

  numeros.remove(750); // removeu o valor informado
  print(numeros);

  //  remove o itens do indice informado até o anterior do segundo valor
  numeros.removeRange(3, 6);
  print(numeros);

  // remove itens mediate uma condição
  numeros.removeWhere((v) => v > 50);
  print(numeros);

  print(numeros.first);
  print(numeros.last);

  List<int> numeros2 = List.generate(10, (int x) => (x + 1) * 10);
  print(numeros2);

  // O primeiro resultado que atender a condição
  var resultado = numeros2.firstWhere((x) => x % 2 == 0);
  print(resultado);

  // O último resultado que atender a condição
  resultado = numeros2.lastWhere((x) => x % 3 == 0);
  print(resultado);

  List<int> numeros3 = List.generate(10, (int x) => x + 1);
  print(numeros3);

  // soma todos os valores da lista
  var soma = numeros3.fold(0, (int valor, elemento) => valor += elemento);
  print('A soma da lista $numeros3 é $soma');
}
