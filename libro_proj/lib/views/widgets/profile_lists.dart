import 'package:flutter/material.dart';
import 'package:libro_proj/constants.dart';
import 'package:libro_proj/views/listes.dart';



class ProfileLists extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ProfileLists();

}



class _ProfileLists extends State<ProfileLists>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Material(
        elevation: 10,
        shadowColor: kSecondColor,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Text(
              "- Your Track -",
              style: TextStyle(
                                      
                color: kSecondColor,
                fontSize: 26,
                fontFamily: 'Pacifico'
                ),
                
              ),
            Row(
              children: [
                ListInkWell('Currently Reading', 'images/icons/karamasov.jpg', 18),
                ListInkWell('Want to Read','images/icons/bookcover.jpg', 28),
                ListInkWell('Already Read', 'images/icons/karamasov.jpg', 19)
              ],
            )
          ]
        ),
      ),
    );
  }

}


class ListInkWell extends StatelessWidget{

  String _title ;
  String _image;
  int N;

  ListInkWell(this._title, this._image, this.N);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal:10, vertical: 20 ),
      child: Material(
        elevation: 20,
        shadowColor: kSecondColor,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>ListPage()
                )
                );
            },
            child: Column(
              children: [
                Text(
                  _title,
                  style: TextStyle(
                                        
                                        color: kSecondColor,
                                        fontSize: 15,
                                        fontFamily: 'Pacifico'
                                        ),
                  
                  ),
                Image(
                  image: AssetImage(_image),
                  width: MediaQuery.of(context).size.width*0.26,
                  height: 150,
                ),
                Text(
                  "Count: " + N.toString(),
                  style: TextStyle(
                                        
                                        color: kSecondColor,
                                        fontSize: 15,
                                        fontFamily: 'Pacifico'
                                        ),
                  
                  ),
              
              ]
            )
            ,
          ),
              )
        ),
    );
  }

}