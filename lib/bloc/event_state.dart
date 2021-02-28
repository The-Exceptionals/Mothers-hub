import 'package:equatable/equatable.dart';
import 'package:mothers_hub/mh.dart';

class EventState extends Equatable {
  const EventState();

  @override
  List<Object> get props => [];
}

class EventLoading extends EventState {}

class EventsLoadSuccess extends EventState {
  final List<Event> events;

  EventsLoadSuccess([this.events = const []]);

  @override
  List<Object> get props => [events];
}

class EventOperationFailure extends EventState {}
