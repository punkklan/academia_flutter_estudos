import 'fruta.dart';

abstract class Mamifero {
//   A palavra-chave covariant
// Alguns (raramente usados) padrões de codificação dependem de restringir um tipo, substituindo o tipo
// de um parâmetro por um subtipo, que é inválido. Nesse caso, você pode usar a covariantpalavra-chave
// para informar ao analisador que você está fazendo isso intencionalmente. Isso remove o erro estático e,
// em vez disso, verifica se há um tipo de argumento inválido no tempo de execução.
  void comer(covariant Fruta fruta);
}

class Humano extends Mamifero {
  void comer(Fruta fruta) {}
}

class Macaco extends Mamifero {
  void comer(Banana banana) {}
}
