import 'package:flutter/material.dart';
import 'package:task_form/apps/contact_app.dart';
import 'package:provider/provider.dart';
import 'package:task_form/stores/contact_provider.dart' as contact_store;

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
