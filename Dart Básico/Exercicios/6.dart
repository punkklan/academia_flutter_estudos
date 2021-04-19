/*
Dado a lista pacientes faça:
Remova da lista os pacientes que são menor de idade.
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

//  Outra forma de resolução do exercício

// void main() {
//     List paciente = [
//         'Rodrigo Rahman|35',
//         'Guilheme Rahman|10',
//         'João Rahman|17',
//         'Joaquin Rahman|28',
//         'Luan Rahman|23',
//     ];
  
//   paciente = only18(paciente);
//   paciente.forEach((item) => print(item));

// }

// List<dynamic> only18 (List<dynamic> paciente) {
//     List<String> maioresDeIdade = [];
//     paciente.forEach((pessoa) {
//       var pessoaSplit = pessoa.split('|');
//       var nome = pessoaSplit[0];
//       var idade = int.tryParse(pessoaSplit[1]) ?? 0;
//       (idade >= 18) ? maioresDeIdade.add('$nome tem $idade anos.') : (){};
//     }); 
//     paciente = maioresDeIdade;  
//   return paciente;  
// }
