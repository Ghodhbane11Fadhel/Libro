import 'package:flutter/material.dart';
import 'package:libro_proj/constants.dart';



class ProfileReviews extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ProfileReviewsState();

}
//TODO: User Class and Lists When Clicked on


class _ProfileReviewsState extends State<ProfileReviews>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Material(
        elevation: 10,
        shadowColor: kSecondColor,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "- Your Reviews -",
                   style: TextStyle(
                                        
                                        color: kSecondColor,
                                        fontSize: 26,
                                        fontFamily: 'Pacifico'
                                        ),
                    )
              ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      ReviewItem("The Karamasov Brothers", "Lorem ipsum dolor sit amet, his no alia habemus facilisi, eos nisl meis id. Mea ei unum eloquentiam. Has libris tacimates temporibus an, nam facete utroque vocibus et. Pro dicat suscipiantur id, in mutat ponderum suavitate pro, posse fabulas principes sit cu. Veniam nostro impetus in est, in volumus vivendum sed. Pro omnis inimicus suavitate ex, pericula corrumpit disputationi ex pro."),
                      ReviewItem("The Karamasov Brothers", "Comment for Testing"),
                      ReviewItem("The Karamasov Brothers", "Lorem ipsum dolor sit amet, his no alia habemus facilisi, eos nisl meis id. Mea ei unum eloquentiam. Has libris tacimates temporibus an, nam facete utroque vocibus et. Pro dicat suscipiantur id, in mutat ponderum suavitate pro, posse fabulas principes sit cu. Veniam nostro impetus in est, in volumus vivendum sed. Pro omnis inimicus suavitate ex, pericula corrumpit disputationi ex pro."),
                      ReviewItem("The Karamasov Brothers", "Comment for Testing"),
                       ReviewItem("The Karamasov Brothers", "Comment for Testing"*10),
                      ReviewItem("The Karamasov Brothers", "Comment for Testing"),
                      ReviewItem("The Karamasov Brothers", "Comment for Testing"),
                      ReviewItem("The Karamasov Brothers", "Comment for Testing"),
                       ReviewItem("The Karamasov Brothers", "Comment for Testing"*10),
                      ReviewItem("The Karamasov Brothers", "Comment for Testing"),
                      ReviewItem("The Karamasov Brothers", "Comment for Testing"),
                      ReviewItem("The Karamasov Brothers", "Comment for Testing"),
                       ReviewItem("The Karamasov Brothers", "Comment for Testing"*10),
                      ReviewItem("The Karamasov Brothers", "Comment for Testing"),
                      ReviewItem("The Karamasov Brothers", "Comment for Testing"),
                      ReviewItem("The Karamasov Brothers", "Comment for Testing"),
                    ],
                  )
                )
            ],
          ),
          ),
      ),
    );
  }

}



class ReviewItem extends StatelessWidget{
  String book_name;
  String review_text;

  ReviewItem(this.book_name, this.review_text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book_name,
             style: TextStyle(
                                          
                                          color: kSecondColor,
                                          fontSize: 18,
                                          fontFamily: 'lato',
                                          fontWeight: FontWeight.bold
                                          ),                
          ),
          Text(
            review_text,
             style: TextStyle(
                                          
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'lato'
                                          ),                
          ),
          Divider(color: Colors.black,)
        ]
      ),
    );
  }

}