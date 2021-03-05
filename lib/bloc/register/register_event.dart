// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

// abstract class RegisterEvent extends Equatable {
//   RegisterEvent([List props = const []]) : super();
// }

// class OnSubmitedRegister extends RegisterEvent {
//   final String email;
//   final String password;
//   final String username;

//   OnSubmitedRegister(
//       {@required this.email,
//       @required this.password,
//       @required this.username,
//       });

//   @override
//   // TODO: implement props
//   List<Object> get props =>
//       [this.email, this.password, this.username];
// }

// class OnError extends RegisterEvent {
//   final String error;
//   OnError({@required this.error}) : super([error]);

//   @override
//   // TODO: implement props
//   List<Object> get props => [this.error];
// }

// class OnSuccessRegister extends RegisterEvent {
//   @override
//   // TODO: implement props
//   List<Object> get props => null;
// }
