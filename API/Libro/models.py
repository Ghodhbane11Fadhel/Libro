from datetime import datetime
from Libro import db , defaultPI
import json


class User(db.Model):
    id = db.Column(db.Integer, primary_key=True )
    username = db.Column(db.String(20), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    image_file = db.Column(db.Text, nullable=False, default=defaultPI ) 
    password = db.Column(db.String(60), nullable=False)
    posts = db.relationship('Post', backref='author', lazy=True , cascade="all, delete-orphan")
    lists = db.relationship('Book_list', backref='owner', lazy=True , cascade="all, delete-orphan")
    comments = db.relationship('Comment', backref='author', lazy=True , cascade="all, delete-orphan")

    def __repr__(self):
        return json.dumps({"id":self.id,"username":self.username,"email":self.email,"password":self.password})

class Post(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    date = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    content = db.Column(db.Text, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    comments = db.relationship('Comment', backref='of', lazy=True , cascade="all, delete-orphan")


    def __repr__(self):
        return json.dumps({"id":self.id,"title":self.title,"date ":self.date ,"content":self.content,"user_id":self.user_id,"comments":self.comments})


class Book(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(40), nullable=False)
    score = db.Column(db.Float,nullable=True)
    image_file = db.Column(db.String(40), nullable=False, default='default.jpg')
    author = db.Column(db.String(20), nullable=False)
    description = db.Column(db.Text,nullable=True)

    def __repr__(self):
        return json.dumps({"id":self.id,"name":self.name,"score":self.score,"author":self.author,"description":self.description})

class Book_list(db.Model) :
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20), nullable=False)
    books = db.Column(db.Text,nullable=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

    def __repr__(self):
        return json.dumps({"id":self.id,"name":self.name,"user_id":self.user_id})


class Comment(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    content = db.Column(db.Text, nullable=False)
    date = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    post_id = db.Column(db.Integer, db.ForeignKey('post.id'), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

    def __repr__(self):
        return json.dumps({"id":self.id,"content":self.content ,"date":self.date," post_id":self.post_id,"user_id":self.user_id})


class Review (db.Model):
    id = db.Column(db.Integer, primary_key=True)
    score = db.Column(db.Integer, nullable=False)
    book_id = db.Column(db.Integer, db.ForeignKey('book.id'), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

    def __repr__(self):
        return json.dumps({"id":self.id,"score":self.score,"book_id":self.book_id,"user_id":self.user_id})

class Article(db.Model) :
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    date = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    image_file = db.Column(db.String(40), nullable=True)
    content = db.Column(db.Text, nullable=False)

    def __repr__(self):
        return json.dumps({"id":self.id,"title":self.title,"date ":self.date ,"content":self.content})


