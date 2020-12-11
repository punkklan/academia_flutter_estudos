void main() {
  print('\nFunção soma');
  print('O resultado da Soma de 10 + 10 é ${soma(10, 10)}');

  print('\nFuncao soma Nomeada Default');
  print(
      'O resultado da Soma de 50 + 50 é ${somaNomeadaDefault(num1: 50, num2: 50)}');

  imprimir('marcio', idade: 40);
  imprimir('rAfAEL');
}

int soma(int num1, int num2) {
  return num1 + num2;
}

int somaNomeadaDefault({int num1 = 0, int num2 = 0}) {
  return num1 + num2;
}

void imprimir(String nome, {int idade = 0}) {
  print(
      'O nome é ${nome.toUpperCase()}${idade != 0 ? ' e tem $idade anos.' : '.'}');
}
