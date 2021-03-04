main(List<String> args) {
  List<int> numeros = [50, 60, 70, 80];

  //  LOOP
  //  Exemplo 1
  // for (var num1 in numeros) {
  //   print(num1);
  // }

  // ForEach
  // EXEMPLO 2 , executa igual ao exemplo 1, mas utilizando uma função da propria lista
  numeros.forEach((numero) => print(numero));

  var lista = [
    [1, 2],
    [3, 4]
  ];
  print(lista);

  // Expand
  // concatena as 2 listas da variável lista
  var listaConcatenada = lista.expand((numero) => numero);
  print(listaConcatenada);

  // ForEach
  // Loop para imprimir item a item da lista
  listaConcatenada.forEach((element) => print(element));

  // Map
  List<int> lista2 = [1, 2, 3];
  List<String> novaListaString = lista2.map((e) => '$e = Números').toList();
  print(lista2);
  print(novaListaString);

  List<String> listaBusca = ['Marcio', 'Rafael', 'Gabriela'];

  // Any
  //  busca na lista até encontrar o item e retorna booleano
  if (listaBusca.any((nome) => nome == 'Marcio')) {
    print('Tem o nome Marcio');
  } else
    print('Não tem Marcio');

  // Every
  //  busca em TODA a lista até encontrar o item e retorna booleano
  if (listaBusca.every((nome) => nome.contains('a'))) {
    print('Todos os nomes da lista contêm a letra a');
  } else
    print('Nem todos tem a letra a');

  // Where
  // busca pela lista e retorna o dado que foi solicitado
  var nome = listaBusca.where((p) => p == 'Marcio');
  print(nome);

  //  Fold
  var numerosParaSomar = [2, 2, 2];
  var somaDosValores =
      numerosParaSomar.fold(0, (int atual, element) => atual += element);
  print(somaDosValores);

  // Sort
  var listaParaOrdenacao = [93, 22, 33, 765, 1200, 1, 10, 3, 4, 5, 7, 6, 9, 21];
  print(listaParaOrdenacao);

  // passando parametros para fazzer ordenação reversa
  listaParaOrdenacao.sort((n1, n2) {
    if (n1 > n2) {
      return -1;
    } else if (n1 == n2) {
      return 0;
    } else {
      return 1;
    }
  });
  print(listaParaOrdenacao);

  // sem parametros retorna numeros do menor para maior
  listaParaOrdenacao = [93, 22, 33, 765, 1200, 1, 10, 3, 4, 5, 7, 6, 9, 21];
  listaParaOrdenacao.sort();
  print('sort sem parametros');
  print(listaParaOrdenacao);

  // Usando o compareTo - para inverter a ordem basta inverter o n1 com n2 no compareTo
  listaParaOrdenacao = [93, 22, 33, 765, 1200, 1, 10, 3, 4, 5, 7, 6, 9, 21];
  listaParaOrdenacao.sort((n1, n2) => n2.compareTo(n1));
  print('Usando o compareTo');
  print(listaParaOrdenacao);
}
