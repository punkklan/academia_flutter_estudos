import 'animal.dart';

class Cachorro extends Animal {
  String nome = '';

  // essa funcao de calculo já existe em Animal, e aqui esta sobrescrevendo
  // utilizando outra formula
  @override
  int calculaIdadeHumana() {
    return idade * 7;
  }
}
