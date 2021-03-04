/*
Dado a lista pacientes faça:
Imprima a lista acima na tela com o nome e a idade de cada paciente ex:
Rodrigo Rahman tem 35 anos
*/

void main() {
  List paciente = [
    'Rodrigo Rahman|35',
    'Guilheme Rahman|10',
    'João Rahman|20',
    'Joaquin Rahman|25',
    'Luan Rahman|23'
  ];

  String nome = '';
  String idade = '';

  for (var i = 0; i < paciente.length; i++) {
    nome = paciente[i].split('|')[0];
    idade = paciente[i].split('|')[1];
    print('$nome tem $idade anos');
  }
  ;
}
