import 'package:flutter/material.dart';
import 'package:libro_proj/constants.dart';
import 'package:libro_proj/model/user_model.dart';
import 'package:libro_proj/service/profile_service.dart';



class ProfileUser extends StatefulWidget{
  User user;
  ProfileUser(this.user);
  @override
  State<StatefulWidget> createState(){
    return _ProfileUserState(user);
    }
}


class _ProfileUserState extends State<ProfileUser> {
  User user;


  _ProfileUserState(this.user);


  @override
  void initState(){
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Material(
        elevation: 10,
        shadowColor: kSecondColor,
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ClipOval(
                    child: Image(
                      image: AssetImage('images/icons/bookcover.jpg'),
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      )
                  )
                ],
              )
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.06),
                child: Column(
                  children: [
                    SizedBox(
                                width: MediaQuery.of(context).size.width*.5,
                                child: Text(
                                    user.username,
                                    style: TextStyle(
                                      
                                      color: kSecondColor,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato'
                                      ),
                                  )
                              ),
                    SizedBox(
                                width: MediaQuery.of(context).size.width*.5,
                                child: Text(
                                    'Number of Books: ' + user.nb_books.toString(),
                                    style: TextStyle(
                                      
                                      color: kSecondColor,
                                      fontSize: 16,
                                      fontFamily: 'Lato'
                                      ),
                                  )
                              ),
                    SizedBox(
                                width: MediaQuery.of(context).size.width*.5,
                                child: Text(
                                    'Lv.' + user.level.toString(),
                                    style: TextStyle(
                                      
                                      color: kSecondColor,
                                      fontSize: 16,
                                      fontFamily: 'Lato'
                                      ),
                                  )
                              ),

                       Container(
                         padding: EdgeInsets.only(top:20),
                         child: LinearProgressIndicator(
                         value: user.exp/100 ,
                         semanticsLabel: 'Linear',
                         valueColor:new AlwaysStoppedAnimation<Color>(kSecondColor),
                         backgroundColor: kMainColor,
                                             )
                       )
                  ],
                  ),
              )
            )
          ],
        )
      ),
      );
  }

}