import 'package:flutter/material.dart';
import 'package:libro_proj/model/screenArguments.dart';
import 'package:libro_proj/views/profile.dart';
import 'package:libro_proj/views/reading_challenge.dart';
import 'package:libro_proj/views/widgets/perBar.dart';
import 'package:flutter/material.dart';
import 'package:libro_proj/views/listes.dart';
import 'package:libro_proj/views/discover.dart';
import 'package:libro_proj/views/journal.dart';
import 'package:libro_proj/views/article_page.dart';
import 'package:libro_proj/model/user_model.dart';
import 'package:libro_proj/service/profile_service.dart';
import 'package:libro_proj/views/comment section.dart';
import 'package:libro_proj/views/blog.dart';

class Home extends StatefulWidget {
  User user;
  static String id = 'Home';
  BuildContext context;
  String token;

  Home(this.context);

  @override
  _HomeState createState(){
    final args = ModalRoute.of(context).settings.arguments as ScreenArg;
    this.token = args.token;
    user = User(
            access_token: token,
            username: 'Loading...',
            level:00,
            exp:00,
            nb_books: 00,

            );
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  int _currentIndex = 2;
  List<Widget> _pages;

  @override
  void initState() {

    ProfileService().fetchUserAPI(widget.user).then((result){
      setState(() {
        
      });
    });


    _pages = [
    Journal(),
    Discover(),
    Profile(widget.user),
    Reading(),
    BlogPage()  
  ]; 
    super.initState();
  }

  void OnTappedBar(int index){
    setState(() {
     if(_currentIndex != index){
          _currentIndex  = index;
      }
        });
  }



  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:(){},
      child: Scaffold(
        appBar: perBar(), //app bar
        body: _pages[_currentIndex],
        backgroundColor: const Color(0xffe5ecf5),
        bottomNavigationBar: BottomNavigationBar( // Navigation Bar
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Color(0xff3f457b),
              icon: Icon(Icons.menu_book_rounded),
              label: 'Journal',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff3f457b),
              icon: Icon(Icons.assistant_navigation),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff3f457b),
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff3f457b),
              icon: Icon(Icons.watch_later_outlined),
              label: 'Reading challenge ',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff3f457b),
              icon: Icon(Icons.messenger_outline_rounded),
              label: 'Blog',
            ),
          ],
          onTap: OnTappedBar,
        ),
      ),
    );
  }
}