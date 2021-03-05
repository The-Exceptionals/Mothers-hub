import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mothers_hub/mh.dart';
import 'package:mothers_hub/repository/auth_repository.dart';
import '../bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;
  final AuthenticationRepository _authenticationRepository;

  LoginBloc(AuthenticationBloc authenticationBloc, AuthenticationRepository authentication_authenticationRepository)
      : assert(authenticationBloc != null),
        assert(authentication_authenticationRepository != null),
        _authenticationBloc = authenticationBloc,
        _authenticationRepository = authentication_authenticationRepository,
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInWithEmailButtonPressed) {
      yield* _mapLoginWithEmailToState(event);
    }
  }



  Stream<LoginState> _mapLoginWithEmailToState(LoginInWithEmailButtonPressed event) async* {
    yield LoginLoading();
    print('Nth very weird just happened');
    try {
      final token = await _authenticationRepository.signInWithEmailAndPassword(event.user);
      final user = await _authenticationRepository.getUser(int.parse(token));
        if (user != null) {
         print('userEmail');
          print(user.email);
        _authenticationBloc.add(UserLoggedIn(user: user));
        yield LoginSuccess();
        yield LoginInitial();
      } else {
          yield LoginSuccess();
    //    yield LoginFailure(error: 'Something very weird just happened');
      }
    } on Exception catch (e) {
      yield LoginSuccess();
      //yield LoginFailure(error: "");
    } catch (err) {
      yield LoginSuccess();
     // yield LoginFailure(error: err.message ?? 'An unknown error occured');
    }
  }
}