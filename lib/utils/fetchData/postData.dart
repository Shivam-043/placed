import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<void> postData(String apiUrl, Map<String, dynamic> data) async {
  // try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    print(response);

    if (response.statusCode == 201) {
      print('Data posted successfully');
      // You can handle the response data here if needed
      print('Response Data: ${response.body}');
    } else {
      print('Failed to post data. Status Code: ${response.statusCode}');
      print('Error Message: ${response.body}');
    }
  // } catch (error) {
  //   print('Error during API request: $error');
  // }
}

void main() {
  // Example usage
  final apiUrl = "http://localhost:3000/api/students/register";
  final requestData = {
    'name': 'John Doe',
    'email': 'john.doe@example.com',
    'mobile': '1234567890',
    'photo':
        'base64EncodedImage', 
  };

  postData(apiUrl, requestData);
}
