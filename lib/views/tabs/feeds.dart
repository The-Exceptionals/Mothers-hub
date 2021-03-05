import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mothers_hub/mh.dart';
import 'package:mothers_hub/models/users.dart';
import 'package:mothers_hub/utils/shared_preferences.dart';
import 'package:mothers_hub/widgets/feed_card1.dart';
import 'package:bloc/bloc.dart';

class FeedsPage extends StatelessWidget {
  static const routeName = '/feedsPageRoute';
  final Post post;
  final User user;

  FeedsPage({@required this.post, @required this.user});
  @override
  Widget build(BuildContext context) {

    final pageTitle = Padding(
      padding: EdgeInsets.only(top: 1.0, left: 20.0, bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Feed",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
          IconButton(icon: Icon(Icons.logout), onPressed: (){
            SharedPrefUtils.deleteStringSF();
          })
        ],
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<PostBloc, PostState>(builder: (_, state) {
          print("herrrrrrrrrrrrrrrrrr");
          if (state is PostOperationFailure) {
            print("operation failure");
            return Text("jfjf");
          } else if (state is PostsLoadSuccess) {
            final posts=state.posts;
            print("success");
            return Container(
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
                        ...posts.map((post)=>FeedCard1(post)).toList()

                      ],
                    ),
                  )
                ],
              ),
            );
          }
          print("loading");
          return Center(child:Text("loading"));
        }),
      ),
    );
  }
}
