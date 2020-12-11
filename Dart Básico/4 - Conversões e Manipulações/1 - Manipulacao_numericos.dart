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
  int valorTryParse = int.tryParse('Marcio') ??
      0; // try = tente    se não conseguir ?? coloca o valor 0
  print(valorTryParse);

  double preco = 30.26456;
  print(preco.toStringAsFixed(2));
}
