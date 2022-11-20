import 'package:flutter/material.dart';
import 'package:libro_proj/constants.dart';
import 'package:libro_proj/views/book.dart';

class Discover extends StatefulWidget{
  static final id = 'Discover';
  @override
  State<StatefulWidget> createState() {
    return _DiscoverState();
  }

}

class _DiscoverState extends State<Discover>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      child: Material(
        color: kMainColor,
        elevation: 10,
        shadowColor: kSecondColor,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Scaffold(
                backgroundColor: kMainColor,
                body: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Discover New Books",
                        style: TextStyle(
                                      
                                      color: kSecondColor,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Pacifico'
                                      ),
                        )
                    ),
                    ListView(
                      padding: EdgeInsets.only(top: 30),
                      shrinkWrap: true,
                      children: [
                    Discovery(),
                    Discovery()
                      ],
                    )

                  ],
                )
            )
        )
      )
    );
  }

}

//TODO: add InkWell to open Books


class Discovery extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        shadowColor: kSecondColor,
        child: Container(
          padding: EdgeInsets.all(10),
          child: InkWell(
            onTap: (){
              Navigator.push(context,
               MaterialPageRoute(
                 builder: (context)=>Book_page()
                 )
               );
            },
            child:Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage('images/icons/bookcover.jpg'),
                        height: 120,
                        width: 100,
                        fit: BoxFit.contain,
                        ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                                padding: EdgeInsets.only(top:0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width*.5,
                                  child: Text(
                                      'Crime and Punishement',
                                      style: TextStyle(
                                        
                                        color: kSecondColor,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold
                                        ),
                                    )
                                )
                              ),
                      Padding(
                                padding: EdgeInsets.only(top:10),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width*.5,
                                  child: Text(
                                      'Best Book Ever',
                                      style: TextStyle(
                                        
                                        color: Colors.grey,
                                        fontSize: 22,
                                        ),
                                    )
                                )
                              )
                    ],
                  )
                ],
              )
            )
          ),
        ),
      )
    );
  }

}