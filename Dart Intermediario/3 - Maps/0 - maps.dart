void main() {
  Map<String, String> paciente = Map();
  // O putIfAbsent adiciona um valor caso não exista
  paciente.putIfAbsent('nome', () => 'Marcio');
  paciente.putIfAbsent('idade', () => '40 anos');
  print(paciente);

  // update atualiza um dado, passamos a chave e o novo valor
  paciente.update('idade', (idade) => '25 anos');
  print(paciente);

  // o update não cria uma chave caso caso não enconte.
  // adicionamos o ifAbsent para adicionar se não encontrado
  paciente.update('sexo', (sexo) => 'Masculino',
      ifAbsent: () => 'Masculino Adicionado');
  print(paciente);

  print('O nome é ${paciente['nome']}\n');

  paciente.forEach((key, value) =>
      print('Chave: ${paciente['nome']} - Valor: ${paciente['idade']}'));

  // Exemplo de outras formas de declarar e inserir valor
  var mapExemplo = {'name': 'João'};
  print(mapExemplo);

  var map2 = Map<dynamic, dynamic>.from({'nome': 'Rafael'});
  print(map2);

  var map3 = Map<dynamic, dynamic>.from({'name': 'João'});
  print(map3);

  // Para mesclar um map inteiro dentro outro map
  map3.addAll(map2);
  print('\nmap2 e map3 foram mesclados para o map3');
  print(map3);

  // É possível ter map dentro de outro map (os famosos jsons)
  var map4 = {
    'pessoa': 'Pedro',
    'dados': {'idade': '39'}
  };
  print('\nMaps dentro de Maps ');
  print(map4);

  var dados = map4['dados'] as Map;
  print(dados['idade']);
}
