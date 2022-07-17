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

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _Posts();
}

class _Posts extends State<Posts> {
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
           

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
                children: _statistics.map((Map<String, dynamic> data) {
                return Container(
                  
                  
                  
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          
                          Container(
                            width: width * 0.30,
                            child: Image.network('https://via.placeholder.com/100')
                          ),
                          Container(
                            width: width * 0.30,
                            child: Image.network('https://via.placeholder.com/100')
                          ),
                          Container(
                            width: width * 0.30,
                            child: Image.network('https://via.placeholder.com/100')
                          ),
                        ]
                      ),
                    ],
                  ),

                );
               }).toList(),
              
            ),
          ),
      );
  }
}