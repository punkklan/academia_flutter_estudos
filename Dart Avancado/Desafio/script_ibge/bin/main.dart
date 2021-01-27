import 'script_ibge.dart' as script;

Future<void> main() async {
  // var typeSql = ['mysql', 'postgresql', 'menu'];
  // arguments == null
  //     ? arguments[0] = 'nada'
  //     : arguments[0] = arguments[0].toLowerCase();
  // if (typeSql.contains(arguments[0])) {
  //   print('ok');
  //   menu.run();
  // } else {
  //   //  ibge.myqsl();
  // }
  //  var estado = ibgeRepository().buscarEstado();

  // print(endereco.id);

  await script.myqsl();
}
