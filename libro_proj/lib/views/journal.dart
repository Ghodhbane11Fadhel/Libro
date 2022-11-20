import 'package:flutter/material.dart';
import 'package:libro_proj/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:libro_proj/views/widgets/perBar.dart';
import 'package:libro_proj/model/article.dart';
import 'package:libro_proj/views/article_page.dart';


class Journal extends StatefulWidget{
  static String id = 'Journal';
  @override
  State<StatefulWidget> createState() {
    return _JournalState();
  }

}


class _JournalState extends State<Journal>{
  Article news1 = Article(1, "Author", "Title");

  List<Article> news = <Article>[];
  List<Article_Widget> newsA = <Article_Widget>[];

  void initState(){

    news.add(news1);
    news.add(news1);
    news.add(news1);
    news.add(news1);
    news.add(news1);
    news.add(news1);
    news.add(news1);
    
    for (var i = 0; i < news.length; i++) {
      newsA.add(new Article_Widget(news[i].getTitle(), news[i].getBody()));
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xffe5ecf5),
          body: ListView(
            children: newsA,
          )
      )
    );
  }
}


class Article_Widget extends StatelessWidget{
  final String Title;
  final String Author;

  Article_Widget(this.Title, this.Author);

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.001, horizontal: MediaQuery.of(context).size.width*0.05),
                child:InkWell(
                  onTap: (){
                    Navigator.push(context, 
                    MaterialPageRoute(
                      builder: (context)=>ArticlePage()
                    )
                    );
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    shadowColor: kSecondColor,
                    elevation: 10,
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.only(right: 15),
                        child: Image(
                          image: AssetImage('images/icons/bookcover.jpg'),
                          height: 80,
                          width: 80,
                              )
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top:30),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width*0.6,
                              child: Text(
                                  this.Title,
                                  style: TextStyle(
                                    
                                    color: kSecondColor,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold
                                    ),
                                )
                            )
                          ),

                          Container(
                            padding: EdgeInsets.only(top: 30, bottom: 20),
                            child: Text(
                              this.Author,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade500 
                              )
                            )
                          ),
                        ],
                      )
                    ],),
                    
                    ),
                    )
                );
  }

}