# Introduction Flutter and Flutter Widget

## Flutter
> Alat pengembangan antarmuka pengguna yang digunakan untuk membuat aplikasi mobile, desktop, dan web.

### Keunggulan Flutter
1. Mudah digunakan dan dipelajari
2. Produktivitas tinggi
3. Dokumentasi lengkap
4. Komunitas yang berkembang

### Bagian dari Flutter
- Software Development Kit (Alat untuk membantu proses pengembangan aplikasi)
- Framework (Perlengkapan untuk membentuk aplikasi yang dapat dikostumisasi)

### Membuat project
- Dilakukan dengan menjalankan perintah : 
```
flutter create <nama_project>
```
### Menjalankan Project
- Dilakukan dengan menjalankan perintah :
```
flutter run
```
### Struktur direktori
- Direktori Platform :
```
android
ios
web
```
- Direktori project
```
lib - ruang kerja utama
test - aktifitas pengujian
```
### File Utama
- Pertama kali dibaca dan dijalankan
- Dalam direktori lib
## Widget
> Digunakan untuk membentuk UI
> Berupa class dan dapat terdiri dari beberapa widget lainnya
> Terdiri dari 3 jenis yaitu stateless widget dan statefull widget dan built in widget

### Stateless Widget
- Tidak bergantung pada perubahan data
- Hanya fokus pada tampilan
- Dibuat dengan extends pada class StatelessWidget
```
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
```
### Statefull Widget
- Mementingkan pada perubahan data
- Dibuat dengan extends pada class StatefulWidget
- 1 widget menggunakan 2 class (widget dan state)
```
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

### Build in Widget
- Widget yang dapat langsung digunakan
- Sudah ter-install bersama Flutter

#### MaterialApp
- Membangun aplikasi dengandesain Material
```
MaterialApp(
  theme: ThemeData.dark(),
  debugShowCheckedModeBanner: false,
  home: const AdvancePage(),
);
```
#### Scaffold 
- Membentuk sebuah halaman
#### AppBar
- Membentuk application bar yang terletak pada bagian atas halaman
#### Text
- Menampilkan teks
```
Scaffold(
  appBar: AppBar(...),
  drawer: Drawer(...),
  body: const Text('Halo),
  bottomNavigationBar: BottomNavigationBar(...),
);
```

