void main() {
  int idade = 16;

  idade >= 18 ? print('Maior de idade') : print('Menor de idade');

  idade <= 14
      ? print('Criança')
      : idade >= 18
          ? print('Adulto')
          : print('Adolecente');

  print(idade <= 14
      ? 'Criança'
      : idade >= 18
          ? 'Adulto'
          : 'Adolecente');

  int anoBisexto = 2020;
  print((anoBisexto % 4 == 0 || anoBisexto % 400 == 0 && anoBisexto % 100 != 0)
      ? '$anoBisexto é bisexto'
      : '$anoBisexto não é bisexto');
}
