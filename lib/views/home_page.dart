import 'package:api_handling_lesson/controllers/post_controller.dart';
import 'package:api_handling_lesson/model/post_model.dart';
import 'package:api_handling_lesson/views/add_post.dart';
import 'package:api_handling_lesson/views/post_detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModal>? posts;

  late PostController postController;
  void getPost() async {
    posts = await postController.getposts();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postController = PostController();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Handling"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddPost()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: posts?.length ?? 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PostDetailPage(
                              post: posts![index],
                            )));
              },
              child: ListTile(
                title: Text("${posts![index].title}"),
              ),
            );
          }),
    );
  }
}
