import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mothers_hub/mh.dart';
import 'package:bloc/bloc.dart';
import 'package:mothers_hub/repository/auth_repository.dart';
import 'package:overlay_support/overlay_support.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

   AuthenticationBloc({@required this.authenticationRepository})
      : assert(authenticationRepository != null),
        super(AuthenticationInitial());


  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    print('getting hererererererererere');
    if (event is AppLoaded) {
       print('event is app loaded');
      yield* _mapAppLoadedToState(event);
    }

    if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState(event);
    }

    if (event is UserLoggedOut) {
      yield* _mapUserLoggedOutToState(event);
    }
  }

  Stream<AuthenticationState> _mapAppLoadedToState(AppLoaded event) async* {
    yield AuthenticationLoading();
    try {
      final currentUser = await authenticationRepository.getCurrentUser();

      if (currentUser != null) {
        print('Found himmmm');
        yield AuthenticationAuthenticated(user: currentUser);
      } else {
         print('Nope himmmm');
        yield AuthenticationNotAuthenticated();
      }
    } catch (e) {
      yield AuthenticationFailure(message: e.message ?? 'An unknown error occurred');
    }
  }

  Stream<AuthenticationState> _mapUserLoggedInToState(UserLoggedIn event) async* {
    print("Authenticateddddddddddddddddddddddddddddddd");
    yield AuthenticationAuthenticated(user: event.user);
  }

  Stream<AuthenticationState> _mapUserLoggedOutToState(UserLoggedOut event) async* {
    await authenticationRepository.signOut();
    yield AuthenticationNotAuthenticated();
  }
}


