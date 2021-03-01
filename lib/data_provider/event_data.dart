import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:mothers_hub/mh.dart';
import 'package:http/http.dart' as http;

class EventDataProvider {
  final _baseUrl = 'http://192.168.0.101:5000';
  final http.Client httpClient;

  EventDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Event> createEvent(Event event) async {
    final response = await httpClient.post(
      Uri.http('192.168.0.189:5000', '/event/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': event.title,
        'body': event.body,
        'date': event.date
      }),
    );

    if (response.statusCode == 200) {
      return Event.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create event.');
    }
  }

  Future<List<Event>> getEvents() async {
    final response = await httpClient.get('$_baseUrl/event/getAll');

    if (response.statusCode == 200) {
      final events = jsonDecode(response.body) as List;
      return events.map((event) => Event.fromJson(event)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<void> deleteEvent(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/event/delete/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete event.');
    }
  }

  Future<void> updateEvent(Event event) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/events/${event.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': event.id,
        'title': event.title,
        'body': event.body,
        'date': event.date
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update event.');
    }
  }
}
