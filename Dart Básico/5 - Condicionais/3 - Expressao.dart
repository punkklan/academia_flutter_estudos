void main() {
  var numerico = int.tryParse('Rodrigo') ?? 0; //  ?? operador OU ..
  print(numerico);

  if ((int.tryParse("Marcio") ?? 0) > 20) {
    print('maior que 20');
  } else {
    print('retornou 0, porque não conseguiu converter para um inteiro');
  }
}
