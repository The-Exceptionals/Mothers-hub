class Users {
  List<User> data;

  Users({this.data});

  Users.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<User>();
      json['data'].forEach((v) {
        data.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int id;
  String username;
  String email;

  User({this.id, this.username, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['firstname'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}
