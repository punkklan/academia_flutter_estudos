void main() {
  comprimentar('Marcio Winter', (mensagem) {
    print(mensagem);
  });

  despedir('Marcio Winter', (mensagem) {
    print(mensagem);
  });
}

// Aqui estamos definindo o tipo, a palavra CallbackMenssagem está recebendo
// uma função, assim estamos reutilizando a "void Function(String mensagem)"
// chamando apenas a palavra CallbackMenssagem
typedef CallbackMenssagem = void Function(String mensagem);

void comprimentar(String nome, CallbackMenssagem callback) {
  callback('Olá $nome seja bem vindo!');
}

void despedir(String nome, CallbackMenssagem callback) {
  callback('$nome obrigado pela visita.');
}
