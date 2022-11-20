import 'package:flutter/material.dart';
import 'package:libro_proj/model/screenArguments.dart';
import 'package:libro_proj/model/user_model.dart';
import 'package:libro_proj/views/widgets/profile_lists.dart';
import 'package:libro_proj/views/widgets/profile_reviews.dart';
import 'package:libro_proj/views/widgets/profile_user.dart';


class Profile extends StatefulWidget{
  User user;
  static final id = 'Profile';
  Profile(this.user);
  @override
  State<StatefulWidget> createState(){
    return _ProfileState();
  }

}

class _ProfileState extends State<Profile>{

  _ProfileState();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          ProfileUser(widget.user),
          ProfileLists(),
          ProfileReviews()
        ],
      ),
    );
  }

}


