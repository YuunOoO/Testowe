import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../Activity/widgets.dart';

final data = TextEditingController(); // data controler
late int number;

class shownumber extends StatefulWidget {
  @override
  _shownumber createState() => _shownumber();
  shownumber(int nr) {
    number = nr;
  }
}

class _shownumber extends State<shownumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: new EdgeInsets.all(20.0),
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xffC04848),
              Color(0xff480048),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(111, 72, 0, 72),
                      ),
                      child: Column(
                        children: <Widget>[Text(number.toString())],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
