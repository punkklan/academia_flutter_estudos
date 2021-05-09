import 'package:flutter/material.dart';
import 'package:gerencia_estado/stream/atualizar_nome_controller.dart';
import 'package:gerencia_estado/stream/atualizar_nome_state.dart';

class AtualizarNomePage extends StatefulWidget {
  @override
  _AtualizarNomePageState createState() => _AtualizarNomePageState();
}

class _AtualizarNomePageState extends State<AtualizarNomePage> {
  final AtualizarNomeController _controller = AtualizarNomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streams'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Atualizar Nome por Stream'),
            SizedBox(height: 8),
            StreamBuilder<AtualizarNomeState>(
                stream: _controller.outAtualizarNome,
                builder: (_, snapshot) {
                  print('build StreamBuilder');
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    if (data.loading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Text(data.nome);
                  }

                  return Container();
                }),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _controller.alterarNome(),
              child: Text('Atualizar Nome'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
