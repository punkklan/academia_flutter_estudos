/*
Dado a lista pacientes faça:
Remova os 2 ultimo paciente da lista
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
  int idadeInt = 0;

  for (var i = 0; i < paciente.length; i++) {
    nome = paciente[i].split('|')[0];
    idade = paciente[i].split('|')[1];
    idadeInt = int.tryParse(idade) == null
        ? idadeInt = 0
        : idadeInt = int.parse(idade);
    if (idadeInt >= 18) {
      print('$nome tem $idade anos');
    }
  }
  ;
}
