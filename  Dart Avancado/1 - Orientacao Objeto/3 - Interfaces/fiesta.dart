import 'carro.dart';

class Fiesta implements Carro {
  @override
  String motor = "1.8";

  @override
  int portas = 5;

  @override
  int rodas = 5;

  @override
  int calculaVelocidadeMaxima() {
    return 220;
  }

  int calculaQuantidadeRodas() {
    return 5;
  }
}
