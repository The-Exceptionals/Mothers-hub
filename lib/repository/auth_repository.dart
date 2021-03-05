import 'package:flutter/material.dart';
import 'package:mothers_hub/data_provider/auth_data.dart';
import 'package:mothers_hub/models/users.dart';
import 'package:mothers_hub/utils/shared_preferences.dart';

class AuthenticationRepository{
final AuthenticationDataProvider dataProvider;
  AuthenticationRepository({@required this.dataProvider})
      : assert(dataProvider != null);
  
Future<User> getCurrentUser() async {
  return await SharedPrefUtils.getStringValuesSF().then((token)async{
      if (token==null){
        return null;
      }
      else{
          return await dataProvider.getCurrentUser();
      }
  });
   
  }

  Future<User> getUser(int id) async {
    return await dataProvider.getUser(id);
  }

Future<void> signOut() async {
    await SharedPrefUtils.deleteStringSF();
  
  }

  Future<String> signInWithEmailAndPassword(User user) async {

   return await dataProvider.signInWithEmailAndPassword(user);
  }


  

}