import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_form/ui/contact/screen/contact_screen.dart';
import 'package:task_form/ui/image/screen/galerry_screen.dart';
import 'package:task_form/ui/image/screen/image_view.dart';
import 'package:task_form/ui/contact/screen/contact_view_model.dart' as contact_store;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => contact_store.Contact(),
        )
      ],
      child: const ContactApp(),
    ),
  );
}

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

