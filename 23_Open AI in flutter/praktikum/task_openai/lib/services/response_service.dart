import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';
import 'package:task_openai/constants/openai.dart';
import 'package:task_openai/models/open_ai.dart';

class ResponseService {
  static Future<GptResponse> getResponse({
    required String budget,
    required String camera,
    required String rom,
  }) async {
    late GptResponse gptResponse = GptResponse(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0),
    );

    try {
      var url = Uri.parse('https://api.openai.com/v1/chat/completions');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      };

      final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'IDR',
        decimalDigits: 0,
      );

      String phoneBudget = formatCurrency.format(int.parse(budget));

      String promptData =
          "Recommend a smartphone with a price of $phoneBudget , a $camera camera, and $rom of storage.";

      final data = jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content": promptData,
          }
        ],
        "temperature": 0.7,
        "max_tokens": 1000
      });

      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );
      if (response.statusCode == 200) {
        gptResponse = gptResponseFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Error occured when sending request');
    }
    return gptResponse;
  }
}
