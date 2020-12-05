void main() {
  //  operadores logicos boleanos
  //  &&(e)   ||(ou)    !(not)

  print('Operador &&');
  print((true && true));
  print((true && false));

  var idade = 30;
  var sexo = 'masculino';

  //     true             true
  if (idade == 30 && sexo == 'masculino') {
    print('tem 30 anos e é homem');
  }

  //  ! invertendo   true             true   vai retornar false
  if (!(idade == 30 && sexo == 'masculino')) {
    print('tem 30 anos e é homem');
  }

  //     true             true
  if ((idade == 30 || sexo == 'masculino')) {
    print('Um dos dois é verdadeiro');
  }
}
