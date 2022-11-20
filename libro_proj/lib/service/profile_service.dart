import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:libro_proj/model/user_model.dart';
import 'package:libro_proj/constants.dart';

class ProfileService{
  Future<void> fetchUserAPI(User user) async{
    print(user.username);
    print(user.access_token);
    final uri = Uri.http(URL_GET, "/profile", user.toJson());
    final response =await http.get(uri);

    if(response.statusCode != 400){
      user.fromJson(json.decode(response.body));
      print("WORKED OUT:" + user.username);
    }else{
      print(response.statusCode);
      print('Something is off in ProfileService');
    }
  }
  
}