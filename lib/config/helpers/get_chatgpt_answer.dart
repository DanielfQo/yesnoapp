import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:yesnoapp/domain/entities/message.dart';

String key = '';

class GetChatgptAnswer{

  final _dio = Dio();

  Future getAnswer(String message) async {
    String baseUrl = "https://api.openai.com/v1/completions";

    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers['Authorization'] = 'Bearer $key';

    try {
      Response response = await _dio.post(
        baseUrl,
        data: jsonEncode({
          "model": "text-davinci-003",
          "prompt": message,
          "max_tokens": 200,
          "temperature": 0,
          "top_p": 1,
          "n": 1,
          "stream": false,
          "logprobs": null,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.data);
      } else {
        // Manejar errores aquí
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Manejar excepciones aquí
      print('Exception: $e');
    }
    return Message(
        text: 'funciona',
        fromWho: FromWho.hers,
        imgUrl: 'https://media.tenor.com/XyqFR_1xbMAAAAAM/duck.gif'
      );
    
  }
  
}