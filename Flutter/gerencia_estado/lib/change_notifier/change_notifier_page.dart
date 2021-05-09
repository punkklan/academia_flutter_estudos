import 'package:flutter/material.dart';
import 'package:gerencia_estado/change_notifier/change_notifier_state.dart';
import 'package:provider/provider.dart';

class ChangeNotifierPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Notifier'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => ChangeNotifierState(),
        child: ChangeNotifierContent(),
      ),
    );
  }
}

class ChangeNotifierContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<ChangeNotifierState>(context, listen: false);

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ChangeNotifierState>(
            builder: (_, value, __) {
              return Text('Nome: ${value.nome}');
            },
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              state.alterarNome();
            },
            child: Text('Atualizar Nome'),
          ),
        ],
      ),
    );
  }
}
