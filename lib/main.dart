import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mothers_hub/bloc_observer.dart';
import 'package:mothers_hub/mh.dart';
import 'package:http/http.dart' as http;
import 'package:mothers_hub/views/home.dart';

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
          onGenerateRoute: PostAppRoute.generateRoute,
          initialRoute: LandingPage,
          home: BlocListener(
            listener: (context, event) {
              if (event is AuthAuthenticated) {
                return Navigator.pushNamed(context, HomePage);
              } else if (event is AuthNotAuthenticated) {
                return Navigator.pushNamed(context, LandingPage);
              }
            },
            )
                  ),
        ),
    );
  }
}
