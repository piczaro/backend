import 'package:date_count_down/countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Contest.dart';
import 'Home.dart';
import 'Globe_contest_all.dart';
import 'Liv_contest.dart';
import 'To_start_contest.dart';
import 'Completed_contest.dart';
class Globe_contest extends StatefulWidget {
  const Globe_contest({Key? key}) : super(key: key);

  @override
  State<Globe_contest> createState() => _Globe_contest();
}

class _Globe_contest extends State<Globe_contest> with TickerProviderStateMixin {
   List<int> list = [1, 2, 3, 4, 5];
  final List<Map<String, dynamic>> _statistics = [
    {'key': 'Flutter Tutorial', 'value': 90},
    {'key': 'Android Tutorial', 'value': 50, 'border': true},
    {'key': 'Java Tutorial', 'value': 30},
    {'key': 'sdfjsfjk', 'value': 70}
  ];
  int counter = 0;
    int activeindex =0;
  
  
  String counttime = "Loading";
  // Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);
     bool clikc = true;
  @override
  Widget build(BuildContext context) {
    TabController _controller = TabController(length: 4, vsync: this);
     counttime = CountDown().timeLeft(DateTime.parse("2022-07-23 10:00:00"), "Completed", "d :", "h :", "m :", "s", "D ", "H ", "M", "S");
    double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays); // <-- SEE HERE
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
     return Scaffold(
        
         backgroundColor: Color.fromARGB(255, 235, 235, 235),
        body: IntrinsicHeight(
          child: Container(
            height: height * 0.80 ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(width * 0.05, 10, 2, 10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                    //This is for background color
                    color: Color.fromARGB(255, 227, 235, 241),
                    //This is for bottom border that is needed
                    // border: Border(bottom: BorderSide(color: Colors.grey, width: 0.8))
                    ),
                    width: width * 0.90 ,
                    child:TabBar(
                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: Colors.grey,
                        indicator: UnderlineTabIndicator(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 30, 165, 255), width: 2.0),
                          insets: EdgeInsets.symmetric(horizontal:8.0)
                        ),
                         labelPadding: EdgeInsets.symmetric(horizontal: 6.0),
                        controller: _controller,
                        tabs:  [
                          Tab(
                            child: Container(
                                  
                              
                                child: Text("All contest",style: TextStyle(color: Colors.black),),
                              ),
                          ),
                          Tab( child: Container(
                              
                              
                              child: Text("Live",style: TextStyle(color: Colors.black),),
                              ),
                          ),
                           Tab( child: Container(
                             
                              
                              child: Text("To Start",style: TextStyle(color: Colors.black),),
                              ),
                          ),
                           Tab( child: Container(
                              
                              
                              child: Text("Completed",style: TextStyle(color: Colors.black),),
                              ),
                          )
                            
                        ],
                    ),
                  ),
                ]
              ),
              ]
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text("Note : \"Tab\" the contest to view more details "),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(width * 0.05, 0, 0, 0),
                    width: width * 0.90,
                      height: height *0.65,
                      child: TabBarView(
                          controller: _controller,
                          children: const <Widget> [
                            Globe_contest_all(),
                            // Liv_contest(),
                            Liv_contest(),
                            To_start_contest(),
                            Completed_contest(),
                          
                       
                      ]
                    ),
                  ),
                ],
              ),
            ),
             
                    
                      
                    
                   
            ],
        ),
          ),
        ),
      );
        
         
      
  }
   Widget builindicator() => AnimatedSmoothIndicator( 
       activeIndex: activeindex, 
       count: list.length,
       effect: const SlideEffect(
        activeDotColor: Color(0xffffa300),
        dotWidth: 10,
        dotHeight: 10,
        ),
      );
}