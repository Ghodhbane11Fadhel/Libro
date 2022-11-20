import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:libro_proj/constants.dart';
import 'package:libro_proj/model/screenArguments.dart';
import 'package:libro_proj/service/login_service.dart';
import 'package:libro_proj/views/widgets/ProgressHUD.dart';
import 'package:libro_proj/model/login/login_model.dart';

class LoginScreen extends StatefulWidget{
  static String id = 'LoginScreen';
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
  
}


class _LoginScreenState extends State<LoginScreen>{
  
  bool isApiCallProcess = false;
  LoginRequestModel requestModel;
  void initState(){
    super.initState();
    requestModel = new LoginRequestModel();
  }

    List<TextEditingController> Controllers = [
      TextEditingController(),
      TextEditingController(),
  ];

   Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _globalKey =GlobalKey<FormState>();


  @override
  Widget _uiSetup(BuildContext context) {
    return new Scaffold(
      key:scaffoldKey,
      backgroundColor: kMainColor,
      body: new ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Container(
              height: MediaQuery.of(context).size.height* 0.2,
              child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      width: 100,
                      height: 100,
                      image: AssetImage('images/icons/logolibro.png')
                    ),
                    
                    Positioned(
                      bottom: 0,
                      child: Text(
                      "Libro",
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 25
                      ),
                    ),
                    ),
                  ],
              )
            )
          ),



          
        Form(
          key: _globalKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 60),
                padding: EdgeInsets.symmetric(vertical: 30),
                child: CustomTextField(Icons.person, "Enter Username", false, Controllers[0])
              ),
                    Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: CustomTextField(Icons.lock, "Enter Password", true, Controllers[1])
              ),
            ]
          )
        ),



          Container(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 30),
            child: Material(
              color: kSecondColor,
              borderRadius: BorderRadius.circular(20),
              elevation: 10,
              shadowColor: kSecondColor,
              child: TextButton(
                onPressed: (){
            _globalKey.currentState.validate();
            setState(() {
              isApiCallProcess = true;
            });
            requestModel.username = Controllers[0].text;
            requestModel.password = Controllers[1].text;
            print(requestModel.toJson());
            APIService apiService = new APIService();

            apiService.login(requestModel).then((value){
              if (value.access_token.isNotEmpty){
                Navigator.pushNamed(context, 'Home', arguments: ScreenArg(value.access_token));
                isApiCallProcess = false;
                
              }
              });
              final snackBar = SnackBar(content: Text("Invalid Username or password"));
              scaffoldKey.currentState.showSnackBar(snackBar);             

              isApiCallProcess = false;

                },
                child: Text("Login"),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
            )
           )
          ),

          Container(
            alignment: Alignment.center,
            child: new TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'signup');
          },
          child: new Text("Sign up", style: TextStyle(fontSize: 18,color: kSecondColor,),),
        )
          )
          ],
      ),
    );
  }

}

//TODO: Checking Error and Red flags when there is one. DONE. 



class CustomTextField extends StatelessWidget {
  String hint;
  IconData icon;
  bool password = false;
  TextEditingController controller;

  CustomTextField(this.icon, this.hint, this.password, this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 10,
          shadowColor: const Color(0xFF3F457B),
          child: TextFormField(
            controller: controller,
            validator: (value){
              if(value.isEmpty){
                return 'Value is Empty';
              }
            },
            obscureText: password,
            decoration: InputDecoration(
                hintText: hint,
                prefixIcon: Icon(
                  icon,
                  color: const Color(0xFF3F457B),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Color(0xFFE5ECF5)),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Color(0xFFE5ECF5)),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Color(0xFFE5ECF5)),
                    borderRadius: BorderRadius.circular(20)),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Colors.red),
                    borderRadius: BorderRadius.circular(20))
                    ),
                
          ),
        ));
  }
}
