import 'package:flutter/material.dart';
import 'package:libro_proj/model/signin/signin_model.dart';
import 'package:libro_proj/views/widgets/ProgressHUD.dart';
import 'package:libro_proj/service/signin_service.dart';




class create_account extends StatefulWidget{
  static String id = 'signup';
  @override
  State<StatefulWidget> createState() => _create_accountState();
  
}


class _create_accountState extends State<create_account> {


  bool isApiCallProcess = false;

  RegistrationRequestModel requestModel;
  void initState(){
    super.initState();
    requestModel = new RegistrationRequestModel();
  }

  List<TextEditingController> Controllers = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _globalKey =GlobalKey<FormState>();
  Widget _uiSetup(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        backgroundColor:const  Color(0xffe5ecf5), 
        body: ListView(
          shrinkWrap: true,
            children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Center(
              child: Image.asset(
                'images/icons/logolibro.png',
                width: 100,
                height: 100,
              ),
            )),
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
            const Padding(padding: EdgeInsets.all(30.0)),
                 Form(
                   key: _globalKey,
                   child: Column(
                     children: [
                       Container(
                           child: CustomTextField(
                               Icons.person, " Username", false, Controllers[0])),
                       const Padding(padding: EdgeInsets.all(10.0)),
                       Container(
                           child: CustomTextField(
                               Icons.email, " Adress email", false, Controllers[1])),
                       const Padding(padding: EdgeInsets.all(10.0)),
                       Container(
                           child: CustomTextField(
                               Icons.lock, " Password", true, Controllers[2])),
                       const Padding(padding: EdgeInsets.all(10.0)),
                       Container(
                           child:
                               CustomTextField(Icons.lock, "Confirm password", true, Controllers[3]))
                     ]
                   ),
                 ),
                 const Padding(padding: EdgeInsets.all(10.0)),
                 Container(
                   child: Material(
                       color:const Color(0xff3f457b),
                     borderRadius: BorderRadius.circular(20),
                     elevation: 10,
                     shadowColor: const Color(0xFF3F457B),
                     child: ButtonTheme(
                       minWidth: 50000,
                       height: 400,
                       child: TextButton(
                       onPressed: () {
                         _globalKey.currentState.validate();
                         setState(() {
                                isApiCallProcess = true;
                              });
                         requestModel.username = Controllers[0].text;
                         requestModel.email = Controllers[1].text;
                         requestModel.password = Controllers[2].text;

                        print(requestModel.toJson());
                              APIService apiService = new APIService();
                              apiService.sign(requestModel).then((value) {
                                if (value != null) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                  if (value.token.trim() == "Your account has been created! You are now able to log in") {
                                    final snackBar = SnackBar(
                                        content: Text("sign up Successful"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                    Navigator.of(context).pop();
                                  } else {
                                    final snackBar =
                                        SnackBar(content: Text(value.token));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                  }
                                }
                              });
                              isApiCallProcess = false;
                            

                       },
                       child:  const Padding(padding: EdgeInsets.symmetric(horizontal: 60),child: Text("confirm"),), 
                 
                       style: ButtonStyle(
                           foregroundColor: MaterialStateProperty.all(Colors.white)),
                     ),)
                   ),
                 )
               ]
             )]
           )
          , 
      ),
    );
  }
}







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
