import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mothers_hub/mh.dart';
import 'package:mothers_hub/views/home.dart';
import 'package:mothers_hub/views/mh_route.dart';
import 'package:line_icons/line_icons.dart';

class EditPostPage extends StatefulWidget {
  static const routeName = '/editPostViewRoute';
  @override
  EditPostState createState() => EditPostState();
}

class EditPostState extends State<EditPostPage> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _post = {};

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
        "Create a post",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 40.0,
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
            _buildFormField('Title', LineIcons.pencil, 8),
            formFieldSpacing,
            _buildFormField('Post', LineIcons.pencil, 20),
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
              final form = _formKey.currentState;
              if (form.validate()) {
                form.save();
                final PostEvent event = PostUpdate(
                  Post(
                      title: this._post["title"],
                      body: this._post["body"]),
                );
                BlocProvider.of<PostBloc>(context).add(event);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    HomePage.routeName, (route) => false);
              }
            },
            child: Text(
              'EDIT POST',
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
