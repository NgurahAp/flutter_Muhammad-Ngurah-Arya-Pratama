import 'package:flutter/material.dart';

import 'contact_model.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();

  bool isDataSubmitted = false;
  List<Contact> submittedData = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        fieldName(),
        const SizedBox(height: 23),
        fieldPhoneNumber(),
        const SizedBox(height: 15),
        submitButton(),
        const SizedBox(height: 23),
        if (isDataSubmitted) submittedDataList(),
      ],
    );
  }

  fieldName() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE7E0EC),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: nameController,
        decoration: const InputDecoration(
          labelText: 'Name',
          hintText: 'Insert Your Name!',
          labelStyle: TextStyle(
            color: Color(0xFF49454F),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  fieldPhoneNumber() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE7E0EC),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: phoneNumberController,
        decoration: const InputDecoration(
          labelText: 'Phone Number',
          hintText: '08...',
          labelStyle: TextStyle(
            color: Color(0xFF49454F),
          ),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  submitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: _handleSubmit,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: const Color(0xFF6750A4),
          ),
          child: const Text('Submit'),
        ),
      ],
    );
  }

  void _handleSubmit() async {
    final name = nameController.text;
    final phoneNumber = phoneNumberController.text;

    final contact = Contact(
      name,
      phoneNumber,
    );
    submittedData.add(contact);

    setState(() {
      isDataSubmitted = true;
    });

    nameController.clear();
    phoneNumberController.clear();
  }

  submittedDataList() {
    return Column(
      children: [
        const Text(
          'List Contacts',
          style: TextStyle(
            color: Color(0xFF1C1B1F),
            fontFamily: 'roboto',
            fontSize: 24,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 21),
        ListView.builder(
          shrinkWrap: true,
          itemCount: submittedData.length,
          itemBuilder: (context, index) {
            final contact = submittedData[index];

            return ListTile(
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: contact.name,
                      style: const TextStyle(
                        fontFamily: 'roboto',
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1C1B1F),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const TextSpan(text: '\n'), // Add a newline separator
                    TextSpan(
                      text: contact.phoneNumber,
                      style: const TextStyle(
                        fontFamily: 'roboto',
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1C1B1F),
                        letterSpacing: 0.25,
                      ),
                    ),
                    const TextSpan(text: '\n'),
                  ],
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      editContact(index);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteContact(index);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  void deleteContact(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this contact?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  submittedData.removeAt(index);
                });
                Navigator.of(context).pop();
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
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'No',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  void editContact(int index) {
    final contact = submittedData[index];

    TextEditingController nameController = TextEditingController(text: contact.name);
    TextEditingController phoneNumberController =
        TextEditingController(text: contact.phoneNumber);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final newName = nameController.text;
                final newPhoneNumber = phoneNumberController.text;

                setState(() {
                  submittedData[index] = Contact(
                    newName,
                    newPhoneNumber,
                  );
                });

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: const Color(0xFF6750A4),
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
