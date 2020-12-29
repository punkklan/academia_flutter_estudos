class Numero {
  int i;

  Numero(this.i);

  Numero operator +(Numero numero2) {
    return Numero(numero2.i + i);
  }

  Numero operator -(int numero2) {
    return Numero(i - numero2);
  }

  @override
  String toString() {
    return 'resultado = $i';
  }
}
