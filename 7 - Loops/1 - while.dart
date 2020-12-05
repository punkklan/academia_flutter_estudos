void main() {
  int numero = 1;

  while (numero <= 10) {
    print(numero);
    numero++;
  }

  numero = 1;
  print('do while');
  do {
    print(numero);
    numero++;
  } while (numero <= 10);
}
