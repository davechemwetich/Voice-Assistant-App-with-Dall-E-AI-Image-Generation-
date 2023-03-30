import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:voice/secrets.dart';

class OPenAiService {
  Future<String> isArtPrompsAPI(String prompt) async {
    try {
      final res = await http.post(
        Uri.parse("https://api.openai.com/v1/chat/completions "),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openApiKey'
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                'role': 'user',
                'content':
                    'Does this message want to generate an AI picture, image, art or anything similar? $prompt . Simply answer with a yes or no.',
              }
            ]
          },
        ),
      );
      print(res.body);
      if (res.statusCode == 200) {
        jsonDecode(res.body)['choices'][0]['message']['content'];
        // content = content.trim();
      }
      return "AI";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    return "chat gpt";
  }

  Future<String> dallEAPI(String prompt) async {
    return "dale";
  }
}
