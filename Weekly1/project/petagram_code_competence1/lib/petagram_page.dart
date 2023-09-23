import 'package:flutter/material.dart';
import 'petagram_form.dart';

class PetagramPage extends StatefulWidget {
  const PetagramPage({Key? key}) : super(key: key);

  @override
  State<PetagramPage> createState() => _PetagramPageState();
}

class _PetagramPageState extends State<PetagramPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          top: 56,
          left: 16,
          right: 16,
        ),
        padding: const EdgeInsets.all(28),
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/image/paw.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Petagram',
                  style: TextStyle(
                    fontFamily: 'sfmono',
                    fontSize: 35,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hi pet lovers',
                  style: TextStyle(
                    fontFamily: 'sfmono',
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'We are delighted to welcome you to Petagram, the home for all the incredible pets in the world! At Petagram, we respect and celebrate the love you have for your furry, scaly, or feathery friends. This is the place to share special moments, meet like-minded friends, and explore the wonderful world of pets.',
                  style: TextStyle(
                    fontFamily: 'sfmono',
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/image/app2.jpg',
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                const PetagramForm(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
