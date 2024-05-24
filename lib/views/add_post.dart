import 'package:api_handling_lesson/controllers/post_controller.dart';
import 'package:api_handling_lesson/model/post_model.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late PostController postController;
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postController = PostController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Title"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: desController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Description"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                PostModal newPost = PostModal(
                    userId: 1,
                    id: null,
                    title: titleController.text,
                    body: desController.text);
                postController.createPost(newPost);
              },
              child: Text("Post"))
        ],
      )),
    );
  }
}
