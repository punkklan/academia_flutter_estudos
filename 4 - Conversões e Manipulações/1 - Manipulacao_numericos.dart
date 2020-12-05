void main() {
  int idade = 30;
  print(idade.toString());

  int valor = -10;
  if (valor.isNegative) {
    print('Valor de $valor é negativo');
  }

  double valorDouble = 10.11;
  print(valorDouble.round());
  print(valorDouble.roundToDouble());

  String valorString = '30';
  int valorInt = int.parse(valorString);
  print(valorInt);

  //   int.parse('Marcio');     Isso vai dar erro, Marcio não é um int
  int? valorTryParse = int.tryParse('Marcio'); // try = tente
  print(valorTryParse);
  valorTryParse == null
      ? print('Variável null') //  Não consegui o parse, portanto é nulo
      : print(valorTryParse);

  double preco = 30.26456;
  print(preco.toStringAsFixed(2));
}
