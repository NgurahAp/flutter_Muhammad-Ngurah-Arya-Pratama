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
      appBar: AppBar(
        title: Text(
          'PETAGRAM',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/image/paw.png',
              height: 25,
              width: 25,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: const Text('Home'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Contact Us'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('About Us'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 30,
            left: 16,
            right: 16,
          ),
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              const Text(
                'Hi pet lovers!',
                style: TextStyle(
                  fontFamily: 'sfmono',
                  fontSize: 30,
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
                textAlign: TextAlign.center,
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
              const SizedBox(height: 40),
              const Text(
                'About Us',
                style: TextStyle(
                  fontFamily: 'sfmono',
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SizedBox(
                      width: 140,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/paw.png',
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'Our Mission',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'We aim to assist pet owners, animal lovers, and animal activists in sharing their knowledge, experiences, and love for these creatures',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SizedBox(
                      width: 140,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/paw.png',
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'Friendly Community',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'Here, you can engage with people who share the same interests in the welfare, care, and love for both pets and wildlife.',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                              // textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
