void main() {
  int idade = 30;

  if (idade == 30) {
    print('idade é $idade');
  }

  // sem as chaves ele retorna apenas a primeira linha
  //   sem chaves não é uma boa prática
  if (idade == 30) print('Segundo print idade $idade');
  print(idade); // essa linha não esta no if

  if (idade == 30) {
    print('é trinta');
  } else {
    print('não é trinta');
  }

  if (idade == 30) {
    print('if e else if  = é trinta');
  } else if (idade == 40) {
    print('if e else if  = é quarenta');
  }
}
