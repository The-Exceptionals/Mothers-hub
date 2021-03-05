import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Event extends Equatable {
  Event({this.id, @required this.title, @required this.body, this.date});

  final String id;
  final String title;
  final String body;
  final String date;

  @override
  List<Object> get props => [id, title, body];

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['_id'],
      title: json['title'],
      body: json['body'],
      date: json['date']
    );
  }

  @override
  String toString() => 'Event { id: $id, title: $title}';
}
