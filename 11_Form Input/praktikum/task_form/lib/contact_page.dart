import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'contact_form.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icon/icon1.svg',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Create New Contacts',
                  style: TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Adding a new contact to your address book is akin to weaving the intricate threads of human connection. It's an opportunity to nurture relationships, foster collaboration, and expand your circle of influence, enriching your life's tapestry with every name you add.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.25,
                  ),
                ),
                const SizedBox(height: 15),
                const ContactForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
