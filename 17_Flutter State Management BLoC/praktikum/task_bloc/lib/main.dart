import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_form/view/screens/contact_screen.dart';
import 'package:task_form/view/screens/galerry_screen.dart';
import 'package:task_form/view/screens/image_view.dart';
import 'package:task_form/view_model/contact_bloc.dart';

void main() {
  runApp(const ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      create: (context) => ContactBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'roboto'),
        initialRoute: '/',
        routes: {
          '/': (_) => const ContactScreen(),
          '/about': (_) => const GalleryScreen(),
          '/image_view': (_) => const ImageViewerScreen(),
        },
      ),
    );
  }
}
