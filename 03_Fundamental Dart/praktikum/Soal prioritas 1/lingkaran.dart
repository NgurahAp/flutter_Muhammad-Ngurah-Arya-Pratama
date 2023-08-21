double luasLingkaran(
  double r,
) {
  return 3.14 * r * r;
}

double kelilingLingkaran(double r) {
  return 2 * 3.14 * r;
}

void main(List<String> args) {
  double jariJari = 10;

  double luas = luasLingkaran(jariJari);
  double keliling = kelilingLingkaran(jariJari);

  print('Luas lingkaran dari jari-jari $jariJari adalah $luas');
  print('Keliling lingkaran dari jari-jari $jariJari adalah $keliling');
}
