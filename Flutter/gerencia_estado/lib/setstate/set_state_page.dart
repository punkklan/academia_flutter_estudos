import 'package:flutter/material.dart';

class SetStatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Criando Tela SetStatePage');
    return Scaffold(
      appBar: AppBar(title: Text('SetState')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Atualizando com setState:'),
            ComponenteComEstado(),
          ],
        ),
      ),
    );
  }
}

class ComponenteComEstado extends StatefulWidget {
  @override
  _ComponenteComEstadoState createState() => _ComponenteComEstadoState();
}

class _ComponenteComEstadoState extends State<ComponenteComEstado> {
  String nome = 'Marcio';
  @override
  Widget build(BuildContext context) {
    print('Criando ComponenteComEstado');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text(nome.toUpperCase()),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            setState(() {
              nome = 'José';
            });
          },
          child: Text('Atualizar Nome'),
        ),
      ]),
    );
  }
}
