import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl = '';

  void fetchImage() async {
    try {
      final response = await Dio().get('https://api.dicebear.com/7.x/bottts/png');
      if (response.statusCode == 200) {
        setState(() {
          imageUrl = response.realUri.toString();
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DiceBear Image Example'),
      ),
      body: Center(
        child: imageUrl.isEmpty
            ? const CircularProgressIndicator()
            : Image.network(imageUrl),
      ),
    );
  }
}
