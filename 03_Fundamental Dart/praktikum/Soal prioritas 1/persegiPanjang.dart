int luasPersegi(int p, int l) {
  return p * l;
}

int kelilingPersegi(int p, int l) {
  return 2 * p + 2 * l;
}

void main(List<String> args) {
  int panjang = 8;
  int lebar = 6;

  int luas = luasPersegi(panjang, lebar);
  int keliling = kelilingPersegi(panjang, lebar);

  print('KELILING DAN LUAS PERSEGI');
  print('Luas persegi dari panjang  $panjang dan lebar $lebar adalah $luas');
  print('Keliling persegi dari panjang  $panjang dan lebar $lebar adalah $keliling');
}
