void main() {
  // variáveis finais nao são alteradas
  // variável finais são imutável e deve ser declarada na criação
  // Boa prática, não precisa declarar o tipo
  final String outroNome = 'Jose';
  print(outroNome);
  final outroNome2 = 'Jose';
  print(outroNome2);

  const nomeDefault = 'Marcio';
  print(nomeDefault);
}
