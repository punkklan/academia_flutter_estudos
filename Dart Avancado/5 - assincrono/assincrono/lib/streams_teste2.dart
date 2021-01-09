import 'dart:async';

void run() {
  print('Streams Teste 2\n');

  var streamController = StreamController();

  var portaDeEntrada = streamController.sink;

  // Se for apenas streamController.stream() apenas um pode ficar escutando a saida
  // para vários escutarem,  adicionamos o  .asBrodcastStream()
  var portaDeSaida = streamController.stream.asBroadcastStream();

  portaDeSaida
      .where((event) => (event % 2) == 0)
      .listen((event) => print('Bolinha par $event'));

  portaDeSaida
      .skip(2)
      .where((event) => (event % 2) == 1)
      .map((event) => 'impar $event')
      .listen((event) => print('Bolinha $event'));

  List.generate(20, (index) => index++)
      .forEach((value) => portaDeEntrada.add(value));
}
