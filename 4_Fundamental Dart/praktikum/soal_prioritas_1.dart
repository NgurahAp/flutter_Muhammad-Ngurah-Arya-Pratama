void main() {

  // PERSEGI

  int panjangP = 5;

  int luasP = panjangP * panjangP;
  int kelilingP = panjangP * 4;

  print('KELILING DAN LUAS PERSEGI');
  print('Luas persegi dari panjang  $panjangP adalah $luasP');
  print('Keliling persegi dari panjang  $panjangP adalah $kelilingP\n');

  // PERSEGI PANJANG

  int panjangPP = 8;
  int lebarPP = 6;

  int luasPP = panjangPP * lebarPP;
  int kelilingPP = panjangPP * 2 + lebarPP *2;

  print('KELILING DAN LUAS PERSEGI PANJANG');
  print('Luas persegi panjang dari panjang sisi $panjangPP dan lebar sisi $lebarPP adalah $luasPP');
  print('Keliling persegi dari panjang  $panjangPP dan lebar sisi $lebarPP adalah $kelilingPP\n');  

  // LINGKARAN

  double phi = 3.14;
  double r = 10;

  double luasL = phi * r * r;
  double kelilingL = 2 * phi * r;

  print('KELILING DAN LUAS LINGKARAN');
  print('Luas lingkaran dari jari-jari $r adalah $luasL');
  print('Keliling lingkaran dari jari-jari $r adalah $kelilingL');
}

