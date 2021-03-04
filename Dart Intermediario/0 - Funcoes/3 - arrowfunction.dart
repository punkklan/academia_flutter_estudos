main(List<String> args) {
  print(soma(10, 10));
  print(somaArrow(20, 20));
}

// Funcao comum
int soma(int numero, int numero2) {
  return numero + numero2;
}

//  Funcao Arrow  "seta",  é de uma ÚNICA linha
int somaArrow(int numero, int numero2) => numero + numero2;
