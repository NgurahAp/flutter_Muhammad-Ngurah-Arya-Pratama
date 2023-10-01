import 'package:flutter/material.dart';
import 'package:task_form/ui/widgets/drawer.dart';
import 'package:task_form/ui/widgets/image_dialog.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Gallery',
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
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 2,
        children: <Widget>[
          buildImageItem(context, 'https://picsum.photos/seed/picsum/300'),
          buildImageItem(context, 'https://picsum.photos/300?grayscale'),
          buildImageItem(context, 'https://picsum.photos/300/?blur'),
          buildImageItem(context, 'https://picsum.photos/300'),
          buildImageItem(context, 'https://picsum.photos/id/237/300'),
          buildImageItem(context, 'https://picsum.photos/300/?blur=2'),
        ],
      ),
    );
  }

  Widget buildImageItem(BuildContext context, String imageUrl) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (context) => ImageDialogBottomSheet(imageUrl: imageUrl));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Image.network(imageUrl),
      ),
    );
  }
}
