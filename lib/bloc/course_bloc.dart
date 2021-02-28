import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mothers_hub/bloc/bloc.dart';
import 'package:mothers_hub/post.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({@required this.postRepository})
      : assert(postRepository != null),
        super(PostLoading());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostLoad) {
      yield PostLoading();
      try {
        final posts = await postRepository.getPosts();
        yield PostsLoadSuccess(posts);
      } catch (_) {
        yield PostOperationFailure();
      }
    }

    if (event is PostCreate) {
      try {
        await postRepository.createPost(event.post);
        final posts = await postRepository.getPosts();
        yield PostsLoadSuccess(posts);
      } catch (_) {
        yield PostOperationFailure();
      }
    }

    if (event is PostUpdate) {
      try {
        await postRepository.updatePost(event.post);
        final posts = await postRepository.getPosts();
        yield PostsLoadSuccess(posts);
      } catch (_) {
        yield PostOperationFailure();
      }
    }

    if (event is PostDelete) {
      try {
        await postRepository.deletePost(event.post.id);
        final posts = await postRepository.getPosts();
        yield PostsLoadSuccess(posts);
      } catch (_) {
        yield PostOperationFailure();
      }
    }
  }
}
