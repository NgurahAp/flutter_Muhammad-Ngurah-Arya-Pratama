import 'package:flutter/material.dart';
import 'package:task_form/screens/contact_screen.dart';
import 'package:task_form/screens/galerry_screen.dart';
import 'package:task_form/screens/image_view.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'roboto'),
      initialRoute: '/',
      routes: {
        '/': (_) => const ContactScreen(),
        '/about': (_) => const GalleryScreen(),
        '/image_view': (_) => const ImageViewerScreen(),
      },
    );
  }
}
