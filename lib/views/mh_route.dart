import 'package:flutter/material.dart';
import 'package:mothers_hub/mh.dart';
import 'package:mothers_hub/views/home.dart';

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

    if (settings.name == HomePage.routeName) {
      PostArguments args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => HomePage(
                args: args,
              ));
    }

    if (settings.name == LoginPage.routeName) {
      PostArguments args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => LoginPage(
                args: args,
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

    case landingViewRoute:
      return MaterialPageRoute(builder: (context) => LandingPage());
    case homeViewRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case loginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case registerViewRoute:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case resetPasswordViewRoute:
      return MaterialPageRoute(builder: (context) => ResetPasswordPage());
    case addPostViewRoute:
      return MaterialPageRoute(builder: (context) => AddPostPage());
    case editPostViewRoute:
      return MaterialPageRoute(builder: (context) => EditPostPage());
    case addEventViewRoute:
      return MaterialPageRoute(builder: (context) => AddEventPage());
    case editEventViewRoute:
      return MaterialPageRoute(builder: (context) => EditEventPage());