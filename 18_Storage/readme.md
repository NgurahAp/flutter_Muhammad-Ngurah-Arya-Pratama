# Storage

## Penyimpanan Lokal
> Diperlukan untuk efisiensi penggunaan data internet
> Ada beberapa cara implementasi penyimpanan lokal seperti Shared Preferences dan Local Database

### Shared Preference
- Digunakan untuk menyimpan data yang sederhana
- Penyimpanan dengan format key-value
- Menyimpan tipe data dasar seperti teks, angka dan boolean.
- Contoh penggunaan shared preference seperti penyimpanan data login dan menyimpan riwayat pencarian

### SQLite
- Analogikan sebagai lemari arsip
- memiliki tabel (file folders)
- data yang tersimpan (Lembaran kertas)
- Tabel memiliki column untuk mendefinisikan data yang tersimpan pada row
- Database digunakan untuk menyimpan dan mempertahankan data dalam jumlah besar pada local device
- Bersifat privat
- Menggunakan SQLite database melalui plugin sqflite
SqLite adalah database open source yang mendukung insert, read, update dan remove data.