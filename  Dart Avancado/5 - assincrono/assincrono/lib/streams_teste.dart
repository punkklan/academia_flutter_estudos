import 'dart:async';

void run() {
  print('Streams Teste');

  var streamController = StreamController();

  var portaDeEntrada = streamController.sink;

  // Se for apenas streamController.stream() apenas um pode ficar escutando a saida
  // para vários escutarem,  adicionamos o  .asBrodcastStream()
  var portaDeSaida = streamController.stream.asBroadcastStream();

  //  o  .listen  é que fica escutando a saída
  portaDeSaida.listen((event) => print('${DateTime.now()} escuta 1 = $event'));
  portaDeSaida.listen((event) => print('${DateTime.now()} escuta 2 = $event'));

  Future.delayed(Duration(seconds: 3), () => portaDeEntrada.add('Bolinha 1'));
  portaDeEntrada.add('Bolinha 2');
  portaDeEntrada.add('Bolinha 3');
  portaDeEntrada.add('Bolinha 4');
  portaDeEntrada.add('Bolinha 5');
}
