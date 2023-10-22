import 'package:flutter/material.dart';
import 'package:task_openai/models/open_ai.dart';

class ResponseScreen extends StatelessWidget {
  const ResponseScreen({
    super.key,
    required this.gptResponseData,
  });

  final GptResponse gptResponseData;

  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
        title: Text('Recomendations'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Recommendations',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              gptResponseData.choices[0].text,
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
