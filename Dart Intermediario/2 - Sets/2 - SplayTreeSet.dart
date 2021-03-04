import 'dart:collection';

main() {
  SplayTreeSet<int> numeros = SplayTreeSet();
  numeros.add(48);
  numeros.add(128);
  numeros.add(2);
  numeros.add(5);
  numeros.add(9);
  print(
      'O splayTreeSet é uma lista árvore ordenada, que não aceita null e ignora duplicados');
  print(numeros);
}
