import 'package:assincrono/models/cidade_model.dart';
import 'package:dio/dio.dart';

class ViaCepRepository {
  Future<CidadeModel> buscarEndereco() async {
    var dio = Dio();

    // ignore: omit_local_variable_types
    Response response =
        await dio.get('https://viacep.com.br/ws/01001000/json/');

    if (response.statusCode == 200) {
      var respData = response.data;
      if (respData['error'] != null) {
        print('Erro ao buscar endereço');
        return null;
      } else {
        return CidadeModel.fromMap(respData);
      }
    }
  }
}
