import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mothers_hub/bloc/bloc.dart';
import 'package:mothers_hub/models/event.dart';
import 'package:mothers_hub/views/tabs/editpost.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard( this.event) ;
  @override
  Widget build(BuildContext context) {
    final userimage = InkWell(
      onTap: () {},
      child: Container(
        child: Container(
          margin: EdgeInsets.only(right: 10.0),
          height: 40.0,
          width: 40.0,
        ),
      ),
    );

    final headerDesc = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          event.title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "",
          style: TextStyle(
            color: Colors.grey.withOpacity(0.6),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );

    final header = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[userimage, headerDesc],
    );

    final descriptionText = Container(
      height: 80.0,
      child: Text(
        event.body,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
      ),
    );

    final divider = Divider(
      color: Colors.grey.withOpacity(0.6),
    );

    final footer = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(children: [
          IconButton(
              icon: Icon(LineIcons.pencil),
              color: Colors.grey,
              hoverColor: Colors.black,
              onPressed: () =>
                  Navigator.of(context).pushNamed(EditPostPage.routeName)),
          IconButton(
            icon: Icon(LineIcons.trash),
            onPressed: (){
              BlocProvider.of<EventBloc>(context).add(EventDelete(event));
            },
          ),
        ]),
        Row(
          children: <Widget>[
            Text('256'),
            SizedBox(
              width: 3.0,
            ),
            Icon(LineIcons.thumbs_up),
            SizedBox(
              width: 30.0,
            ),
            Text('4k'),
            SizedBox(
              width: 3.0,
            ),
            Icon(LineIcons.thumbs_down),
          ],
        ),
      ],
    );

    return Container(
      height: 220.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5.0,
            left: 0.0,
            right: 0.0,
            child: Material(
              elevation: 5.0,
              shadowColor: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
              child: Container(
                height: 220.0,
                width: 20.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                    bottom: 00.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      header,
                      SizedBox(
                        height: 10.0,
                      ),
                      descriptionText,
                      divider,
                      footer
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
