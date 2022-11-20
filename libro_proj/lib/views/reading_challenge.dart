// @dart=2.9
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Reading extends StatefulWidget {
  @override
  _ReadingState createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: const Color(0xFFE5ECF5),
          body: SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const  Padding(
                    padding: EdgeInsets.only(
                  top: 20.0,
                )),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Expanded(
                      child: Text('You have read 10/20 books this year')),
                ),
                Container(
                    alignment: FractionalOffset.center,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LinearPercentIndicator(
                              width: 300,
                              lineHeight: 40,
                              percent: 0.7,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.black54,
                            ),
                            const Text('50%')
                          ],
                        ),
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Material(
                        color: const Color(0xFF3F457B),
                        borderRadius: BorderRadius.circular(20),
                        elevation: 10,
                        shadowColor: const Color(0xFF3F457B),
                        child: ButtonTheme(
                          minWidth: 50,
                          height: 40,
                          child: TextButton(
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Text("Edit your goal"),
                            ),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                          ),
                        ))),
                const Padding(padding: EdgeInsets.all(20.0)),
                Container(child: const Text('Books read this year')),
                const SizedBox(
                  height: 20.0,
                  width: 155.0,
                  child: Divider(
                    height: 20.0,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                    child: Image.asset(
                  'images/icons/bookcover.jpg',
                  width: 500.0,
                  height: 500.0,
                )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('total books read'),
                      Text("average page read per day "),
                      Text('favorite genre')
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('45'),
                      Text("50.2"),
                      Text('french')
                    ],
                  )),
                ),
                
              ],
            ),
          )),
    );
  }
}
