import 'package:meta/meta.dart';
import 'package:mothers_hub/mh.dart';

class EventRepository {
  final EventDataProvider dataProvider;

  EventRepository({@required this.dataProvider}) : assert(dataProvider != null);

  Future<Event> createEvent(Event event) async {
    return await dataProvider.createEvent(event);
  }

  Future<List<Event>> getEvents() async {
    return await dataProvider.getEvents();
  }

  Future<void> updateEvent(Event event) async {
    await dataProvider.updateEvent(event);
  }

  Future<void> deleteEvent(String id) async {
    await dataProvider.deleteEvent(id);
  }
}
