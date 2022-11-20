class RegistrationResponseModel{
  String token;

  RegistrationResponseModel(
    {this.token});

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json){
    return RegistrationResponseModel(
      token: json["token"]!= null ? json["token"]: '',
       );
  }
}

class RegistrationRequestModel{
  String username;
  String email;
  String password;

  RegistrationRequestModel({
    this.username,
    this.email,
    this.password
  });

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {'username':username.trim(),'email': email.trim(), 'password': password.trim()};
    return map;
  }  
}