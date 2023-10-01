import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_form/models/contact_model.dart';
import 'package:task_form/stores/contact_provider.dart' as contact_store;

class FormContact extends StatefulWidget {
  const FormContact({super.key});

  @override
  State<FormContact> createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = const Color(0xFFE7E0EC);

  String name = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          fieldName(),
          const SizedBox(height: 23),
          fieldPhoneNumber(),
          const SizedBox(height: 23),
          buildDatePicker(context),
          const SizedBox(height: 23),
          buildColorPicker(context),
          const SizedBox(height: 15),
          submitButton(),
        ],
      ),
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
        onChanged: (String value) {
          name = value;
        },
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
        onChanged: (String value) {
          phoneNumber = value;
        },
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
              child: const Text(
                'Select',
                style: TextStyle(color: Colors.black),
              ),
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

  submitButton() {
    final contactProvider = Provider.of<contact_store.Contact>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            if (!formkey.currentState!.validate()) return;

            formkey.currentState!.save();

            contactProvider.add(GetContact(
              name: name,
              phoneNumber: phoneNumber,
              date: _dueDate,
              color: _currentColor,
            ));

            nameController.clear();
            phoneNumberController.clear();
          },
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
}
