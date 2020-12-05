// Baseado no array acima monte um relatório onde mostre
// Apresente a quantidade de pacientes com mais de 20 anos
// Agrupar os pacientes por familia(considerar o sobrenome) apresentar por familia.

void main(List<String> args) {
  var pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|estudante|MG',
    'Sandra Silva|40|estudante|MG',
    'Regina Verne|35|estudante|MG',
    'João Rahman|55|Jornalista|SP',
  ];

  int idade = 0;
  int quantidadePaciente20 = 0;
  List<String> familia = [];
  List<String> pacienteDados = [];

  for (int i = 0; i < pacientes.length; i++) {
    pacienteDados = pacientes[i].split('|');
    idade = int.tryParse(pacienteDados[1]) == null
        ? idade = 0
        : int.parse(pacienteDados[1]);
    if (idade <= 20) {
      continue;
    }
    quantidadePaciente20++;
  }
  print(
      'O cadastro contêm $quantidadePaciente20 pacientes com mais de 20 anos.');

  for (int i = 0; i < pacientes.length; i++) {
    pacienteDados = pacientes[i].split('|');
    pacienteDados = pacienteDados[0].split(' ');
    String sobrenome = pacienteDados[1];
    if (!familia.contains(sobrenome)) {
      familia.add(sobrenome);
    }
  }
  print('');

  for (int f = 0; f < familia.length; f++) {
    print('Família ${familia[f]}:');
    for (int i = 0; i < pacientes.length; i++) {
      pacienteDados = pacientes[i].split('|');
      pacienteDados = pacienteDados[0].split(' ');
      String nome = pacienteDados[0];
      String sobrenome = pacienteDados[1];
      if (familia[f] == sobrenome) {
        print(nome);
      }
    }
    print('');
  }
}
