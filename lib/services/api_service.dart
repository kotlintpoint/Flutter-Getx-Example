import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/", // Sample API
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  /// Fetch Users (GET Request)
  Future<List<dynamic>> fetchUsers() async {
    try {
      Response response = await _dio.get("users");

      if (response.statusCode == 200) {
        return response.data; // Returns list of users
      } else {
        throw Exception("Failed to load users");
      }
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }
}
