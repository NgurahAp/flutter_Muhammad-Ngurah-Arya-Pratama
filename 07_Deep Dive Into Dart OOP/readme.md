# Deep Dive Into Dart OOP

## Constructor
> Method yang dijalankan saat pembuatan object
> Dapat menerima parameter
> Tidak memiliki return
> Memberi constructor dengan menambahkan nama sama dengan nama class
```
class Hewan {
  var mata;
  var kaki;

  Hewan() {   /// Memberi constructor
    mata = 0;
    kaki = 0;
  }
}
```

## Inheritance
> Membuat class baru dengan memanfaatkan class yang sudah ada
> Betujuan agar kemampuan class yang sudah ada dapat dimiliki oleh class bar
> Melakukan Inheritance dengan menambah extends saat pembuatan class baru

```
Class Kambing extends Hewan {
  Kambing() {
    mata = 2;
    kaki = 4;
  }
}
```

## Method Overriding
> Menulis ulang mthod yang ada pada super-class
> Bertujuan agar class memiliki method yang sama dengan proses yang berbeda
> Overriding dilakukan pada class yang melakukan inheritance 
> Method sudah ada pada class induk dan ditulis ulang seperti membuat method baru pada class anak
> Ditambah tanda @override di baris sebelum Method dibuat
```
clss Kambing extend Hewan {
  @override
  reproduksi() {
    print('Melahirkan')
  }
}
```

## Abstract Class
> Berupa class abstrak
> Menunjukan method apa saja yang ada pada suatu class
> Digunakan dengan menggunakan extends
> Tidak dapat dibuat object
? DTidak semua method harus di overrode
```
abstract class Hewan {
  reproduksi() {
    print('tidak diketahui')
  }
}
```

## Polymorphism
> Kemampuan data berubah menjadi bentuk lain
> Tipe data yang dapat digunakan adalah super class
> Dapat dilakukan pada class dengan extends atau implements
```
void main() {
  Hewan k1 = Kambing();
  k1.reproduksi();
}
```
## Generics
> Dapat digunakan pada class atau fungsi
> Memberi kemampuan agar dapat menerima data dengan tipe yang berbeda
> Tipe data yang diinginkan, ditentukan saat membuat class atau menjalankan fungsi
> Class hadiah dibawah dapat dimasukan data dengan tipe T, dna tipe T dapat digunakan di seluruh class Hadiah
```

class Hadiah<T> {
  var isi;

  Hadiah(T i) {
    isi = o
  }
}
```
> Setelah nama class, menjadi tipe data yang diinginkan
```
void main() {
  var h1 = Hadiah<String>('mobil);
  print(h1.isi);

  var h2 = Hadiah<int>(19);
  print(h2.isi);
}
```

## Enkapsulasi
> Mempromosikan penyembunyian data
> Peningkatan integritas data
> Memungkinkan perubahan pada satu bagian kode tanpa memengaruhi bagian lain
> Mengurangi kompleksitas dan potensi bug dalam kode
> Modifikasi akases dalam Dart :
- Anggota Publik: Kata kunci public memungkinkan akses dari mana saja
- Anggota Privat: awalan _private membatasi akses hanya dalam perpustakaan atau kelas
- Abggota dilindungi: Dart tidak memiliki kata kunci protected secar alami, tetapi secara konvensional, awalan _protected menunjukan akses terbatass dalam perpustakaan
```
class KelasSaya {
  int variabelPublik;
  String _variabelPrivate;
  double _variabelDilindungi
}
```