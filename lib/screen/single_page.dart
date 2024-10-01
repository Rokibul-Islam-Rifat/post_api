import 'package:book_api/modal/post_class_api.dart';
import 'package:flutter/material.dart';

class SinglePage extends StatefulWidget {
  List<PostClassApi> singleList;
  SinglePage({super.key, required this.singleList});

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
