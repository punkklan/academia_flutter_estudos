import 'fruta.dart';
import 'mamifero.dart';

void main() {
  var h = Humano();
  h.comer(Banana());
  h.comer(Maca());

  var m = Macaco();
  m.comer(Banana());
  m.comer(Banana());
}
