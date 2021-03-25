// a extension pode ser criada para qualquer classe existente
// nativa no dart/flutter e classe que você criou

extension SaudacaoString on String {
  String saudacao() {
    return 'Olá $this bem vindo';
  }
}
