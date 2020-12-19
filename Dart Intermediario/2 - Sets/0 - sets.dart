void main() {
  // Set ignora números duplicados
  // é uma lista desordenada
  Set<int> numeros = Set<int>();
  numeros.add(1);
  numeros.add(2);
  numeros.add(3);
  numeros.add(2);
  numeros.add(8);

  // Outra forma de iniciar um SET quando já se sabe os valores
  Set<int> numeros2 = {1, 2, 5, 7, 9};

  print(numeros);

  numeros.forEach(print);

  print('\nSet não tem [] - ele utiliza o elementAT()');
  for (var i = 0; i < numeros.length; i++) {
    print(numeros.elementAt(i));
  }

  // Imprimi o que tem de diferente entre as listas de SET
  print('\nNúmeros diferentes');
  print(numeros.difference(numeros2));

  // Junta os dos sets, mas não aceita os duplicados
  print('\nOs 2 sets Juntos');
  print(numeros.union(numeros2));

  print('\nNúmeros que estão presentes nas 2 listas');
  print(numeros.intersection(numeros2));

  print('\nTodos os números $numeros');
  print('Números presente na posição indicada no lookup');
  print(numeros.lookup(2));
}
