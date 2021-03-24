// import 'package:script_ibge/models/estado_model.dart';

import 'package:dio/dio.dart';

class IbgeRepository {
  Future<List> getEstado() async {
    var dio = Dio();
    var respData;

    try {
      // ignore: omit_local_variable_types
      Response response = await dio
          .get('https://servicodados.ibge.gov.br/api/v1/localidades/estados');

      if (response.statusCode == 200) {
        respData = response.data;

        print('Números de Estados : ${respData.length}');
      }
    } catch (e) {
      print(e);
    }

    return respData;
  }

  Future<List> getDistrito(int id) async {
    var dio = Dio();
    var respData;

    try {
      // ignore: omit_local_variable_types
      Response response = await dio.get(
          'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$id/distritos');

      if (response.statusCode == 200) {
        respData = response.data;
      }
    } catch (e) {
      print(e);
    }

    return respData;
  }
}
