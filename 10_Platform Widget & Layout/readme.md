# PLATFORM WIDGET & LAYOUT

- Memanfaatkan widget dengan gaya yang berbeda pada android seperti MaterialApp widget, dan pada IOS seperti CupertinoApp widget. Kedua dari widget tersebut memiliki pengertian yang hampir sama, letak perbedaannya hanya pada bagian import saat ingin memanggil widget tersebut.
- MaterialApp memiliki widget yang bernama Scaffold, yaitu widget dasar untuk membangun sebuah halaman pada MaterialApp. MaterialApp juga menyediakan tema gelap dengan memanggilnya seperti berikut 'theme : ThemeData.dark()' Lalu halaman akan otomatis berganti tema ke gelap.
- Sama seperti MaterialApp, CupertinoApp juga memiliki widget yang bernama CupertinoPageScaffold yang berfungsi sama dengan Scaffold yang ada di MaterialApp. Kekurangan dari widget ini adalah tidak menyediakan tema gelap seperti MaterialApp, jadi kita harus membuat variabelnya terlebih dahulu. CupertinoApp juga tidak memiliki drawer dan bottom navigation bar seperti yang ada di MaterialApp