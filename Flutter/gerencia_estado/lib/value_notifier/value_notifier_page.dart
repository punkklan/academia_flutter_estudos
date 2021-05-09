import 'package:flutter/material.dart';

class ValueNotifierpage extends StatelessWidget {
  final ValueNotifier<String> nome = ValueNotifier('marcio');

  @override
  Widget build(BuildContext context) {
    print('Criando a Tela');
    return Scaffold(
      appBar: AppBar(
        title: Text('Valuer Notifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Atualizando com Value Notifier'),
            SizedBox(height: 8),
            Text('Nome Inicial = ${nome.value.toUpperCase()}'),
            SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: nome,
              builder: (_, nomeValue, __) {
                print('Alterando o nome..');
                return Text(nomeValue);
              },
            ),
            ElevatedButton(
              onPressed: () {
                nome.value = 'José';
              },
              child: Text('Atualizar Nome'),
            ),
          ],
        ),
      ),
    );
  }
}
