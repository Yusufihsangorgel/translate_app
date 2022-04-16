import 'dart:convert';

import 'package:translate_app/models/translate_model.dart';
import 'package:http/http.dart' as http;

class TranslateService {
  Future<List<Translate>> getTranslate(String to, String message) async {
    print("başladım");

    final uri =
        Uri.parse('https://microsoft-translator-text.p.rapidapi.com/translate')
            .replace(queryParameters: <String, String>{
      'to': 'tr',
      'api-version': '3.0',
      'profanityAction': 'NoAction',
      'textType': 'plain',
    });
    final response = await http.post(uri,
        headers: {
          'content-type': 'application/json',
          'X-RapidAPI-Host': 'microsoft-translator-text.p.rapidapi.com',
          'X-RapidAPI-Key': '9d66e81587msh8110b5db8a31f76p1070e1jsn5a72a0f89eed'
        },
        body: message == ""
            ? '[{"Text":"Please Write Any Text"}]'
            : '[{"Text":"$message"}]');
    if (response.statusCode == 200) {
      final post = jsonDecode(response.body);
      print(post.toString());
      print("burda takıldım 0");
      final post2 = post[0]["translations"] as List;
      print("burda takıldım 1");
      print(post2.toString());
      final json = post2.map((e) => Translate.fromJson(e)).toList();
      print("burda takıldım 2");
      return json;
    } else {
      throw Exception('Failed to load translate');
    }
  }
}
