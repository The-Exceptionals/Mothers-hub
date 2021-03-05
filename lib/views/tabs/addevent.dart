import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mothers_hub/bloc/bloc.dart';
import 'package:mothers_hub/bloc/event/event_bloc.dart';
import 'package:mothers_hub/bloc/post/post_bloc.dart';
import 'package:mothers_hub/models/event.dart';
import 'package:mothers_hub/views/home.dart';


class AddEventPage extends StatefulWidget {
  static const routeName = "/addEventViewRoute";
  @override
  AddEventState createState() => AddEventState();
}

class AddEventState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();
  String title="";
  String eventbody="";

  @override
  Widget build(BuildContext context) {
    final appBar = Padding(
      padding: EdgeInsets.only(bottom: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )
        ],
      ),
    );

    final pageTitle = Container(
      child: Text(
        "Create an event",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
    );

    final formFieldSpacing = SizedBox(
      height: 30.0,
    );

    final registerForm = Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              onChanged: (value){
                setState(() {
                  title=value;
                });
              },
              decoration: InputDecoration(
                labelText: "body",
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  LineIcons.pencil,
                  color: Colors.black,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(20),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
            ),
            formFieldSpacing,
            TextFormField(
              onChanged: (value){
                setState(() {
                  eventbody=value;
                });
              },
              decoration: InputDecoration(
                labelText: "Event",
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  LineIcons.pencil,
                  color: Colors.black,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(20),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
            ),
            formFieldSpacing,
          ],
        ),
      ),
    );

    final submitBtn = Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.black),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(7.0),
          color: Colors.black,
          elevation: 10.0,
          shadowColor: Colors.black87,
          child: MaterialButton(
            onPressed: () {
              BlocProvider.of<EventBloc>(context).add(EventCreate(Event(body:eventbody,title:title)));
              Navigator.of(context).pushNamed(HomePage.routeName);
            },
            child: Text(
              'ADD EVENT',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              appBar,
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[pageTitle, registerForm, submitBtn],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, IconData icon, double height) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(height),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
    );
  }
}
