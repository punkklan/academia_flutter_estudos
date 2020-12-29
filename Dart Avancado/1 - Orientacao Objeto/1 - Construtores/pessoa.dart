class Pessoa {
  String nome = '';
  int idade = 0;

  // Contrutor obrigando que seja passado os parametros

  // Pessoa(String nome, int idade) {
  //   this.nome = nome;
  //   this.idade = idade;
  // }

  // Modo simplificado de construtor
  // Pessoa(this.nome, this.idade);

  // Entre {} torna os parametros nomeados e opcionais
  Pessoa({this.nome = '', this.idade = 0});

  // Contrutor Nomeado
  Pessoa.soComNome(this.nome);

  // Contrutor Nomeado e parametros: nome obrigatório e idade opcional
  Pessoa.comIdadeOpcional(this.nome, [this.idade = 30]);
}
