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

