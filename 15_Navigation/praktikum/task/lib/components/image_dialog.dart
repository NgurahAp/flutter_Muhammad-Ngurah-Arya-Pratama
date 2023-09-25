import 'package:flutter/material.dart';
import 'package:task_form/screens/image_view.dart';

class ImageDialogBottomSheet extends StatelessWidget {
  final String imageUrl;
  const ImageDialogBottomSheet({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
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
                      builder: (context) => ImageViewerScreen(imageUrl: imageUrl),
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
  }
}
