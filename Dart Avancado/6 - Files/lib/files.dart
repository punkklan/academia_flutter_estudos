import 'dart:convert';
import 'dart:io';

void run() {
  print('Files RUN\n');

  print('Iniciando');

  var file = File('lib/file.txt');

  // .readAsString() é um futuro  'async'
  // neste exemplo estamos recebendo todo o txt como uma única string
  // file.readAsString().then((str) => print(str));

  // .readAsStringSync()  aguarda o retorno 'sync'
  // var str = file.readAsStringSync();
  // print(str);

  // neste exemplo estamos recebendo linha a linha do txt como uma string
  // file
  //     .readAsLines()
  //     .then((linhas) => linhas.forEach((l) => print('Linha: $l')));

  // neste exemplo estamos recebendo escutando um stream o qual retornar todo o
  // conteúdo em uma lista de inteiro do e tranformamospara uma String com o
  // transform utf8
  var stream = file.openRead();
  stream.transform(utf8.decoder).listen((value) => print(value));

  // LineSplitter esta quebrando o txt linha a linha
  var stream2 = file.openRead();
  stream2.transform(utf8.decoder).transform(LineSplitter()).listen(
      (value) => print('Linha X: $value'),
      onError: (error) => print('Erro : $error'),
      onDone: () => print('Leitura do TXT finalizada'));

  // Gravando uma string em TXT
  gravarTxt('file2.txt', 'Testando a função de gravar um TXT');

  var writeFile3 = File('lib/file3.txt').openWrite();
  writeFile3.write('Linha 1\n');
  writeFile3.write('Linha 2\n');
  writeFile3.write('Linha 3\n');

  print('Finalizado');
}

void gravarTxt(String nomeArquivo, String msg) {
  File('lib/$nomeArquivo').writeAsString(msg).then((file) {
    print('Gravando Arquivo $nomeArquivo');
    print('O $nomeArquivo tem ${file.lengthSync()} caracteres');
  }, onError: (e) => print('Error : $e'));
}
