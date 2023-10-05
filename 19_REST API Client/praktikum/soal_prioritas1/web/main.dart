import 'package:dio/dio.dart';

void main() {
  // postData();
  deserialisasi();
  // putData();
}

// Nomor 1

Future<void> postData() async {
  final dio = Dio();

  try {
    final response = await dio.post(
      'http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      data: {
        "name": "Arya",
        "phone": "ba213213213r",
      },
    );

    if (response.statusCode == 201) {
      print('Berhasil melakukan permintaan POST');
      print('Data respons: ${response.data}');
    } else {
      print('Gagal melakukan permintaan POST');
      print('Kode status: ${response.statusCode}');
    }
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}

// Nomor 2

class Contact {
  int id;
  String name;
  String phoneNumber;

  Contact({required this.id, required this.name, required this.phoneNumber});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }
}

Future<void> deserialisasi() async {
  final dio = Dio();

  try {
    final response = await dio.get(
        'http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');

    if (response.statusCode == 200) {
      List<dynamic> jsonContacts = response.data;

      // Deserialize JSON directly into a list
      List<Contact> contacts = jsonContacts.map((jsonContact) {
        return Contact.fromJson(jsonContact);
      }).toList();

      for (var contact in contacts) {
        print('ID: ${contact.id}');
        print('Nama: ${contact.name}');
        print('Nomor Telepon: ${contact.phoneNumber}');
        print('---');
      }
    } else {
      print('Gagal melakukan permintaan GET');
      print('Kode status: ${response.statusCode}');
    }
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}

// Nomor 3

Future<void> putData() async {
  final dio = Dio();

  try {
    final response = await dio.put(
      'https://jsonplaceholder.typicode.com/posts/1',
      data: {
        "title": "foo",
        "body": "bar",
        "userId": 1,
      },
    );

    if (response.statusCode == 200) {
      print('Berhasil melakukan permintaan PUT');
      print('Data respons: ${response.data}');
    } else {
      print('Gagal melakukan permintaan PUT');
      print('Kode status: ${response.statusCode}');
    }
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}
