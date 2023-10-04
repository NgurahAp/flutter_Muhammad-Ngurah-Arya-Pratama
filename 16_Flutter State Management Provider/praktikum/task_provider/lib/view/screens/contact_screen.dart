import 'package:flutter/material.dart';
import 'package:task_form/view/widgets/drawer.dart';
import 'package:task_form/view/widgets/contact_form.dart';
import 'package:task_form/view/widgets/contact_header.dart';
import 'package:task_form/view/widgets/contact_item.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Contact App',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black54,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        backgroundColor: const Color(0xFFE7E0EC),
      ),
      drawer: const DrawerCostum(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 36,
            left: 16,
            right: 16,
          ),
          padding: const EdgeInsets.all(28),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderContact(),
              FormContact(),
              ItemContact(),
            ],
          ),
        ),
      ),
    );
  }
}
