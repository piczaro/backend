import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:date_count_down/countdown.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:date_count_down/countdown.dart';
import 'package:like_button/like_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'Contested.dart';

class Points extends StatefulWidget {
  const Points({Key? key}) : super(key: key);

  @override
  State<Points> createState() => _Points();
}

class _Points extends State<Points> {
   List<int> list = [1, 2, 3, 4, 5];
  final List<Map<String, dynamic>> _statistics = [
    {'key': 'Flutter Tutorial', 'value': 90},
    {'key': 'Android Tutorial', 'value': 50, 'border': true},
    {'key': 'Java Tutorial', 'value': 30},
    {'key': 'sdfjsfjk', 'value': 70},
    {'key': 'sdfjsfjk', 'value': 70},
    {'key': 'sdfjsfjk', 'value': 70},
    {'key': 'sdfjsfjk', 'value': 70},
  ];
  int counter = 0;
   String counttime = "Loading";
  @override
  Widget build(BuildContext context) {
    counttime = CountDown().timeLeft(DateTime.parse("2022-07-23 10:00:00"), "Completed", "d :", "h :", "m :", "s", "D ", "H ", "M", "S");
    
    double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
          child: Container(
            width: width,
            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
                children: _statistics.map((Map<String, dynamic> data) {
                return Container(
                  
                  height: height * 0.10,
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(width * 0.20, 0, 0, 0),
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xff1042aa),),
                            child: Text("1",style: TextStyle(color: Colors.white),),
                          ),
                          Row(
                            children: [
                              Container(
                                width: width * 0.50,
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                padding: EdgeInsets.fromLTRB(10, 7, 0, 7),
                                decoration: BoxDecoration(
                                  color: Color(0xffffa300),
                                  borderRadius:  BorderRadius.circular(7.0),
                                ),
                                child: Text("50 cash bonus await",style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                            ],
                          )
                          
                        ],
                      ),
                      Container(
                             height: height * 0.053,
                              margin: EdgeInsets.fromLTRB(width * 0.225, 0, 0, 0),
                            child: VerticalDivider(
                              color: Colors.black,
                              thickness: 5,
                              ),
                          )
                     
                    ],
                  ),

                );
               }).toList(),
              
            ),
          ),
      );
  }
}