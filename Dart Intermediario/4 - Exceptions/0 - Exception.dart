void main() {
  try {
    int.parse('Marcio');
  } on FormatException catch (e, s) {
    print('Exception FormatException:\n $e');
    print('Stack FormatException:\n $s');
  } on Exception catch (e, s) {
    print('Exception :\n $e');
    print('Stack :\n $s');
  } catch (e, s) {
    print('Exception Generica:\n $e');
    print('Stack Generica:\n $s');
  } finally {
    print('O finally sempre executa tendo ou não erros');
  }
}
