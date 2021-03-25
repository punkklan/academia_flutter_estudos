import './file2.dart' as file2;
import './file3.dart' as file3;

void main() {
  // chamando a função soma contido neste arquivo
  print(soma(2, 5));

  // chamando a função soma que está no file2 e foi nomeada
  // no import ( as file2 )
  print(file2.soma(2, 5));

  // chamando a função soma que está no file3 e foi nomeada
  // no import ( as file3 )
  print(file3.soma(2, 5));
}

String soma(int num1, int num2) {
  return 'Total file 1 = ${num1 + num2}';
}
