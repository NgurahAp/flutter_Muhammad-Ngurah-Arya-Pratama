class Hewan {
  int kambing = 300;
  int sapi = 800;
  int domba = 150;
  int unta = 400;
}

class Mobil {
  int kapasitas = 1500;
  List<int> muatanList = [];
  int total = 0;

  void muatan(Hewan hewan) {
    var list = [
      hewan.kambing,
      hewan.sapi,
      hewan.domba,
      hewan.unta,
    ];
    muatanList.addAll(list);
  }

  void tambahMuatan() {
    for (var tambah in muatanList) {
      if (kapasitas >= tambah) {
        kapasitas -= tambah;
        print("Muatan sebesar $tambah berhasil ditambahkan.");
      } else {
        print("Kapasitas tidak mencukupi untuk menambahkan muatan sebesar $tambah.");
      }
    }
  }

  void sum() {
    for (int muatan in muatanList) {
      total += muatan;
    }
    print('Total muatan $total');
  }
}

void main() {
  var mobil = Mobil();
  var hewan = Hewan();

  mobil.muatan(hewan);
  mobil.tambahMuatan();
  mobil.sum();
}
