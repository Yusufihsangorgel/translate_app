import 'dart:convert';

import 'package:translate_app/models/translate_model.dart';
import 'package:http/http.dart' as http;

class TranslateService {
  Future<Translate> translate(String from, String to, String message) async {
    final response = await http.post(
        Uri.parse('https://rapid-translate-multi-traduction.p.rapidapi.com/t'),
        headers: {
          'X-RapidAPI-Key': '9d66e81587msh8110b5db8a31f76p1070e1jsn5a72a0f89eed'
        },
        body: {
          "from": from,
          "to": to,
          "e": "",
          "q": message,
        });
    if (response.statusCode == 200) {
      return Translate.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load translate');
    }
  }
}
