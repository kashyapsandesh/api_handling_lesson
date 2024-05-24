import 'dart:developer';

import 'package:api_handling_lesson/controllers/services/network_service.dart';
import 'package:api_handling_lesson/model/post_model.dart';
import 'package:dio/dio.dart';

class PostController {
// initiallizing of http service
  late HttpServices httpServices;
  PostModal? posts;

//constructor
  PostController() {
    //instance of http services
    httpServices = HttpServices();
  }
//getpost
  Future<List<PostModal>> getposts() async {
    List<PostModal> postList = [];
    Response response;
    try {
      response = await httpServices.getRequest('/posts');
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;
        responseData.forEach((postData) {
          postList.add(PostModal.fromJson(postData));
        });
        postList.forEach((post) {
          log(post.toString());
        });
      } else {
        log('Failed to fetch posts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error while fetching posts: $e');
      throw Exception(e.toString());
    }
    return postList;
  }

  //post post
  Future<void> createPost(PostModal newPost) async {
  try {
    // Make POST request to create a new post
    Response response = await httpServices.postRequest('/posts', data: newPost.toJson());

    if (response.statusCode == 201) {
      // Post created successfully
      log('New post created: ${response.data}');
    } else {
      // Handle non-201 status code
      log('Failed to create post. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle errors
    log('Error while creating post: $e');
  }
}



}
