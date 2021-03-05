import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mothers_hub/bloc_observer.dart';
import 'package:mothers_hub/mh.dart';
import 'package:http/http.dart' as http;
import 'package:mothers_hub/repository/auth_repository.dart';
import 'package:mothers_hub/repository/user_repository.dart';
import 'package:mothers_hub/views/home.dart';
import 'package:mothers_hub/views/landing.dart';
import './views/login.dart';
import 'package:mothers_hub/views/mh_route.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository(
    dataProvider: AuthenticationDataProvider(
      httpClient: http.Client(),
    ),
  );

  final UserRepository userRepository = UserRepository(
    dataProvider: UserDataProvider(
      httpClient: http.Client(),
    ),
  );
  final PostRepository postRepository = PostRepository(
    dataProvider: PostDataProvider(
      httpClient: http.Client(),
    ),
  );
  final EventRepository eventRepository = EventRepository(
    dataProvider: EventDataProvider(
      httpClient: http.Client(),
    ),
  );

  runApp(
    MyApp(
        userRepository: userRepository,
        authenticationRepository: authenticationRepository,
        postRepository: postRepository,
        eventRepository: eventRepository),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  final AuthenticationRepository authenticationRepository;
  final PostRepository postRepository;
  final EventRepository eventRepository;

  MyApp(
      {@required this.userRepository,
      @required this.authenticationRepository,
      @required this.postRepository,
      @required this.eventRepository})
      : assert(authenticationRepository != null ||
            userRepository != null ||
            postRepository != null ||
            eventRepository != null);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => this.userRepository),
        RepositoryProvider(create: (context) => this.authenticationRepository),
        RepositoryProvider(create: (context) => this.postRepository),
        RepositoryProvider(create: (context) => this.eventRepository),
      ],
      //value: this.recipeRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthenticationBloc(
                  authenticationRepository: this.authenticationRepository)
                ..add(AppLoaded())),
          BlocProvider(
              create: (context) => PostBloc(postRepository: this.postRepository)
                ..add(PostLoad())),
          BlocProvider(
              create: (context) =>
                  EventBloc(eventRepository: this.eventRepository)
                    ..add(EventLoad()))
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  bodyText2: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  headline5: TextStyle(
                    color: Color.fromRGBO(10, 56, 92, 1),
                    // fontSize: 20,
                    // fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                  headline4: TextStyle(
                    color: Color.fromRGBO(10, 56, 92, 1),
                    // fontSize: 20,
                    // fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                ),
            //backgroundColor:Color.fromRGBO(125,125 ,125 , 0.1),
            accentColor: Colors.red[300],
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (_, state) {
            if (state is AuthenticationAuthenticated) {
              return HomePage();
            } else if (state is AuthenticationLoading) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            } else {
              print(state);
              return Auth();
            }
          }),
          onGenerateRoute: PostAppRoute.generateRoute,
        ),
      ),
    );
  }
}
