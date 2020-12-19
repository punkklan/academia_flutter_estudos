main(List<String> args) {
  // funcao anônima, sem um nome defido
  () {
    String msg = 'Executanto funcao anonima';
    print(msg);
  };

  // exemplo de utilização da função anônima para um callback
  consultar((String nomePaciente) {
    print(nomePaciente);
  });
  print('FINAL');
}

void consultar(Function callback) {
  print('Executando funcao consultar');
  String nomePaciente = 'Marcio Winter';
  callback(nomePaciente);
}
