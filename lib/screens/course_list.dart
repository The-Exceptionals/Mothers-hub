import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mothers_hub/bloc/bloc.dart';
import 'package:mothers_hub/post.dart';

class PostsList extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Posts'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (_, state) {
          if (state is PostOperationFailure) {
            return Text('Could not do post operation');
          }

          if (state is PostsLoadSuccess) {
            final posts = state.posts;

            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (_, idx) => ListTile(
                title: Text('${posts[idx].title}'),
                subtitle: Text('${posts[idx].body}'),
                onTap: () => Navigator.of(context)
                    .pushNamed(PostDetail.routeName, arguments: posts[idx]),
              ),
            );
          }

          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AddUpdatePost.routeName,
          arguments: PostArgument(edit: false),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
