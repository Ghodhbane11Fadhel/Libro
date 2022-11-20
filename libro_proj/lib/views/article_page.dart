import 'package:libro_proj/views/widgets/perBar.dart';
import 'package:flutter/material.dart';
import 'package:libro_proj/views/comment section.dart';


class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFE5ECF5),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 10,
                    shadowColor: const Color(0xFFE5ECF5),
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(children: [
                          Row(
                            children: [
                              Container(
                                child: Image.asset(
                                  'images/icons/article.jpg',
                                  width: 200,
                                  height: 200,
                                ),
                              ),
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
                                              "Tom Keanelly",
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
                                              " The greatest writer ever",
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Column(
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 70.0),
                                                  child: Text(" Date: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                Text("21/12/2012",
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                child: const Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, bottom: 10.0),
                                  child: Text(
                                    "Tolstoy is one of those annoying people of genius who performed in the 19th century the ultimate tricks that the rest of us are now stuck with trying to perform imperfectly and on humbler scale. In War and Peace, he successfully depicted the public and national soul as incarnated in a vast array of individuals, and the novel tries, in a compelling way, to define the same unity amongst his characters. In Anna Karenina, by contrast, he deals with one doomed soul on an intimate, psychological level. Thus he is a super-Balzac and a Flaubert at the same time."
                                    ,style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ])),
                  ),
                ),
                const SizedBox(height: 8),
               
                const SizedBox(height: 8),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentPage()));
            },
            child: const Icon(Icons.comment),
            backgroundColor: const Color(0xFF3F457B),
          )),
    );
  }
}

class comments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 10.0, right: 30.0, left: 20), //Kanet 200
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("user"),
            Text("ffffffffffffff"),
          ],
        ));
  }
}
