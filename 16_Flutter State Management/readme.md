# Flutter Global State Management

## State
> Data yang dapat dibaca saat pembuatan widget
> Dapat berubah saat widget sedang aktif
> Hanya dimiliki oleh StatefulWidget

### Memanfaatkan State
- Dibuat sebagai property dari class
- Digunakan pada widget saat build

```
// Property
var number = 0;
// build
Text("$number"),
```

### Mengubah State 
- Menggunakan method setState
```
            ElevatedButton(
              onPressed: () {
                setState(() {
                  number++;
                });
              },
              child: const Text('Tambah'),
            )

```

## Global State
> State biasa yang dapat digunakan pada seluruh aplikasi
> Digunakan supaya widget 1 dengan yang lainnya dapat memanfaatkan state yang sama dengan mudah
> Menggunakan Provider dengan cara menambah package provider ke pubspec.yaml

### Membuat State Provider
- Buat file bernama contact.dart di dalam folder stores
- Definisikan state dalam bentuk class
```
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/contact_model.dart';

class Contact with ChangeNotifier {
  final List<GetContact> _contacts = [];
  List<GetContact> get contacts => _contacts;

  void add(GetContact contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}

```
- Import dalam file main.dart
- Daftarkan pada runApp dengan MultiProvider
```
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => contact_store.Contact(),
      )
    ],
    child: const MyApp(),
  ));
}
```
- Simpan provider dalam variable
```
final contactProvider = Provider.of<contact_store.Contact>(context);
```
- Ambil data dari provider melalui getter
```
              Expanded(
                child: ListView.builder(
                  itemCount: contactProvider.contacts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(contactProvider.contacts[index].name),
                      subtitle: Text(contactProvider.contacts[index].phoneNumber),
                    );
                  },
                ),
              ),
```