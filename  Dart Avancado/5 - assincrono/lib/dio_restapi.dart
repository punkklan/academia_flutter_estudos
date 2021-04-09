import 'package:assincrono/repository/viacep_repository.dart';
import 'package:dio/dio.dart';

Future<void> run() async {
  print('Dio Rest API');

  var dio = Dio();

// -----------------------------------------------------------------------------
  //  ---  metodo utilizado nas primeiras aulas DIO ---
  try {
    // ignore: omit_local_variable_types
    Response response = await dio.get('https://viacep.com.br/ws/01001000/json/');

    if (response.statusCode == 200) {
      var respData = response.data;
      print('Resposta : $respData');
      print('CEP : ${respData['cep']}');
    }
  } catch (e) {
    print(e);
  }

// -----------------------------------------------------------------------------
  //  ---  metodo utilizado na aula Classes de Modelo (models) ---

  var endereco = await ViaCepRepository().buscarEndereco();
  print('CEP : ${endereco.cep}');
  print('Logradouro : ${endereco.logradouro}');

// -----------------------------------------------------------------------------
  // printa todo o objeto utilizando o toMap
  print('\nPrint via toMap');

  print(endereco.toMap());

  print(endereco.toString());

  var getComments = await dio.get(
    'https://jsonplaceholder.typicode.com/comments',
    queryParameters: {'userId': 1},
  );
  print('\nResposta do getComments:');
  print(getComments.data[0]);

// -----------------------------------------------------------------------------
  // metodo POST com o DIO
  // ignore: omit_local_variable_types
  Map<String, dynamic> requestSavePost = {'title': 'foot', 'body': 'bar', 'userId': 1};
  var responseSavePost = await dio.post(
    'https://jsonplaceholder.typicode.com/posts',
    data: requestSavePost,
  );
  print('\nPost via DIO');
  print('Resposta do responseSavePost:');
  print(responseSavePost.statusCode);
  print(responseSavePost.data);

// -----------------------------------------------------------------------------
  // fazendo um UPDATE fake do post 1
  var url1 = 'https://jsonplaceholder.typicode.com/posts/1';

  // ignore: omit_local_variable_types
  Map<String, dynamic> requestUpdatePost = {'id': 1, 'title': 'xxx', 'body': 'bar', 'userId': 1};

  var responseUpdatePost = await dio.put(
    url1,
    data: requestUpdatePost,
  );
  print('\nUpdate via DIO');
  print('Resposta do responseUpdatePost:');
  print(responseUpdatePost.statusCode);
  print(responseUpdatePost.data);

// -----------------------------------------------------------------------------
  // deletando o post 1

  var responseDeletePost = await dio.delete('https://jsonplaceholder.typicode.com/posts/1');
  print('\nDelete via DIO');
  print('Resposta do responseDeletePost:');
  print(responseDeletePost.statusCode);
  print(responseDeletePost.data);

// -----------------------------------------------------------------------------
  // PATCH do post 1
  var responsePatchPost = await dio.patch(
    'https://jsonplaceholder.typicode.com/posts/1',
    data: {'title': 'Marcio Winter'},
  );
  print('\nPatch via DIO');
  print('Resposta do responsePatchPost:');
  print(responsePatchPost.statusCode);
  print(responsePatchPost.data);
}

// -----------------------------------------------------------------------------
// INTERCEPTORS
// verifique aula https://academiadoflutter.club.hotmart.com/lesson/1461n69AOd/async-dio
//  em 15 minutos
Future<void> dioInteceptorsteste() async {
  print(' -- INTERCEPTORS --');
  var dio = Dio();
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (request) => print('onRequest'),
      onResponse: (response) => print('onResponse'),
      onError: (error) => print('onErro'),
    ),
  );

  var getComments = await dio.get(
    'https://jsonplaceholder.typicode.com/comments',
    queryParameters: {'userId': 1},
  );

  print(getComments.data[0]);
}
