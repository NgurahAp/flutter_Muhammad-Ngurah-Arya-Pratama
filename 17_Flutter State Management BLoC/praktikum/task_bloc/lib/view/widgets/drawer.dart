import 'package:flutter/material.dart';


class DrawerCostum extends StatelessWidget {
  const DrawerCostum({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.contact_emergency_rounded),
              title: const Text(
                'Contact',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
               Navigator.of(context).pushNamed('/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_album),
              title: const Text(
                'Gallery',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/galerry');
              },
            ),
          ],
        ),
      ),
    );
  }
}
