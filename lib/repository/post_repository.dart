import 'package:meta/meta.dart';
import 'package:mothers_hub/mh.dart';

class PostRepository {
  final PostDataProvider dataProvider;

  PostRepository({@required this.dataProvider}) : assert(dataProvider != null);

  Future<Post> createPost(Post post) async {
    return await dataProvider.createPost(post);
  }

  Future<List<Post>> getPosts() async {
    return await dataProvider.getPosts();
  }

  Future<void> updatePost(Post post) async {
    await dataProvider.updatePost(post);
  }

  Future<void> deletePost(String id) async {
    await dataProvider.deletePost(id);
  }
}
