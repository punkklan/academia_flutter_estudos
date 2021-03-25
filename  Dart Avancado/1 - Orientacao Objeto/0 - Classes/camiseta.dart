class Camiseta {
  String tamanho = 'p';
  String _cor = 'preta';
  String marca = 'nike';

//---------------------------------
  String recuperaCor() {
    return _cor;
  }

  String get getCor => _cor;
//---------------------------------

  String alterarCor(String cor) {
    _cor = cor;
    return _cor;
  }

  void set cor(String novaCor) {
    if (novaCor.toLowerCase() == 'verde') {
      throw Exception('Cor $novaCor inválida');
    }
    _cor = novaCor;
  }
  //---------------------------------
}
