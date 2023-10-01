import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_form/models/contact_model.dart';

import 'package:task_form/stores/contact_provider.dart' as contact_store;

class ItemContact extends StatefulWidget {
  const ItemContact({super.key});

  @override
  State<ItemContact> createState() => _ItemContactState();
}

class _ItemContactState extends State<ItemContact> {
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();

  final currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<contact_store.Contact>(context);
    return Column(
      children: [
        const Center(
          child: Text(
            'List Contacts',
            style: TextStyle(
              color: Color(0xFF1C1B1F),
              fontFamily: 'roboto',
              fontSize: 24,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 23),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: contactProvider.contacts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: contactProvider.contacts[index].name,
                        style: const TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1C1B1F),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: contactProvider.contacts[index].phoneNumber,
                        style: const TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1C1B1F),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: DateFormat('dd-MM-yyyy')
                            .format(contactProvider.contacts[index].date),
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
                      TextSpan(
                        text: 'Color: ',
                        style: const TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1C1B1F),
                          letterSpacing: 0.25,
                        ),
                        children: [
                          WidgetSpan(
                            child: Container(
                              width: 20,
                              height: 20,
                              color: contactProvider.contacts[index].color,
                            ),
                          ),
                        ],
                      ),
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
        ),
      ],
    );
  }

  void editContact(int index) {
    final contactProvider =
        Provider.of<contact_store.Contact>(context, listen: false);
    final GetContact contactToEdit = contactProvider.contacts[index];
    nameController = TextEditingController(text: contactToEdit.name);
    phoneNumberController = TextEditingController(text: contactToEdit.phoneNumber);
    DateTime editedDate = DateTime.now();
    editedDate = contactToEdit.date;
    Color editedColor = contactToEdit.color;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Date'),
                  TextButton(
                    onPressed: () async {
                      final selectDate = await showDatePicker(
                        context: context,
                        initialDate: editedDate,
                        firstDate: DateTime(1991),
                        lastDate: DateTime(currentDate.year + 5),
                      );

                      if (selectDate != null) {
                        setState(() {
                          editedDate = selectDate;
                        });
                      }
                    },
                    child: const Text(
                      'Select',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Color'),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: double.infinity,
                color: editedColor, // Display the current color
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      editedColor,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Pick your color'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: editedColor, // Pass the current color
                              onColorChanged: (color) {
                                setState(() {
                                  editedColor = color; // Update the edited color
                                });
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Pick Color',
                    style: TextStyle(
                      color: Color(0xFF49454F),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final contactProvider =
                      Provider.of<contact_store.Contact>(context, listen: false);
                  contactProvider.edit(
                      index,
                      GetContact(
                        name: nameController.text,
                        phoneNumber: phoneNumberController.text,
                        date: editedDate,
                        color: editedColor,
                      ));
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: const Color(0xFF6750A4),
                ),
                child: const Text('Save Changes'),
              ),
            ],
          ),
        );
      },
    );
  }

  void deleteContact(int index) {
    final contactProvider =
        Provider.of<contact_store.Contact>(context, listen: false);
    contactProvider.remove(index);
  }
}
