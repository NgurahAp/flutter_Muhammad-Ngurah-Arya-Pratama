# Flutter Platform Widget

> Memanfaatkan widget dengan gaya berbeda pada Android dan Ios

## MaterialApp
- Widget dasar yang **mengemas seluruh widget** dalam aplikasi.
- Widget yang digunakan pada sistem **Android**.
- Di-import dari *package:flutter/material.dart*.
- **Struktur:**
```
MaterialApp(
  theme: ThemeData.dark(),
  home : const HomePage(),
);
```
### Scaffold
- Widget dasar untuk membangun sebuah halaman pada MaterialApp
- Membentuk tata letak sebuah halaman yang ditulis melalui properti-properti
```
Scaffold(
  appBar: AppBar(...),
  drawer: Drawer(...),
  body: ...,
  bottomNavigationBar: BottomNavigationBar(...),
);
```

## CupertinoApp
- Widget dasar yang **mengemas seluruh widget** dalam aplikasi.
- Widget yang digunakan pada sistem **IOS**
- Di-import dari *package:flutter/cupertino.dart*
- Jika ingin menggunakan tema gelap, diperlukan variabel seperti berikut
```
final _themeDark = const CupertinoThemeData.raw(
    Brightness.dark,
    null,
    null,
    null,
    null,
    null,
    null,
  );
```
- **Struktur:**
```
CupertinoApp(
  theme: _themeDark,
  home: const HomePage(),
);
```

### CupertinoPageScaffold
- Widget dasar untuk membangun sebuah halaman pada CupertinoApp
- Membentuk tata letak dasar sebuah halaman yang ditulis melalui properti-properti
```
CupertinoPageScaffold(
  navigationBar: CupertinoNavigationBar(
    middle: Text('Home Page'),
  ),
  child: Center(
    child: Text('Ini adalah Home Page'),
  ),
);
```