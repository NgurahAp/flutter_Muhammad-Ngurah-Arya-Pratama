String gabung(String a, String b, String c) {
  return a + b + c;
}

void main(List<String> args) {
  String kata1 = 'Hi! ';
  String kata2 = 'Nama saya ';
  String kata3 = 'Ngurah.';

  var hasil = gabung(kata1, kata2, kata3);
  print(hasil);
}
