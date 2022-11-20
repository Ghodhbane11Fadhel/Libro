import 'package:libro_proj/model/book.dart';


class BookList{

  Map<int, Book> books ={};


  void add(Book book){
    books[books.length] = book;
  }

  int size() => books.length;

}