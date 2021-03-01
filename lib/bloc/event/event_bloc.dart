import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mothers_hub/mh.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final EventRepository eventRepository;

  EventBloc({@required this.eventRepository})
      : assert(eventRepository != null),
        super(EventLoading());

  @override
  Stream<EventState> mapEventToState(EventEvent event) async* {
    if (event is EventLoad) {
      yield EventLoading();
      try {
        final events = await eventRepository.getEvents();
        yield EventsLoadSuccess(events);
      } catch (_) {
        yield EventOperationFailure();
      }
    }

    if (event is EventCreate) {
      try {
        await eventRepository.createEvent(event.event);
        final events = await eventRepository.getEvents();
        yield EventsLoadSuccess(events);
      } catch (_) {
        yield EventOperationFailure();
      }
    }

    if (event is EventUpdate) {
      try {
        await eventRepository.updateEvent(event.event);
        final events = await eventRepository.getEvents();
        yield EventsLoadSuccess(events);
      } catch (_) {
        yield EventOperationFailure();
      }
    }

    if (event is EventDelete) {
      try {
        await eventRepository.deleteEvent(event.event.id);
        final events = await eventRepository.getEvents();
        yield EventsLoadSuccess(events);
      } catch (_) {
        yield EventOperationFailure();
      }
    }
  }
}
