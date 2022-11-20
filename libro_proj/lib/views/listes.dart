import 'package:flutter/material.dart';
import 'package:libro_proj/constants.dart';
import 'package:libro_proj/model/book_list.dart';
import 'package:libro_proj/model/book.dart';



//TODO: Implementing Reading info from service.

class ListPage extends StatefulWidget{
  static String id = 'liste';
  String title;

  @override
  State<StatefulWidget> createState() => _listesState();
}

class _listesState extends State<ListPage>{

  BookList booklist;
  Map<int, Widget> bookWidgets;

  @override
    void initState() {

      //TODO: reading books from Sever.

      booklist = BookList();
      booklist.add(Book(1, 'Crime and punishement', 'Foyodor Doestovsky', 5));
      booklist.add(Book(1, 'Brothers Karamasov', 'Foyodor Doestovsky', 5));
      booklist.add(Book(1, 'War and Peace', 'Foyodor Doestovsky', 5));
      print(booklist.books);


      bookWidgets = {};
      for(int i = 0; i<booklist.size(); i++){
        bookWidgets[i] =
          NotificationListener(
            onNotification: (notification){
              try{
              setState(() {
              booklist.books.remove(notification.index);
              bookWidgets.remove(notification.index);
              });

              return true;
              }catch(e){
                return true;
              }
              },
            child: book_item(i ,booklist.books[i])
          )
          ;
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainColor,
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView
          (
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "My Best Books List: ",
                      style: TextStyle(
                        fontSize: 32,
                        color: kSecondColor
                      ),
                      )
                  ),
                  
                ]
              ),
              ListView(
                shrinkWrap: true,
                children: bookWidgets.values.toList(growable: true)
              ),
                
          ]
          ),
        ),
      );
  }

}


class book_item extends StatelessWidget{
  int index;
  Book book;

  book_item(this.index, this.book);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
         InkWell(
           child: Material(
             borderRadius: BorderRadius.circular(10),
             elevation: 10,
             shadowColor: kSecondColor,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Image(
                       image: AssetImage('images/icons/bookcover.jpg'), //TODO: Change this image
                       height: 80,
                       width: 80,
                       ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Align(
                       alignment: Alignment.centerLeft,
                       child: Container(
                                 child: Text(
                                       book.title,
                                       textAlign: TextAlign.left,
                                       style: TextStyle(
                                         color: kSecondColor,
                                         fontSize: 26,
                                         fontWeight: FontWeight.bold
                                         ),
                                     )
                                 )
                     )
                             ,
                   Align(
                     alignment: Alignment.centerLeft,
                     child: Container(
                       child: Text(
                                   book.author,
                                   textAlign: TextAlign.left,
                                   style: TextStyle(
                                                   fontSize: 18,
                                                   color: Colors.grey.shade500 
                                                   )
                                 )
                              )
                   ),
                   Container(
                     child: Text(
                       book.sccore.toString()

                     ),
                   ),
                   Container(
                     child: Text('400.000 rating'), //TODO: Change This Rating text
                     )
                   ]
                 ),
                 Column(
                   
                   children: [
                    Align(
                      child: Material(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        elevation: 5,
                        child: Container(
                          child: InkWell(
                            onTap: (){
                              DeleteNotification del = DeleteNotification(index);
                              del.dispatch(
                                context
                              );
                            },
                            child: Icon(Icons.remove),
                            )
                        )
                      )
                    )
                   ],
                 )
               ],
             )
           )
         )
        ],
      ),
    );
  }


}

class DeleteNotification extends Notification{
  int index;
  DeleteNotification(this.index);

}