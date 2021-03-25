class Produto {
  // com o final, após inicializado a classe, os atributos serão imutáveis
  final int id;
  final String nome;
  final double preco;

  // desta forma, esta atribuindo os parametros antes de inicializar a classe
  Produto(this.id, this.nome, this.preco);

  // desta forma, esta atribuindo os parametros antes de inicializar a classe
  Produto.a(int idProduto, String nomeProduto, double precoProduto)
      : this.id = idProduto,
        this.nome = nomeProduto,
        this.preco = precoProduto;
}
