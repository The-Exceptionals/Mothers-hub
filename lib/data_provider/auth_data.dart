import 'package:mothers_hub/mh.dart';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthData extends HttpData {
  auth() async {
    final storage = new FlutterSecureStorage();
    var jwt = await storage.read(key: "jwt");

    var res = await this.makeGetRequest('${this.baseApi}profile/getData',
        auth: true, token: jwt);
    var decode = jsonDecode(res);
    if (decode.containsKey('statusCode')) {
      if (decode["statusCode"] != 200) {
        print("ERROR");
        return false;
      }
    }
    return decode;
  }

  login(data) async {
    var res = await this.makePostRequest("${this.baseApi}user/login", data);

    var decode = jsonDecode(res);
    print(decode);
    if (decode.containsKey('statusCode')) {
      if (decode["statusCode"] != 200) {
        print("ERROR");
        return decode;
      }
    }
    return decode;
  }

  register(data) async {
    var res = await this.makePostRequest("${this.baseApi}user/register", data);

    var decode = jsonDecode(res);
    if (decode.containsKey('statusCode')) {
      if (decode["statusCode"] != 200) {
        print("ERROR");
        //TODO HANDLE ERROR
        return decode;
      }
    }
    return decode;
  }
}
