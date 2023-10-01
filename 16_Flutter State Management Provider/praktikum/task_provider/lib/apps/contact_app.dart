import 'package:flutter/material.dart';
import 'package:task_form/ui/screens/contact_screen.dart';
import 'package:task_form/ui/screens/galerry_screen.dart';
import 'package:task_form/ui/screens/image_view.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'roboto'),
      routes: {
        '/': (_) => const ContactScreen(),
        '/galerry': (_) => const GalleryScreen(),
        '/image_view': (_) => const ImageViewerScreen(),
      },
    );
  }
}
