abstract class Cantar {
  String cantar() {
    return 'Canta Rock';
  }

  // o metodo 'habilidade' existe na classe artista,
  // a classe joao  vai sobrescrever a habilidade, pegando a última.
  String habilidade() {
    return 'Artista Cantor';
  }
}
