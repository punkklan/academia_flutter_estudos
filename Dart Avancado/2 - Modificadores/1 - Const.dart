void main() {
  //
  // utilizando final e const na classe conseguimos performance e economia
  // de memória.  Note que a p2 e p4 são apenas apontamentos para a p1 e p3.

  var p1 = const Pessoa('marcio', 40);
  var p2 = const Pessoa('marcio', 40);
  var p3 = const Pessoa('marcio', 50);
  var p4 = const Pessoa('marcio', 50);

  print('p1 == p2 ? = ${p1 == p2}');
  print('p2 == p3 ? = ${p2 == p3}');
  print('p3 == p4 ? = ${p3 == p4}');
  print('p1 == p2 ? = ${p1 == p2}');
}

class Pessoa {
  final String nome;
  final int idade;

  const Pessoa(this.nome, this.idade);
}
