import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<void> run() async {
  var url = 'https://viacep.com.br/ws/01001000/json/';

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var data = convert.jsonDecode(response.body);

    print(data);
    print('CEP = ${data['cep']}');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
