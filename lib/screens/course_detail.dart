import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mothers_hub/mh.dart';

class PostDetail extends StatelessWidget {
  static const routeName = 'postDetail';
  final Post post;

  PostDetail({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.post.title}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdatePost.routeName,
              arguments: PostArgument(post: this.post, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<PostBloc>().add(PostDelete(this.post));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    PostsList.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Title: ${this.post.title}'),
              subtitle: Text('Body: ${this.post.body}'),
            ),
            Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(this.post.body),
          ],
        ),
      ),
    );
  }
}
