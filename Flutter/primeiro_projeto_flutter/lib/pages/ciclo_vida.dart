import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:primeiro_projeto_flutter/pages/home_page_stateless.dart';

class CicloVida extends StatefulWidget {
  _CicloVidaState createState() {
    print('CicloVida createState');
    return _CicloVidaState();
  }
}

class _CicloVidaState extends State<CicloVida> {
  String nome = 'Marcio';

  _CicloVidaState() {
    print('_CicloVidaState contructor');
  }

  @override
  void initState() {
    print('CicloVida iniState');
    nome = 'Marcio Winter';
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('CicloVida didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(CicloVida oldWidget) {
    print('CicloVida didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('CicloVida dispose');
    super.dispose();
  }

  Widget build(BuildContext context) {
    print('CicloVida build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(
                  () {
                    nome = 'Marcio';
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomepageStateless(),
                      ),
                      (_) => false,
                    );
                  },
                );
              },
              child: Text(nome),
            ),
            Botao(),
          ],
        ),
      ),
    );
  }
}

class Botao extends StatefulWidget {
  _BotaoState createState() {
    print('Botao createState');
    return _BotaoState();
  }
}

int total;

class _BotaoState extends State<Botao> {
  @override
  void initState() {
    print('Botao iniState');
    total = 0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('Botao didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Botao oldWidget) {
    print('Botao didUpdateWidget');
    total = 0;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('Botao dispose');
    super.dispose();
  }

  Widget build(BuildContext context) {
    print('Botao build');
    return ElevatedButton(
      onPressed: () {
        setState(() {
          total++;
        });
      },
      child: Text('Botão $total'),
    );
  }
}
