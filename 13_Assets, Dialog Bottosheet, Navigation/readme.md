# Assets

> File yang dibundled dan di deployed bersamaan dengan aplikasi
> Tipe-tipe assets seperti : Static data (JSON files), icons, images, dan font file (ttf)

## Menentukan Assets

- Flutter menggunakan pubspec.yaml
- Pubspec.yaml terletak pada root project, untuk mengidentifikasi assets yang dibutuhkan aplikasi
- Gunakan karakter '/' untuk memasukan semua assets dibawah satu directory name

```
assets :
  - assets/
```

### Image

- flutter mendukung format gambar seperti JPEG, WebP, GIF, Animated Web/GIF, PNG,BMP, dan WBMP.
- Menggunakan widget method image.asset, mendapatkan image yang sudah ditambahkan dalam project
- Menggunakan Image.network, mendapatkan data image melalui internet dengan menggunakan String url nya

```
Image.asset('assets/background.jpg'),
image.network('https://picsum.photos/id/1/200/300'),
```

### Font

- Penentuan font yang mau dipakai biasanya oleh UI designer
- Penerapan font menggunakan custom font atau dari package
- Masukan font ke dalam folder, dan didaftarkan font di pubspec.yaml.

```
 fonts:
    - family: roboto
      fonts:
        - asset: assets/fonts/RobotoSlab-Regular.ttf
```

- Mengatur font sebagai default

```
Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Management',
        theme: ThemeData(fontFamily: 'poppins'),
        home: const TaskScreen(),
      );
  }
```

- Menggunakan font dari package dengan cara menambah package google_fonts di dependencies
- Melakukan pengimportan di pakcage file.dart

```
import 'package:google_fonts/google_fonts.dart';
```

- Gunakan font dengan memanggil GoogleFonts.namaFont()

```
Tetx(
  'Star Hill',
  style: GoogleFonts.rowdies(fontsize: 30),
)
```

# Dialog & Bottom Sheet

## Alert Dialog

> Untuk tampilan android, dari material design
> Menginformasikan pengguna tentang situasi tertentu
> Bisa digunakan untuk mendapatkan input dari user
> Membutuhkan helper method showDialog

### Cara Membuat

- Memanggil fungsi showDialog di dalam fungsi onPressed, showDialog membutuhkan context dan builder
- Di buildernya akan me return AlertDialog
- Content bisa dimasukan widget text, gambar dan animasi gambar
- Action bisa ditambahkan button untuk menerima respon dari user.

```
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: const Text('Are you sure?'),
                  actions: [
                    TextButton(
                      onPressed: onPressed,
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No'),
                    ),
                  ],
                ),
              );
            },

```

## Bottom Sheet

> Seperti dialog tetapi muncul dibawah layar
> Menggunakan fungsi bawaan flutter showModalBottomSheet
> Membutuhkan dua properi yaitu context dan builder

```
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (context) => const ProfileSheet(),
              );
            },
            icon: const Icon(Icons.account_circle),
          )

```

# Flutter Navigation

> Berpindah halaman dari halaman 1 ke halaman lain
> Perpindahan halaman menggunakan 'Navigator.push()'
> Kembali ke halaman sebelumnya menggunakan 'Navigator.pop()'

```
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AboutScreen()
              )
            );
          },
          child: const Text('About Page'),
        ),
      ),
```

> Kita juga dapat mengirim data ke halaman baru menggunakan parameter pada constructor halaman

```
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AboutScreen(parameter: 'Hore')
              )
            );
          },
          child: const Text('About Page'),
        ),
      ),
```

> dan dihalaman baru tersebut kita bisa panggil dengan cara membuat variabel seperti berikut

```
class AboutPage extends StatelessWidget {

  final String parameter;
  const AboutPage({
    super.key,
    required this.parameter
  });
```

## Nvigation dengan Named Routes

> Tiap halaman memiliki alamat yang disebut route
> Perpindahan halaman menggunakan Navigator.pushNamed()

### Mendaftarkan Route

- Tambahkan initialRoute dan Routes pada MaterialApp
- Tiap route adalah fungsi yang membentuk halaman

```
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        '/about': (_) => const AboutPage(),
      },
    );
  }
```

- Perpindahan halaman dilakukan sebagai berikut

```
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/about');
          },
          child: const Text('About Page'),
        ),
      ),
```

### Mengirim data ke halaman baru

- Menggunakan arguments saat melakukan pushNamed

```
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/about', arguments: 'Data dari home');
          },
          child: const Text('About Page'),
        ),
      ),
```

- Dihalaman yang dituju, mengambil parameter yang dikirim melalui arguments

```
  Widget build(BuildContext context) {
    final parameter = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: Column(
        children: [
          Text(parameter),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Back'),
          )
        ],
      ),
    );
  }
```
