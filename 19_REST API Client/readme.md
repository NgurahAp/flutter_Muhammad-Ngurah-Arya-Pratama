# Representational State Transfer (REST) Application Programming Interface (API) Client

> REST API merupakan jembatan antara server dan client.
> Arsitektural memisahkan tampilan dengan proses bisnis
> Bagian tampilan dengan proses bisnis berkirim data melalui HTTP request

## HTTP
> Protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web

### Pola Komunikasi HTTP
- Client mengirim *request*
- Server mengolah dan membalas dengan memberi *response*

#### Struktur Request
- URL : Alamat halaman yang akan diakses
- Method (GET, POST, PUT, DELETE) : Menunjukan aksi yang diinginkan
- Header : Informasi tambahan terkait request yang dikirimkan, jika terjadi masalah pada API, bisa dicari dibagian ini
- Body : Data yang disertakan bersama request

#### Struktur Response
- Status code : Kode yang mewakili keseluruhan response baik sukses maupun gagal
- Header : Informasi tambahan terkait response yang dikirimkan, jika terjadi masalah pada API, bisa dicari dibagian ini
- Body : Data yang disertakan bersama response

## Dio
> Digunakan sebagai HTTP Client
> Dimanfaatan untuk melakukan REST API

### Instalasi
1. Tambahkan dependency pada pubspec.yaml
2. Mengambil data dengan menggunakan method GET dan menampilkan hasilnya pada console
```
void main() {
  Dio()
      .get(
          'http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts')
      .then((response) {
    print(response);
  });
}
```
## Serialisasi JSON
> JSON merupakan JavaScript Object Notation
> Umumnya digunakan pada REST API
> Cara penulisan data dalam JSON biasanya secara key-value
> Mengubah struktur data (berbentuk Map/List) ke JSON menggunakan Serialisasi
> Menggunakan fungsi jsonEncode dari package dart:convert
```
void main() {
  var dataMap = {
    'name': 'Ngurah',
    'age': 21,
  };
  var dataJson = jsonEncode(dataMap);
  print(dataJson);
}
```

## Deserialisasi JSON
> Kebalikan dari Serialisasi
> Mengubah JSON ke Struktur data(berbentuk Map/List)
> Menggunakan fungsi jsonDecode dari package dart:convert
```
void main() {
  var dataJSON = '{"name" : "Arya", "Age" : 20}';
  var dataMap = jsonDecode(dataJSON);
  print(dataMap);
}
```