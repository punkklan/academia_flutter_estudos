import 'dart:collection';

main() {
  Set<String> letras = Set<String>();
  letras.add('a');
  letras.add('b');
  letras.add('c');
  letras.add('d');
  print('\nO Set print na ordem em que foi adicionado');
  print(letras);

  print('\nObservação: o HashSet não ordena quando tem mais de 1 caractere');

  HashSet<String> letrasHash = HashSet<String>();
  letrasHash.add('a');
  letrasHash.add('b');
  letrasHash.add('c');
  letrasHash.add('d');
  print('O Hashset print na ordem que ele quiser');
  print(letrasHash);
}
