import 'dart:convert';

import 'package:cardit/ui/model/verify_user_id_model.dart';
import 'package:http/http.dart' as http;

class jsonServiceClass {
  //Json Fetch Data in Server
  Future<verifyUserIdModel> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    if (response.statusCode == 200) {
      return verifyUserIdModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  //Json Post Data in Server
  Future<verifyUserIdModel> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse('https://crudcrud.com/api/13daaebdd52e4bec9a19d40dba42efb9'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userIDNumber': title,
      }),
    );

    if (response.statusCode == 201) {
      print(response.body.toString());
      return verifyUserIdModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
