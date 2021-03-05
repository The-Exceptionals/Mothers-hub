import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:mothers_hub/mh.dart';
import 'package:http/http.dart' as http;
import 'package:mothers_hub/utils/constants.dart';
import 'package:mothers_hub/utils/shared_preferences.dart';

class EventDataProvider {
  final _baseUrl = baseUrl;
  final http.Client httpClient;

  EventDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Event> createEvent(Event event) async {
    final response = await httpClient.post(
      Uri.http(address, '/event/add'),
      headers: await SharedPrefUtils.getStringValuesSF().then((token){
        print("jhhyughygyjgyygjyyj");
        print(token);
        return (<String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        });
      }),
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
    final response = await httpClient.get('$_baseUrl/event/getAll',
        headers: await SharedPrefUtils.getStringValuesSF().then((token){
      print("jhhyughygyjgyygjyyj");
      print(token);
      return (<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
    }));
    print(response.body);
    if (response.statusCode == 200) {
      final events = jsonDecode(response.body)["data"] as List;
      return events.map((event) => Event.fromJson(event)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<void> deleteEvent(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/event/delete/$id',
        headers: await SharedPrefUtils.getStringValuesSF().then((token){
          print("jhhyughygyjgyygjyyj");
          print(token);
          return (<String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          });
        }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete event.');
    }
  }

  Future<void> updateEvent(Event event) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/events/${event.id}',
      headers: await SharedPrefUtils.getStringValuesSF().then((token){
        print("jhhyughygyjgyygjyyj");
        print(token);
        return (<String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        });
      }),
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
