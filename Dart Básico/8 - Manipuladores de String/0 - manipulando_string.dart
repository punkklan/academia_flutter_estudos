void main() {
  var strl = 'rodrigo rahman|30|desenvolvedor|SP';
  print(strl);
  var arrayStrl = strl.split('|');
  print(arrayStrl);
  for (var i = 0; i < arrayStrl.length; i++) {
    print(arrayStrl[i]);
  }
}
