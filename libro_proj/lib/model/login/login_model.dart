class LoginResponseModel{
  final String access_token;
  final String error;

  LoginResponseModel({
    this.access_token,
    this.error
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json){
    return LoginResponseModel(
      access_token: json["access_token"]!= null ? json["access_token"]: '',
      error: json["error"]
       );
  }
}


class LoginRequestModel{
  String username;
  String password;

  LoginRequestModel({
    this.username,
    this.password
  });

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {'username': username.trim(), 'password': password.trim()};
    return map;
  }
}