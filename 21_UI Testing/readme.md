# UI Testing

> Testing merupakan tahapan yang penting dalam pengembangan aplikasi. Testing dapat menemukan bug/masalah pada aplikasi kita. UI Testing adalah pengujian yang dilakukan pada tampilan suatu aplikasi uuntuk memastikan aplikasi dapat menerima interaksi dan memberi respon pada pengguna. UI Testing di flutter disebut juga sebagai widget testing sehingga pengujian dilakukan pada widgets dengan menulis script yang dapat dijalankan secara otomatis.

## Kruntungan UI Testing
- Memastikan seluruh widget memberi tampilan yang sesuai
- Memastikan seluruh interaksi dapat diterima dengan baik
- menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget

## Melakukan UI Testing
1. Instalasi package testing. Umumnya package flutter_test sudah terinstal sejak project pertama kali dibuat. Tapi cara ini dapat dilakukan jika ingin menginstall secara manual
```
flutter pub get
```
2. Penulisan Script Testing
- Dilakukan pada folder *test*
- Nama file harus diikuti *_test.dart*, contoh contact_test.dart
- Tiap file berisi fungsi main() yang didalamnya dapat dituliskan script testing
- Tiap skenario pengujian disebut *test case*
- Test Case duawali dengan *testIwdgets* dan diberi judul

3. menjalankan perintah *flutter test* dan hasil dari perintah ini adalah lamanya waktu pengujian, total pengujian yang dilakukan dan pesan bahwa pengujian berhasil.