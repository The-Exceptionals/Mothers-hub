import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mothers_hub/post.dart';

class AddUpdatePost extends StatefulWidget {
  static const routeName = 'postAddUpdate';
  final PostArgument args;

  AddUpdatePost({this.args});
  @override
  _AddUpdatePostState createState() => _AddUpdatePostState();
}

class _AddUpdatePostState extends State<AddUpdatePost> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _post = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit Post" : "Add New Post"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.post.title : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter post title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Post Title'),
                  onSaved: (value) {
                    setState(() {
                      this._post["title"] = value;
                    });
                  }),
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.post.title : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter post body';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Post Body'),
                  onSaved: (value) {
                    this._post["body"] = value;
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      final PostEvent event = widget.args.edit
                          ? PostUpdate(
                              Post(
                                  id: widget.args.post.id,
                                  title: this._post["title"],
                                  body: this._post["body"]),
                            )
                          : PostCreate(
                              Post(
                                title: this._post["title"],
                                body: this._post["body"],
                              ),
                            );
                      BlocProvider.of<PostBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          PostsList.routeName, (route) => false);
                    }
                  },
                  label: Text('SAVE'),
                  icon: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
