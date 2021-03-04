void main() {
  var numeros = List.generate(10, (index) => index);

  for (var i = 0; i < numeros.length; i++) {
    print(numeros[i]);
  }

  print('imprimindo por for  in');
  for (var valor in numeros) {
    print(valor);
  }

  // o break vai parar o for conforme o if
  List<int> lista = [];
  print('imprimindo por for com um break');
  for (int i = 0; i < numeros.length; i++) {
    if (i == 5) {
      break;
    }
    lista.add(numeros[i]);
  }
  print(lista);

  // o continue vai pular o processamento pós o continue e vai continuar o for
  lista = [];
  print('imprimindo por for com um continue');
  for (int i = 0; i < numeros.length; i++) {
    if (i == 5) {
      continue;
    }
    lista.add(numeros[i]);
  }
  print(lista);
}
