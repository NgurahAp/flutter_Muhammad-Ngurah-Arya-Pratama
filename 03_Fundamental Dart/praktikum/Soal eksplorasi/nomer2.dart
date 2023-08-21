List<int> cariFaktor(int a) {
  List<int> faktor = [];

  for (var i = 1; i <= a; i++) {
    if (a % i == 0) {
      faktor.add(i);
    }
  }
  return faktor;
}

void main(List<String> args) {
  int input = 24;

  var hasil = cariFaktor(input);
  print(hasil);

  for (var list in hasil) {
    print(list);
  }
}
