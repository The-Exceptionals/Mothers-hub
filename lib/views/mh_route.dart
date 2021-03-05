import 'package:flutter/material.dart';
import 'package:mothers_hub/mh.dart';
import 'package:mothers_hub/views/home.dart';
import 'package:mothers_hub/views/landing.dart';
import 'package:mothers_hub/views/login.dart';
import 'package:mothers_hub/views/register.dart';
import 'package:mothers_hub/views/reset_password.dart';
import 'package:mothers_hub/views/tabs/addevent.dart';
import 'package:mothers_hub/views/tabs/addpost.dart';
import 'package:mothers_hub/views/tabs/editevent.dart';
import 'package:mothers_hub/views/tabs/editpost.dart';
import 'package:mothers_hub/views/tabs/feeds.dart';

class PostAppRoute {
  static Route generateRoute(RouteSettings settings) {

    if (settings.name == LandingPage.routeName) {
      return MaterialPageRoute(builder: (context) => LandingPage());
    }
    if (settings.name == HomePage.routeName) {
      return MaterialPageRoute(builder: (context) => HomePage());
    }
    if (settings.name == LoginPage.routeName) {
      return MaterialPageRoute(builder: (context) => Auth());
    }
    if (settings.name == RegisterPage.routeName) {
      return MaterialPageRoute(builder: (context) => RegisterPage());
    }
    if (settings.name == ResetPasswordPage.routeName) {
      return MaterialPageRoute(builder: (context) => ResetPasswordPage());
    }
    if (settings.name == AddPostPage.routeName) {
      return MaterialPageRoute(builder: (context) => AddPostPage());
    }
    if (settings.name == EditPostPage.routeName) {
      return MaterialPageRoute(builder: (context) => EditPostPage());
    }
    if (settings.name == AddEventPage.routeName) {
      return MaterialPageRoute(builder: (context) => AddEventPage());
    }
    if (settings.name == EditEventPage.routeName) {
      return MaterialPageRoute(builder: (context) => EditEventPage());
    }

    return MaterialPageRoute(builder: (context) => HomePage());
  }
}

// class PostArgument {
//   final Post post;
//   final bool edit;
//   PostArgument({this.post, this.edit});
// }

    