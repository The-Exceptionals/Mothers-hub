import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mothers_hub/models/users.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInWithEmailButtonPressed extends LoginEvent {
  final User user;


  LoginInWithEmailButtonPressed({@required this.user});

  @override
  List<Object> get props => [user];
}