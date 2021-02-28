import 'package:flutter/material.dart';
import 'package:mothers_hub/post.dart';

class PostAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => PostsList());
    }

    if (settings.name == AddUpdatePost.routeName) {
      PostArgument args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AddUpdatePost(
                args: args,
              ));
    }

    if (settings.name == PostDetail.routeName) {
      Post post = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => PostDetail(
                post: post,
              ));
    }

    return MaterialPageRoute(builder: (context) => PostsList());
  }
}

class PostArgument {
  final Post post;
  final bool edit;
  PostArgument({this.post, this.edit});
}
