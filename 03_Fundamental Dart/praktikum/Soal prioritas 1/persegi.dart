int luasPersegi(int s) {
  return s * s;
}

int kelilingPersegi(int s) {
  return s * 4;
}

void main(List<String> args) {
  int sisi = 5;

  int luas = luasPersegi(sisi);
  int keliling = kelilingPersegi(sisi);

  print('KELILING DAN LUAS PERSEGI');
  print('Luas persegi dari panjang  $sisi adalah $luas');
  print('Keliling persegi dari panjang  $sisi adalah $keliling');
}
