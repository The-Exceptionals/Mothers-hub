import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mothers_hub/bloc_observer.dart';
import 'package:mothers_hub/post.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocObserver();

  final PostRepository postRepository = PostRepository(
    dataProvider: PostDataProvider(
      httpClient: http.Client(),
    ),
  );

  runApp(
    PostApp(postRepository: postRepository),
  );
}

class PostApp extends StatelessWidget {
  final PostRepository postRepository;

  PostApp({@required this.postRepository}) : assert(postRepository != null);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.postRepository,
      child: BlocProvider(
        create: (context) =>
            PostBloc(postRepository: this.postRepository)..add(PostLoad()),
        child: MaterialApp(
          title: 'Post App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: PostAppRoute.generateRoute,
        ),
      ),
    );
  }
}
