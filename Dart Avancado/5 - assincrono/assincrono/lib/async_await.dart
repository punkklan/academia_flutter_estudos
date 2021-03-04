Future<void> run() async {
  print('Inicio Run');

  var msg = await processo3();
  print('Messagem recebida: $msg');

  try {
    await processo4();
  } catch (e) {
    print('Erro em $e');
  }

  print('Fim Run');
}

Future<String> processo3() {
  print('Inicio do P3');
  return Future<String>.value(
      Future.delayed(Duration(seconds: 3), () => 'Fim do P3'));
}

Future<String> processo4() {
  print('Inicio do P4');
  return Future<String>.value(Future.delayed(
      Duration(seconds: 3), () => throw Exception('Erro ao buscar o P4')));
}
