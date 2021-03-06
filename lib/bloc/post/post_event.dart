import 'package:equatable/equatable.dart';
import 'package:mothers_hub/mh.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class PostLoad extends PostEvent {
  const PostLoad();

  @override
  List<Object> get props => [];
}

class PostCreate extends PostEvent {
  final Post post;

  const PostCreate(this.post);

  @override
  List<Object> get props => [post];

  @override
  String toString() => 'Post Created {post: $post}';
}

class PostUpdate extends PostEvent {
  final Post post;

  const PostUpdate(this.post);

  @override
  List<Object> get props => [post];

  @override
  String toString() => 'Post Updated {post: $post}';
}

class PostDelete extends PostEvent {
  final Post post;

  const PostDelete(this.post);

  @override
  List<Object> get props => [post];

  @override
  toString() => 'Post Deleted {post: $post}';
}
