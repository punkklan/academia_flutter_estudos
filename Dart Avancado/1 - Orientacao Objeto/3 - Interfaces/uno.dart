import 'carro.dart';

class Uno implements Carro {
  @override
  String motor = "1.0";

  @override
  int portas = 3;

  @override
  int rodas = 5;

  @override
  int calculaVelocidadeMaxima() {
    return 160;
  }

  int calculaQuantidadeRodas() {
    return 5;
  }
}
