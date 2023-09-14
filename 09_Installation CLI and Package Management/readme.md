# Flutter Command Line Interface & Flutter Package Management

## Flutter CLI

> Alat yang digunakan untuk berinteraksi dengan Flutter SDK
> Perintah dijalankan dalam terminal

### Flutter Doctor

- Perintah untuk menampilkan informasi software yang dibutuhkan flutter

```
flutter doctor
```

### Flutter Create

- Perintah untuk membuat project aplikasi flutter baru di directory tertentu.

```
flutter create <APP_NAME>
```
### Flutter Run
- Perintah untuk menjalankan project aplikasi di device yang tersedia
```
flutter run <DART_FILE>
```

### Flutter Emulator
- Perintah untuk menampilkan daftar emulator yang terinstall dan menampilkan option untuk membuka emulator atau membuat emulator baru
```
flutter emulators
flutter emulators --launch <EMULATOR_ID>
flutter emulators --create [--name xyz]
```

### Flutter Channel
- Perintah untuk menampilkan daftar flutter channel yang tersedia dan menunjukan channel yang digunakan saat ini
```
flutter channel
```
### Flutter Pub
- Flutter pub add digunakan untuk menambah packages ke dependencies yang ada di pubspec.yaml
- Flutter pub get digunakan untuk mendownload semua packages/dependencies yang ada di pubspec.yaml
```
flutter pub add <package_name>
flutter pub get
```

### Flutter Build
- Perintah untuk memproduksi sebuah file aplikasi untuk keperluan deploy atau publish ke AppStore, PlayStore, dll
```
flutter build <DIRECTORY>
```
### Flutter Clean
- Perintah untuk menghapus folder build serta file lainnya yang dihasilkan saat kita menjalankan aplikasi di emulator
```
flutter clean
```

## Packages Management
> Flutter mendukung sharing packages
> Packages dibuat developers lain
> Mempercepat pengembangan aplikasi karena tidak perlu membuat semuanya dari awal atau from scratch
> Mendapatkan packages di website pub.dev

### Cara Menambah dan Menggunakan Packages
1. Cari package di pub.dev
2. Copy baris dependencies yang ada di bagian installing
3. Buka pubspec.yaml
4. Paste barisnya dibawah dependencies pubspec.yaml
5. Run *flutter pub get* di terminal
6. Import package di file dart
7. Stop atau restart aplikasi jika dibutuhkan