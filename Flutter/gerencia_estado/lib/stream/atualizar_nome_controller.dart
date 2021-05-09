import 'dart:async';

import 'package:gerencia_estado/stream/atualizar_nome_state.dart';

class AtualizarNomeController {
  final _controller = StreamController<AtualizarNomeState>();

  Stream<AtualizarNomeState> get outAtualizarNome => _controller.stream;

  AtualizarNomeController() {
    _controller.add(AtualizarNomeState(loading: false, nome: 'Marcio'));
  }

  Future<void> alterarNome() async {
    _controller.add(AtualizarNomeState(loading: true, nome: 'Marcio'));
    await Future.delayed(Duration(seconds: 2));
    _controller.add(AtualizarNomeState(loading: false, nome: 'Marcio Winter'));
  }

  void dispose() {
    _controller.close();
  }
}
