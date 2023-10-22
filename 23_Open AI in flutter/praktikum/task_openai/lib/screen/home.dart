import 'package:flutter/material.dart';
import 'package:task_openai/screen/response.dart';
import 'package:task_openai/services/response_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _budget = TextEditingController();
  final TextEditingController _camera = TextEditingController();
  final TextEditingController _rom = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Phone Recommendations'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Budget'),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _budget,
                  decoration:
                      const InputDecoration(hintText: 'Enter the budget in IDR'),
                  validator: (String? value) {
                    bool isInvalid = value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null;

                    if (isInvalid) {
                      return 'Please enter valid numbers';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Camera (MP)'),
                TextFormField(
                  controller: _camera,
                  decoration: const InputDecoration(
                      hintText: 'Enter your Requirement for the camera'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Internal Storage'),
                TextFormField(
                  controller: _rom,
                  decoration: const InputDecoration(
                      hintText: 'Enter your Desired internal Storage'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: isLoading && (_formKey.currentState?.validate() ?? false)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: _getRecommendation,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.grey, // Set the button color to gray
                          ),
                          child: const Center(
                            child: Text(
                              'Get Recommendation',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _getRecommendation() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await ResponseService.getResponse(
        budget: _budget.value.text,
        camera: _camera.value.text,
        rom: _rom.value.text,
      );
      if (mounted) {
        setState(
          () {
            isLoading = false;
          },
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ResponseScreen(gptResponseData: result);
            },
          ),
        );
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Failed to send a request'),
      );

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
