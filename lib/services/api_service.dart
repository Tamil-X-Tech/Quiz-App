import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question.dart'; 

class ApiService {
  static const String apiUrl = 'https://api.jsonserve.com/Uw5CrX';

  static Future<List<Question>> fetchQuizData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Question.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load quiz data');
    }
  }
}
