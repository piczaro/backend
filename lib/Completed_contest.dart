import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:date_count_down/countdown.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_button/like_button.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'Contested.dart';

class Completed_contest extends StatefulWidget {
  const Completed_contest({Key? key}) : super(key: key);

  @override
  State<Completed_contest> createState() => _Completed_contest();
}

class _Completed_contest extends State<Completed_contest> {
   List<int> list = [1, 2, 3, 4, 5];
  final List<Map<String, dynamic>> _statistics = [
    {'key': 'Flutter Tutorial', 'value': 90},
    {'key': 'Android Tutorial', 'value': 50, 'border': true},
    {'key': 'Java Tutorial', 'value': 30},
    {'key': 'sdfjsfjk', 'value': 70}
  ];
  int counter = 0;
    
  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
          child: Container(
           
           

            child: GestureDetector(
               onTap: (){
                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) =>  const Contest_pay()),
                    //   );
                    },
              child: Column(
                  children: _statistics.map((Map<String, dynamic> data) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(5, 7, 7, 5),
                    
                      decoration:  const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    child: Column(
                      
                      children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                    child: const Text("Contest Name",style:  TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                    child: const Text("Contest Name",style:  TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontFamily: "SFPRO semibold",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(10, 5, 30, 0),
                                      child: 
                                      Column(
                                      children: const [
                                        Icon(Icons.star,color: Color.fromARGB(255, 228, 182, 58),size: 30,),
                                         
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                    child: const Text("Completed",style:  TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 30, 163, 13),
                                      fontFamily: "SFPRO semibold",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(0, 5, 12, 0),
                                    child: const Text("winner",style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "SFPRO semibold",
                                        color: Color.fromARGB(255, 8, 133, 12)
                                        ),
                                      ),
                                  ),
                                ],
                               ),
                               Container(
                             margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                             child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    LikeButton(
                                      size: 30,
                                      circleColor:
                                          const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                                      bubblesColor: const BubblesColor(
                                        dotPrimaryColor: Color(0xff33b5e5),
                                        dotSecondaryColor: Color(0xff0099cc),
                                      ),
                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          Icons.thumb_up,
                                          color: isLiked ? Color.fromARGB(255, 2, 95, 182) : Colors.grey,
                                          size: 30,
                                        );
                                      },
                                      likeCount: 665,
                                      
                                    ),
                                    LikeButton(
                                      size: 30,
                                      circleColor:
                                          const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                                      bubblesColor: const BubblesColor(
                                        dotPrimaryColor: Color(0xff33b5e5),
                                        dotSecondaryColor: Color(0xff0099cc),
                                      ),
                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          Icons.emoji_emotions,
                                          color: isLiked ? Color.fromARGB(255, 2, 95, 182) : Colors.grey,
                                          size: 30,
                                        );
                                      },
                                      likeCount: 665,
                                      
                                    ),
                                    LikeButton(
                                      size: 30,
                                      circleColor:
                                          const CircleColor(start: Color.fromARGB(255, 226, 91, 82), end: Color.fromARGB(255, 226, 91, 82)),
                                      bubblesColor: const BubblesColor(
                                        dotPrimaryColor: Color.fromARGB(255, 226, 91, 82),
                                        dotSecondaryColor: Color.fromARGB(255, 226, 91, 82),
                                      ),
                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          Icons.favorite,
                                          color: isLiked ? Color.fromARGB(255, 226, 91, 82) : Colors.grey,
                                          size: 30,
                                        );
                                      },
                                      likeCount: 665,
                                      
                                    ),
                                   
                                    
                                    ]
                                  ),
                                   const Text("Points : 1000",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 92, 91, 91),
                                        fontSize: 15,
                                        fontFamily: 'SFPRO regular'
                                      ), 
                                    )
                               ],
                             ),
                           ),
                            ],
                          ),
                         
                          
                      ]),
                  );
                 }).toList(),
                
              ),
            ),
          ),
      );
  }
}