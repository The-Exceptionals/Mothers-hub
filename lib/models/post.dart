import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Post extends Equatable {
  Post({this.id, @required this.title, @required this.body});

  final String id;
  final String title;
  final String body;

  @override
  List<Object> get props => [id, title, body];

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      title: json['title'],
      body: json['body'],
    );
  }

  @override
  String toString() => 'Post { id: $id, title: $title}';
}
