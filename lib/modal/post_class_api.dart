import 'dart:convert';

import 'package:book_api/modal/post_modal.dart';
import 'package:http/http.dart' as http;

class PostClassApi {
  List<PostModal> postList = [];
  Future<List<PostModal>> getPostApi() async {
    var apiUrl = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(apiUrl));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postList.add(PostModal.fromJson(i));
      }
      return postList;
    } else {
      return [];
    }
  }
}
