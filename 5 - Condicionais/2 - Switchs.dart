void main() {
  int dia = 1;
  switch (dia) {
    case 0:
      print('Domingo');
      break;
    case 1:
      print('Segunda');
      break;
    case 2:
      print('Terça');
      break;
    case 3:
      print('Quarta');
      break;
    case 4:
      print('Quinta');
      break;
    case 5:
      print('Sexta');
      break;
    case 6:
      print('Sábado');
      break;
    default:
      print('Dia da semana inválido');
  }

  int idade = 19;
  switch (idade) {
    case 18:
    case 19:
      print('é 18 ou 19');
      break;
    default:
      print('NÃO é 18 e nem 19');
  }
}
