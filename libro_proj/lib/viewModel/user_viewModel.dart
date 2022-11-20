import 'package:libro_proj/service/profile_service.dart';
import 'package:libro_proj/model/user_model.dart';

class ProfileViewModel{
  UserViewModel user;

  Future<void> fetchUser() async{
    final apiResult = await ProfileService().fetchUserAPI(user.user);
  }
  
}

class UserViewModel {
  final User user;

  UserViewModel(this.user);
}