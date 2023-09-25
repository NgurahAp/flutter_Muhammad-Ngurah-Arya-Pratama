import 'package:flutter/material.dart';
import 'package:task_form/components/drawer.dart';

class ImageViewerScreen extends StatelessWidget {
  final String imageUrl;
  const ImageViewerScreen({
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
      drawer: const DrawerCostum(),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
