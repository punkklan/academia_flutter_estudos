import 'animal.dart';
import 'cachorro.dart';

void main() {
  var cachorro = new Cachorro();
  var animal = Animal();

  cachorro.tamanho = 'G';
  cachorro.idade = 10;

  print(cachorro.tamanho);
  print('Idade cachorro = ${cachorro.idade}');
  print('Idade humana do cachorro = ${cachorro.calculaIdadeHumana()}');

  animal.idade = 10;
  print('\nIdade humana de animal = ${animal.calculaIdadeHumana()}');
}
