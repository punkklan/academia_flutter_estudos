import 'package:flutter/widgets.dart';

class ChangeNotifierState extends ChangeNotifier {
  String nome = 'Marcio';

  void alterarNome() {
    nome += ' Winter';
    notifyListeners();
  }
}
