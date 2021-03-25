import 'enviar_email.dart';

void main() {
  var enviarEmail = EnviarEmail();

  // Uma função dentro da classe com o nome de call, pode ser chamada diretamente
  // conforme exemplo abaixo
  enviarEmail('wintermarcio@gmail.com');

  // Outras função desta classe, devem ser chamadas da forma normal
  enviarEmail.listaEmail();
}
