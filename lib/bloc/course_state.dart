import 'package:equatable/equatable.dart';
import 'package:mothers_hub/post.dart';

class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {}

class PostsLoadSuccess extends PostState {
  final List<Post> posts;

  PostsLoadSuccess([this.posts = const []]);

  @override
  List<Object> get props => [posts];
}

class PostOperationFailure extends PostState {}
