double volume(double p, double r, double t) {
  return p * r * r * t;
}

void main(List<String> args) {
  double phi = 3.14;
  double jariJari = 10;
  double tinggi = 5;

  double hasil = volume(phi, jariJari, tinggi);
  print('Diketahui :');
  print('Jari-jari tabung = $jariJari');
  print('Tinggi tabung = $tinggi');
  print('Maka volume dari tabung tersebut adalah $hasil');
}
