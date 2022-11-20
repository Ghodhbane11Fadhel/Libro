import 'package:flutter/material.dart';



class CustomTextField extends StatelessWidget {
  String hint;
  IconData icon;
  bool password = false;

  CustomTextField(this.icon, this.hint, this.password);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 1),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 10,
          shadowColor: const Color(0xFF3F457B),
          child: TextField(
            obscureText: password,
            decoration: InputDecoration(
                hintText: hint,
                prefixIcon: Icon(
                  icon,
                  color: const Color(0xFF3F457B),
                ),
                suffixIcon: ElevatedButton( child:Icon(Icons.send,color:  Colors.white), onPressed: (){},style: 
                ElevatedButton.styleFrom(
                  primary: const Color(0xFF3F457B),
    shape: CircleBorder(),)
                ,),
                
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Color(0xFFE5ECF5)),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Color(0xFFE5ECF5)),
                    borderRadius: BorderRadius.circular(20))),
          ),
        ));
  }
}
