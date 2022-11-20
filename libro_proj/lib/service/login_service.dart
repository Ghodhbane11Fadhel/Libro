import 'package:http/http.dart' as http;
import 'package:libro_proj/model/login/login_model.dart';
import 'package:libro_proj/constants.dart';
import 'dart:convert';

class APIService{
  
  
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async{
    final response = await http.post(Uri.parse(URL+'/login'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      final jsone = json.decode(response.body);
      if(jsone['access_token'].isNotEmpty)
      {return LoginResponseModel.fromJson({'access_token':json.decode(response.body)['access_token']} );}
      
    }else{
      print("allo");
      throw Exception(" Failed to Load Data");
    }

  }
}
