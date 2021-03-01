import 'package:flutter/material.dart';
import 'package:mothers_hub/mh.dart';
import 'package:mothers_hub/models/users.dart';
import 'package:mothers_hub/widgets/feed_card1.dart';

class FeedsPage extends StatelessWidget {

  static const routeName = 'FeedsPage';
  final Post post;
  final User user;

  FeedsPage({@required this.post, @required this.user});
  @override
  Widget build(BuildContext context) {
    final pageTitle = Padding(
      padding: EdgeInsets.only(top: 1.0, left: 20.0, bottom: 30.0),
      child: Text(
        "Feed",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.withOpacity(0.1),
          padding: EdgeInsets.only(top: 40.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    pageTitle,
                    FeedCard1(feed: ${this.post}, user: ${this.user}),
                    FeedCard1(
                      feed: ${this.post}, user: ${this.user}
                    ),
                    FeedCard1(
                      feed: ${this.post}, user: ${this.user}
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
