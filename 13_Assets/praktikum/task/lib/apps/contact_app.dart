import 'package:flutter/material.dart';
import 'package:task_form/screens/contact_screen.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'roboto'),
      home: const ContactScreen(),
    );
  }
}
