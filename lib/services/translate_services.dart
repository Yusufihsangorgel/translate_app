import 'dart:convert';

import 'package:translate_app/models/translate_model.dart';
import 'package:http/http.dart' as http;

class TranslateService {
  Future<List<Translate>> getTranslate(String to, String message) async {
    final queryParameters = {
      'to': to,
      'api-version': '3.0',
      'profanityAction': 'NoAction',
      'textType': 'plain',
    };
    final response = await http.post(
        Uri.parse('https://microsoft-translator-text.p.rapidapi.com/translate'),
        headers: {
          'X-RapidAPI-Key': '9d66e81587msh8110b5db8a31f76p1070e1jsn5a72a0f89eed'
        },
        body: [
          {"Text": message}
        ]);
    if (response.statusCode == 200) {
      final post = jsonDecode(response.body);
      final post2 = post["translations"] as List;
      final json = post2.map((e) => Translate.fromJson(e)).toList();
      print(post2.toString());
      return json;
    } else {
      throw Exception('Failed to load translate');
    }
  }
}
