// Static
// Metodos e Atributos de Classe

class Pessoa {
  // o static aloca na memória a variável e não perde ela até que o programa
  // seja finalizado, por boa prática um statico deve se final.  NÃO permitindo
  // que seja alterado
  static final String nome = 'Marcio';

  String nomeCompleto() {
    return 'Marcio Winter';
  }
}

void main() {
  print(Pessoa.nome);
  funcao1();
  print(Pessoa.nome);
}

funcao1() {
  var pessoa = Pessoa();
  var pessoa2 = Pessoa();

//  print(pessoa.nome);
  print(pessoa.nomeCompleto());

  // print(pessoa2.nome);
  print(pessoa2.nomeCompleto());

  // Essas váriaveis vão 'morrer' após a fução ser executada
}
