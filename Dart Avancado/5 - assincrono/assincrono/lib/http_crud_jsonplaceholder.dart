import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

// Site com informaçõs de status http
// httpstatuses.com

Future<void> run() async {
  var url = 'https://jsonplaceholder.typicode.com/posts';

  // criando um POST fake
  Map<String, dynamic> requestSavePost = {
    'title': 'foot',
    'body': 'bar',
    'userId': 1
  };

  var responseSavePost = await http.post(
    url,
    body: convert.jsonEncode(requestSavePost),
  );
  print('Post');
  print(responseSavePost.statusCode);
  print(responseSavePost.body);

  // fazendo um UPDATE fake do post 1
  var url1 = 'https://jsonplaceholder.typicode.com/posts/1';

  // ignore: omit_local_variable_types
  Map<String, dynamic> requestUpdatePost = {
    'id': 1,
    'title': 'xxx',
    'body': 'bar',
    'userId': 1
  };

  var responseUpdatePost = await http.put(
    url1,
    body: convert.jsonEncode(requestUpdatePost),
  );
  print('Update');
  print(responseUpdatePost.statusCode);
  print(responseUpdatePost.body);

  // deletando o post 1
  var url2 = 'https://jsonplaceholder.typicode.com/posts/1';
  var responseDeletePost = await http.delete(url2);
  print('Delete');
  print(responseDeletePost.statusCode);
  print(responseDeletePost.body);

  // PATCH o post 1
  var responsePatchPost = await http.patch(
    'https://jsonplaceholder.typicode.com/posts/1',
    body: convert.jsonEncode({'title': 'Marcio Winter'}),
  );
  print('Patch');
  print(responsePatchPost.statusCode);
  print(responsePatchPost.body);
}
