import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mothers_hub/mh.dart';
import '../bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc authenticationBloc;

  LoginBloc({
    @required this.authenticationBloc,
  })  : assert(authenticationBloc != null),
        super(null);

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is OnSubmited) {
      yield LoadedState();
      Map data = {
        'email': event.email.toString(),
        "password": event.password.toString()
      };
      var res = await this.authenticationBloc.login(data);

      if (res.containsKey('accessToken')) {
        final storage = new FlutterSecureStorage();
        await storage.write(key: "jwt", value: res["accessToken"]);
        this.dispatch(OnSuccess());
      } else if (res.containsKey('statusCode') && res["statusCode"] != 200) {
        var mesage = "A error has been provide";
        this.dispatch(OnError(error: mesage));
      }
    }
    if (event is OnSuccess) {
      this.authenticationBloc.dispatch(LoggedIn());
      yield LoginSucced();
    }

    if (event is OnError) {
      yield LoginFailure(error: event.error);
    }
  }
}
