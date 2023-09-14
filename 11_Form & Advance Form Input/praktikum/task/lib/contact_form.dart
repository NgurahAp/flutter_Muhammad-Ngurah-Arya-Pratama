import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
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
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = const Color(0xFFE7E0EC);

  bool isDataSubmitted = false;
  List<Contact> submittedData = [];
  List<String> selectedFilePaths = [];

  void _handleSubmit() async {
    final name = nameController.text;
    final phoneNumber = phoneNumberController.text;
    final currentDate = DateTime.now();
    final currentColor = _currentColor;

    List<String> selectedFiles = [];
    if (selectedFilePaths.isNotEmpty) {
      selectedFiles.addAll(selectedFilePaths);
    }

    print(
        "Name: $name, Phone Number: $phoneNumber, Date: $currentDate, Color: $currentColor,");
    if (selectedFilePaths.isNotEmpty) {
      print('Selected Files: ${selectedFilePaths.join(", ")}');
    }

    final contact =
        Contact(name, phoneNumber, currentDate, currentColor, selectedFiles);
    submittedData.add(contact);

    setState(() {
      isDataSubmitted = true;
    });

    nameController.clear();
    phoneNumberController.clear();

    // Set warna kembali ke warna awal
    setState(() {
      _currentColor = const Color(0xFFE7E0EC);
    });
  }

  void printSelectedFiles() {
    for (final filePath in selectedFilePaths) {
      print('Selected File: $filePath');
    }
  }

  Future<List<String>> _handleFilePick() async {
    final result = await FilePicker.platform.pickFiles();
    final selectedFiles = <String>[];

    if (result != null) {
      final List<PlatformFile> files = result.files;
      for (final file in files) {
        final filePath = file.path;
        if (filePath != null) {
          selectedFilePaths.add(filePath);
        }
      }
    }

    return selectedFiles;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        fieldName(),
        const SizedBox(height: 23),
        fieldPhoneNumber(),
        const SizedBox(height: 15),
        buildDatePicker(context),
        const SizedBox(height: 15),
        buildColorPicker(context),
        const SizedBox(height: 15),
        filePickerButton(),
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

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1991),
                  lastDate: DateTime(currentDate.year + 5),
                );

                setState(() {
                  if (selectDate != null) {
                    _dueDate = selectDate;
                  }
                });
              },
              child: const Text('Select'),
            )
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_dueDate),
        )
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                _currentColor,
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
                        pickerColor: _currentColor,
                        onColorChanged: (color) {
                          setState(() {
                            _currentColor = color;
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
                      )
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
        )
      ],
    );
  }

  Widget filePickerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _handleFilePick,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE7E0EC),
          ),
          child: const Text(
            'Pick Files',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
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
                    TextSpan(
                      text: DateFormat('dd-MM-yyyy').format(contact.date),
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
                            color: contact.color,
                          ),
                        ),
                      ],
                    ),
                    const TextSpan(text: '\n'),
                    for (final filePath in contact.selectedFiles)
                      TextSpan(
                        text: filePath
                            .split('/')
                            .last, // Mengambil hanya nama file tanpa path
                        style: const TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1C1B1F),
                          letterSpacing: 0.25,
                        ),
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
    DateTime editedDate = contact.date;
    Color editedColor = contact.color;

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
                    child: const Text('Select'),
                  ),
                ],
              ),
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
                    editedDate,
                    editedColor,
                    selectedFilePaths, // Update the color in the contact object
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
