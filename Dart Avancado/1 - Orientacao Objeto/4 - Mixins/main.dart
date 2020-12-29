import 'joao.dart';

void main() {
  Joao j = Joao();
  j.cantar();
  j.dancar();

  // o metodo 'habilidade' existe na classe artista,
  // a classe joao  vai sobrescrever a habilidade, pegando a última.
  print(j.habilidade());

  // O atributo   ..    encadeia as chamadas de classe
  Joao()
    ..cantar()
    ..dancar()
    ..habilidade();
}
