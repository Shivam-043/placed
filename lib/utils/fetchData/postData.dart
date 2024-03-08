import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future postData(String apiUrl, Map<dynamic, dynamic>? data) async {
  // try {
  data ??= {};
  // print(data);
  const serverUrl = "http://192.168.0.102:3000";
  // const serverUrl = "http://10.0.2.2:3000";
  final response = await http.post(
    Uri.parse(serverUrl + apiUrl),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(data),
  );

  // print(response);
  if (response.statusCode < 300) {
    // Use jsonDecode to convert the response body to a Dart Map
    Map<String, dynamic> responseData = jsonDecode(response.body);

    // Access the 'data' field from the response
    dynamic responseDataField = responseData['data'];
    // print('Data Field: $responseDataField');

    return responseDataField;
  } else {
    print('Failed to post data. Status Code: ${response.statusCode}');
    print('Error Message: ${response.body}');

    print(response.headers);
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
    'photo': 'base64EncodedImage',
  };

  postData(apiUrl, requestData);
}
