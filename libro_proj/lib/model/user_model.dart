class User {
  String email;
  String username = 'Wajdi Hammami';
  String image;
  String access_token;
  int nb_books = 16;
  int level = 22;
  int exp = 20;

  User({
    this.nb_books,
    this.level,
    this.exp,
    this.email,
    this.username,
    this.image,
    this.access_token
    });

   void fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    image = json['image_file']!=null? json['image_file']: '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.access_token.trim();
    return data;
  }
}