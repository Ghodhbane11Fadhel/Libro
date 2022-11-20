import 'dart:ffi';
import 'package:flutter/material.dart';
class search_items extends StatelessWidget {
  String image_cover,author,title;
  String score;

   search_items(this.author,this.image_cover,this.score,this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                shadowColor: const Color(0xff3f457b),
                child: Container(
                  height: 70.0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Image.asset(
                              image_cover,
                              width: 50.0,
                              height: 50.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 3.0),
                                      child: Text("Author : "),
                                    ), 
                                    
                                     Text(author),
                                    ],
                                ),Row(mainAxisAlignment:MainAxisAlignment.spaceBetween ,children:  [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      child: Text("Title : "),
                                    ),
                                  )
                                  ,Text(title)],)
                              ],
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(left: 200.0, top: 1.0),
                            child: Text(score),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          );
      
    
  }
}