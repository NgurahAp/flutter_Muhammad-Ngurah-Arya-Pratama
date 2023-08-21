

double jumlah(double b, double p, double t) {
  return b + p + t;
}

double diskon(double a) {
  return 0.1 * a;
}

void main(List<String> args) {
  double buku = 10000;
  double pensil = 5000;
  double tas = 100000;

  var totalPembelian = jumlah(buku, pensil, tas);
  print('Total harga dari barang yang dibeli adalah $totalPembelian');

  var potongan = diskon(totalPembelian);
  print('Total potongan $potongan');

  var totalBayar = totalPembelian - potongan;
  print('Total yang harus dibayar setelah potongan $totalBayar');
}
