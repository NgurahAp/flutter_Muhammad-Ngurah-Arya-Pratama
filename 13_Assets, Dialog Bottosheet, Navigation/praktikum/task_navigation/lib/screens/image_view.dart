import 'package:flutter/material.dart';
import 'package:task_form/screens/contact_page.dart';
import 'package:task_form/screens/galerry_page.dart';

class ImageViewerPage extends StatelessWidget {
  final String imageUrl;
  const ImageViewerPage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Image Viewer',
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
      drawer: Drawer(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_album),
                title: const Text(
                  'Gallery',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GalleryPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
