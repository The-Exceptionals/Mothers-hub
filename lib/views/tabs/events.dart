import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mothers_hub/widgets/event_card.dart';
import 'package:line_icons/line_icons.dart';

class EventPage extends StatelessWidget {
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
                  Navigator.of(context).pushNamed(addEventViewRoute)),
        ]));

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.withOpacity(0.1),
          padding: EdgeInsets.only(top: 40.0),
          width: MediaQuery.of(context).size.width,
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
                    EventCard(feed: feeds[0]),
                    EventCard(
                      feed: feeds[1],
                    ),
                    EventCard(
                      feed: feeds[2],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
