import 'package:http/http.dart' as http;
import 'package:libro_proj/model/signin/signin_model.dart';
import 'package:libro_proj/constants.dart';
import 'dart:convert';

class APIService{
  
  
  Future<RegistrationResponseModel> sign(RegistrationRequestModel requestModel) async{
    final response = await http.post(Uri.parse(URL+'/registration'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.body);
      return RegistrationResponseModel.fromJson({'token':response.body});
    }else{
      print("nothing....");
      print(response.statusCode);
      throw Exception(" Failed to Load Data");
    }

  }
}
