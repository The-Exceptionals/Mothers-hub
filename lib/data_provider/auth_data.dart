import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mothers_hub/utils/constants.dart';
import 'package:mothers_hub/mh.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mothers_hub/models/users.dart';
import 'package:mothers_hub/utils/shared_preferences.dart';

class AuthenticationDataProvider{
 
  final http.Client httpClient;

  AuthenticationDataProvider({@required this.httpClient}) : assert(httpClient != null);
  
  
  
  Future<User> getCurrentUser()async{
    print(":::::::::::::::::::::::::::::::::::::::::::::::::::::");
   return await SharedPrefUtils.getStringValuesSF().then((token)async{
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    print('token is');
    print(payload['sessionId']);
    final response = await httpClient.get('$baseUrl/user/${payload['sessionId']}',
    headers: await SharedPrefUtils.getStringValuesSF().then((token){
         print(token);
    return (<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
    }) );
    print(response.statusCode);
    if (response.statusCode == 200) {
    print(response.body);
      return User(email: "hh@gmail.com",username: "melly");
    } else {
      throw Exception('Failed to retrieve user.');
    }

    });

     


  }


  Future<String> signInWithEmailAndPassword(User user) async{
       final response = await httpClient.post(
      Uri.http(address, '/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      
      body: jsonEncode(<String, dynamic>{
        'password':user.password,
        'email':user.email
       
      }),
    );

    print(response.statusCode);
      print("Nooooooooooo");
        final jwt = jsonDecode(response.body);
         print(jwt);
        final token = jwt['token'];
        SharedPrefUtils.addStringToSF(token);
        
        print(token);
        Map<String, dynamic> payload = Jwt.parseJwt(token);

        print(payload);

    if (response.statusCode == 201) {
      return payload['email'];
    } else {
      throw Exception('Failed to retrieve user.');
    }
  }


 Future<User> getUser(int username) async{
    final response = await httpClient.get('$baseUrl/user/$username',
         headers: await SharedPrefUtils.getStringValuesSF().then((token){
    return (<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
    })
    );
    if (response.statusCode == 200) {
    
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to retrieve user.');
    }
  
  }



  }