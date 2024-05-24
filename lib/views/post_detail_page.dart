import 'package:api_handling_lesson/model/post_model.dart';
import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  final PostModal post;
  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [Text(post.body.toString())],
      )),
    );
  }
}
