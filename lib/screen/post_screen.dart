import 'dart:convert';

import 'package:book_api/modal/post_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostModal> postList = [];
  Future<List<PostModal>> getPostApi() async {
    var apiUrl = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(apiUrl));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostModal.fromJson(i));
      }
      return postList;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text(
          "Post Api",
          style: _myStyle(
            Colors.white,
            FontWeight.bold,
            25,
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder(
            future: getPostApi(),
            builder: (context, AsyncSnapshot<List<PostModal>> snapshot) {
              return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.cyan,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Text(
                                postList[index].id.toString(),
                                style: _myStyle(
                                    Colors.greenAccent, FontWeight.normal, 22),
                              ),
                            ),
                            Text(
                              postList[index].title.toString(),
                              style:
                                  _myStyle(Colors.white, FontWeight.bold, 19),
                            ),
                            Text(
                              postList[index].body.toString(),
                              style:
                                  _myStyle(Colors.white, FontWeight.normal, 17),
                              maxLines: 3,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "More Here",
                                  style: _myStyle(Colors.greenAccent,
                                      FontWeight.normal, 22),
                                )),
                          ],
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}

_myStyle(Color clr, FontWeight fw, double? size) {
  return TextStyle(
    color: clr,
    fontWeight: fw,
    fontSize: size,
  );
}
