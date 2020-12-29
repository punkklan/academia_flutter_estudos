import 'carro.dart';
import 'fiesta.dart';
import 'uno.dart';

void main() {
  Uno uno = Uno();
  Fiesta fiesta = Fiesta();

  print(uno.motor);
  print(uno.calculaVelocidadeMaxima());
  print(uno.calculaQuantidadeRodas());

  Carro carro = Uno();
  print(carro.calculaVelocidadeMaxima());
//  print(carro.calculaQuantidadeRodas());

// carro.calculaQuantidadeRodas()    só existe no UNO e não no "contrato" / (implements)

  mostrarVelocidadeMaxima(uno);
  mostrarVelocidadeMaxima(fiesta);
}

mostrarVelocidadeMaxima(Carro carro) {
  print('Velocidade máxima é ${carro.calculaVelocidadeMaxima()}');
}
