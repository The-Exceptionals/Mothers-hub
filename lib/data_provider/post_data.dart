import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:mothers_hub/mh.dart';
import 'package:http/http.dart' as http;

class PostDataProvider {
  final _baseUrl = 'http://192.168.0.189:5000';
  final http.Client httpClient;

  PostDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Post> createPost(Post post) async {
    final response = await httpClient.post(
      Uri.http('192.168.0.189:5000', '/post/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': post.title,
        'body': post.body,
      }),
    );

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create post.');
    }
  }

  Future<List<Post>> getPosts() async {
    final response = await httpClient.get('$_baseUrl/post/getAll');

    if (response.statusCode == 200) {
      final posts = jsonDecode(response.body) as List;
      return posts.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<void> deletePost(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/post/delete/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete post.');
    }
  }

  Future<void> updatePost(Post post) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/posts/${post.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': post.id,
        'title': post.title,
        'body': post.body
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update post.');
    }
  }
}
