import 'package:comment_box/comment/comment.dart';
import 'package:libro_proj/views/comment%20section.dart';
import 'package:libro_proj/views/widgets/perBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class Book_page extends StatefulWidget {

  @override
  _Book_pageState createState() => _Book_pageState();
}



class _Book_pageState extends State<Book_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:perBar(),
      body: SafeArea(
          child: Scaffold(
        backgroundColor: const Color(0xFFE5ECF5),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 2.0,
          ),
          child: ListView(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 10,
                    shadowColor: const Color(0xff3f457b),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              child: Image.asset(
                                'images/icons/bookcover.jpg',
                                width: 200,
                                height: 200,
                              ),
                              onTap: () {
                                print("jvbcj");
                              },
                            ),
                            const Text("Rate the book"),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RatingBar.builder(
                                initialRating: 1.5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemSize: 20.0,
                                onRatingUpdate: (rating) {},
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 300),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    FittedBox(
                                      child: Text(
                                        "Author:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        "Fiodor dostoivski",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    FittedBox(
                                      child: Text(
                                        "Title:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        "crime and punishment",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Column(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 70.0),
                                            child: Text(" date: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                          Text(
                                              " 21/12/2021",
                                              textAlign: TextAlign.left),
                                              
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 10,
                  shadowColor: const Color(0xff3f457b),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.only(left: 120.0, top: 10.0),
                        child: const Text(
                          "book description ",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      review(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context)=>CommentPage())
          );
        } ,child: const Icon(Icons.add),backgroundColor: const Color(0xFF3F457B),),
      )),
    );
  }
}

class review extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 10.0, right: 30.0, left: 20), //Kanet 200
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            
            Text(
                "Raskolnikov, a destitute and desperate former student, wanders through the slums of St Petersburg and commits a random murder without remorse or regret. He imagines himself to be a great man, a Napoleon: acting for a higher purpose beyond conventional moral law. But as he embarks on a dangerous game of cat and mouse with a suspicious police investigator, Raskolnikov is pursued by the growing voice of his conscience and finds the noose of his own guilt tightening around his neck. Only Sonya, a downtrodden sex worker, can offer the chance of redemption.")
          ],
        ));
  }
}