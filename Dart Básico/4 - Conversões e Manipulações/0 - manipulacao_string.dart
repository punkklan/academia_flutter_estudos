void main() {
  String nome = 'Marcio Winter';
  var subStringNome = nome.substring(7);
  print(subStringNome);

  String sexo = 'Feminino e Masculino';
  String sexoM = sexo.substring(11, 12);
  print(sexoM);
  String sexoF = sexo.substring(0, 1);
  print(sexoF);

  //  .startWith verifica a primeira letra
  if (sexo.startsWith('F')) {
    print('é Feminino');
  }

  if (nome.contains('Winter')) {
    print('no nome contem a palavra Winter');
  }

  if (nome.toLowerCase().contains('marcio')) {
    print('Nome contem a palavra marcio independete de maiusculo ou minisculo');
  }

  print('Nome: ' + nome + ' Sexo: ' + sexoM); // concatenado
  print('Nome: ${nome.toUpperCase()} Sexo: $sexoM'); // interpolado
}
