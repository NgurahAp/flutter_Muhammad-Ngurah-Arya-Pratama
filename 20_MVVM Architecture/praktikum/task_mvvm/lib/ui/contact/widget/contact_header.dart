import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderContact extends StatelessWidget {
  const HeaderContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/icons/icon1.svg',
          height: 24,
          width: 24,
        ),
        const SizedBox(height: 16),
        const Text(
          'Create New Contacts',
          style: TextStyle(
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
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}