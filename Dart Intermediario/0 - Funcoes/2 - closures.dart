main(List<String> args) {
  //  closures são funcoes dentro de funcoes
  Function mensagem = (String msg) {
    print(msg);
  };

  mensagem('Olá Marcio');

  var soma20 = soma(20);
  print(soma20(10));

  print(somaComFuncao(10, getNumero2));
}

Function soma(int num1) {
  return (int num2) {
    return num1 + num2;
  };
}

num somaComFuncao(int numero1, Function pegaNumero2) {
  return numero1 + pegaNumero2();
}

int getNumero2() {
  return 2;
}
