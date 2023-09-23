import 'package:flutter/material.dart';
import 'package:task_form/screens/contact_page.dart';
import 'package:task_form/screens/image_view.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({
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
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
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
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 70,
              ),
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: Image.network(imageUrl),
                  ),
                  const SizedBox(height: 20),
                  const Text('Apakah anda ingin melihat gambar ini secara full?'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ImageViewerPage(imageUrl: imageUrl),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          backgroundColor: const Color(0xFF6750A4),
                        ),
                        child: const Text('Yes'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          backgroundColor: const Color(0xFF6750A4),
                        ),
                        child: const Text('No'),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Image.network(imageUrl),
      ),
    );
  }
}
