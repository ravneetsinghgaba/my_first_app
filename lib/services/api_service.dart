import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://parseapi.back4app.com/classes';
  static const String appId = 'Your_Application_ID'; // Replace with your Back4App App ID
  static const String apiKey = 'Your_REST_API_Key';  // Replace with your Back4App REST API Key

  static Map<String, String> headers = {
    'X-Parse-Application-Id': appId,
    'X-Parse-REST-API-Key': apiKey,
    'Content-Type': 'application/json',
  };

  static Future<List<dynamic>> fetchTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/Task'), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'];
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  static Future<void> addTask(Map<String, dynamic> taskData) async {
    await http.post(Uri.parse('$baseUrl/Task'), headers: headers, body: jsonEncode(taskData));
  }

  static Future<void> deleteTask(String id) async {
    await http.delete(Uri.parse('$baseUrl/Task/$id'), headers: headers);
  }

  static Future<void> updateTask(String id, Map<String, dynamic> taskData) async {
    await http.put(Uri.parse('$baseUrl/Task/$id'), headers: headers, body: jsonEncode(taskData));
  }
}
