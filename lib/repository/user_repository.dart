import 'package:flutter/material.dart';
import 'package:mothers_hub/data_provider/data_provider.dart';
import 'package:mothers_hub/models/users.dart';

class UserRepository {
  final UserDataProvider dataProvider;
  UserRepository({@required this.dataProvider}) : assert(dataProvider != null);

  Future<void> createUser(User user) async {
    await dataProvider.createUser(user);
  }

  Future<void> updateUser(User comment) async {
    await dataProvider.updateUser(comment);
  }

  Future<void> deleteUser(User user) async {
    await dataProvider.deleteUser(user);
  }
}
