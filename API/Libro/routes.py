from flask import request , jsonify
from Libro import app , db , bcrypt , jwtkey
from Libro.models import *
from Libro.fonctions import * 


######################## Login ##########################
@app.route('/login' , methods=["POST"])
def login():
	username=request.form.get("username")
	password=request.form.get("password")
	if username==None or password==None :
		return "Bad Request" , 400
	user=User.query.filter_by(username=username).first()
	if user and bcrypt.check_password_hash(user.password, password):
		return jsonify({"access_token":craft_JWT(user,jwtkey)})
	return "invalid username or password"


######################## Login ##########################
######################## Registration ##########################

@app.route('/registration', methods=["POST"])
def registration():
	username=request.form.get("username")
	password=request.form.get("password")
	email=request.form.get("email")
	if username==None or password==None or email==None :
		return "Bad Request" , 400
	if not valid_username(username) :
		return "username should only contain alphanumeric characters or underscores and a length between 4 and 20" , 400
	if not valid_password(password) :
		return "password should be minimum 8 characters" , 400
	if not valid_email(email) :
		return "email is invalid"  , 400
	user=User.query.filter_by(username=username).first()
	if user :
		return "username already taken" , 400
	user=User.query.filter_by(email=email).first()
	if user :
		return "email already taken", 400
	hashed_password = bcrypt.generate_password_hash(password).decode('utf-8')
	db.session.add(User(username=username,password=hashed_password,email=email))
	db.session.commit()
	new_user = User.query.filter_by(username=username).first()
	db.session.add(Book_list(name="To Read",books="",user_id=new_user.id))
	db.session.add(Book_list(name="Reading",books="",user_id=new_user.id))
	db.session.add(Book_list(name="Read",books="",user_id=new_user.id))
	db.session.commit()
	return 'Your account has been created! You are now able to log in'

######################## Registration ##########################
######################## profile ##########################
@app.route("/profile",methods=["GET"]) 
def profile():
	access_token=request.args.get("access_token")
	image=request.args.get("image")
	user_id=check_JWT(access_token,jwtkey)
	if user_id == None :
		return "Invalid Token" , 400
	else :
		user=User.query.filter_by(id=user_id).first()
		payload = {"username":user.username,"email":user.email}
		if image != None :
			payload["image_file"]=user.image_file
		return jsonify(payload)
######################## profile ##########################
######################## lists ##########################

@app.route("/profile/lists",methods=["GET"])
def lists():

	access_token=request.args.get("access_token")
	user_id=check_JWT(access_token,jwtkey)
	if user_id == None :
		return "Invalid Token" , 400
	return jsonify(getlist(user_id))
#add to list
@app.route("/lists/add",methods=["POST"])
def 
	access_token=request.form.get("access_token")
	user_id=check_JWT(access_token,jwtkey)
	if user_id == None :
		return "Invalid Token" , 400
	book_id=request.form.get("book_id")
	list_id=request.form.get("list_id")
	if book_id == None or list_id == None :
		return "Bad Request" , 400
	

######################## lists ##########################
######################## post ##########################

@app.route("/post",methods=["GET","POST"] )
def post():

	access_token=request.form.get("access_token")
	user_id=check_JWT(access_token,jwtkey)
	if user_id == None :
		access_token=request.args.get("access_token")
		user_id=check_JWT(access_token,jwtkey)		
		if user_id == None :
			return "Invalid Token" , 400
	
#ADD A POST

	if request.method == 'POST':
		content=request.form.get("content")
		title=request.form.get("title")
		db.session.add(Post(title=title,content=content,user_id=user_id))
		db.session.commit()
		return "post successfully added"
	post_id=request.args.get("id")
	print(post_id)

#GET list of all posts 

	if request.method == 'GET' and post_id==None :
		posts=Post.query.order_by(Post.date).all()	
		payload=[]
		for p in posts :
			payload.append({"id":p.id,"title":p.title,"content":p.content,"date":p.date,"author":p.author.username})
		return jsonify(payload)

#GET POST BY ID 

	if request.method == 'GET' and post_id!=None :
		post=Post.query.filter_by(id=post_id).first()
		comments=Comment.query.filter_by(post_id=post_id).all()
		payload=[]
		for comment in comments :
			 payload.append({"id":comment.id,"content":comment.content,"date":comment.date,"author":comment.author.username})
		return jsonify({"id":post.id,"title":post.title,"content":post.content,"date":post.date,"author":post.author.username,"comments":payload})

#Delete post 

@app.route("/post/delete",methods=["POST"] )
def post_delete() :

	access_token=request.form.get("access_token")
	user_id=check_JWT(access_token,jwtkey)
	if user_id == None :
		return "Invalid Token" , 400 
	post_id=request.form.get("id")
	post=Post.query.filter_by(id=post_id).first()
	if post==None :
		return "Bad Request" , 400
	if user_id != post.author.id :
		return "Forbidden" , 403
	db.session.delete(post)
	db.session.commit()
	return "post deleted successfully"

######################## post ##########################

#ADD comment

@app.route("/comment",methods=["POST"])
def comment() :
	access_token=request.form.get("access_token")
	user_id=check_JWT(access_token,jwtkey)
	if user_id == None :
		return "Invalid Token" , 400	
	post_id=request.form.get("post_id")
	content=request.form.get("content")
	if post_id==None or content==None :
		return "Bad Request" , 400
	post=Post.query.filter_by(id=post_id).first()
	if post==None :
		return "Post does not exist" , 400
	db.session.add(Comment(content=content,post_id=post_id,user_id=user_id))
	db.session.commit()
	return "comment  successfully added"
#delete comment
@app.route("/comment/delete",methods=["POST"])
def comment_delete() :

	access_token=request.form.get("access_token")
	user_id=check_JWT(access_token,jwtkey)
	if user_id == None :
		return "Invalid Token" , 400 
	comment_id=request.form.get("comment_id")
	comment=Comment.query.filter_by(id=comment_id).first()
	if comment == None :
		return "Bad Request" , 400
	if user_id != comment.author.id :
		return "Forbidden" , 403
	db.session.delete(comment)
	db.session.commit()	
	return "comment deleted successfully"








def getlist(user_id) :
	lists=Book_list.query.filter_by(user_id=user_id).all()
	payload=[]
	for book_list in lists :
		if book_list.books == '' :
			payload.append({'id':book_list.id,'name':book_list.name,"owner":book_list.user_id,"books":''})
		else :	 
			payload.append({'id':book_list.id,'name':book_list.name,"owner":book_list.user_id,"books":[ Book.query.filter_by(id=int(i)) for i in book_list.books.split("|") ]})
	return payload		