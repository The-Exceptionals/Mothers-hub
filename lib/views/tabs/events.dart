import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mothers_hub/bloc/bloc.dart';
import 'package:mothers_hub/bloc/post/post_bloc.dart';
import 'package:mothers_hub/views/tabs/addevent.dart';
import 'package:mothers_hub/widgets/event_card.dart';
import 'package:line_icons/line_icons.dart';

class EventPage extends StatelessWidget {
  static const routeName = '/eventsPageRoute';
  @override
  Widget build(BuildContext context) {
    final pageTitle = Padding(
        padding: EdgeInsets.only(top: 1.0, left: 20.0, bottom: 30.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Events",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
          IconButton(
              icon: Icon(LineIcons.plus),
              onPressed: () =>
                  Navigator.of(context).pushNamed(AddEventPage.routeName)),
        ]));

    return Scaffold(
      body:  BlocBuilder<EventBloc, EventState>(builder: (_, state)
    {
      if (state is EventsLoadSuccess) {
        final events =state.events;
        return SingleChildScrollView(
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            padding: EdgeInsets.only(top: 40.0),
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      pageTitle,
                    ...events.map((event) => EventCard(event)).toList()
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
      return Text("Failed");
    }
    )

    );
  }
}
