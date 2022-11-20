
class Article{

  Article(this._id, this._body, this._title);


  int _id;
  String _title;
  String _body;
  String _image;

  int getId() => _id;
  String getTitle() => _title;
  String getBody() => _body;
  String getImage() => _image;
}