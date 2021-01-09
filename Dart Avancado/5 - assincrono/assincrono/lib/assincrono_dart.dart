void run() {
  print('Inicio do RUN');

  processo1();

  processo2();

  processo3()
      // quando o valor for retornado o then será executado
      .then((value) => print('Mensagem recebida: $value'))
      // quando o processo3 foi completamente terminado o whenComplete será executado
      // independente se o processo gerou algum erro ou não
      .whenComplete(() => print('P3 COMPLETO'));

  processo4().then((value) => print(value),
      onError: (err) => print('Mensagem de erro tratada - $err'));

  processo4().then((value) => print(value)).catchError(
      (erro) => print('Mensagem de erro tratada com catchError - $erro'));

  print('Fim do RUN');
}

void processo1() {
  print('Inicio do P1');
  print('Fim do P1');
}

void processo2() {
  print('Inicio do P2');
  Future.delayed(
    Duration(seconds: 2),
    () {
      for (var i = 1; i <= 5; i++) {
        print(i);
      }
      print('Fim do P2');
    },
  );
}

Future<String> processo3() {
  print('Inicio do P3');
  return Future<String>.value(
      Future.delayed(Duration(seconds: 3), () => 'Fim do P3'));
}

Future<String> processo4() {
  print('Inicio do P4');
  return Future<String>.value(Future.delayed(
      Duration(seconds: 4), () => throw Exception('Erro ao buscar o P4')));
}
