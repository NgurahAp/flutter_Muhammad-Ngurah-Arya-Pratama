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
