import 'package:date_count_down/countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Contest.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  
  @override
  
   

  
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
    int activeindex =0;
  List<int> list = [1, 2, 3, 4, 5];
  int counter = 2;
  String counttime = "Loading";
  // Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);
  @override
  Widget build(BuildContext context) {
     counttime = CountDown().timeLeft(DateTime.parse("2022-07-23 10:00:00"), "Completed", "d :", "h :", "m :", "s", "D ", "H ", "M", "S");
    double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays); // <-- SEE HERE
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 0, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("My Contest",style: TextStyle(
                          fontFamily: 'SFPRO semibold',
                          color: Color.fromARGB(255, 5, 5, 5),
                          fontSize: 25,
                        ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: const Text("View all",style: TextStyle(
                            fontFamily: 'SFPRO semibold',
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                             decoration: TextDecoration.underline,
                          ),
                        ),
                  ),
                  
                ],
              ),
              
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 CarouselSlider(
                  options: CarouselOptions(
                    disableCenter: true,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    height: 200,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                     viewportFraction: 1,
                     onPageChanged: (index, reason) => {
                       setState((() => activeindex = index))
                     }
                  ),
                  items: list
                    .map((item) => 
                      Container(
                          margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromARGB(255, 211, 211, 211)),
                            borderRadius: const BorderRadius.all(Radius.circular(15))
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child:  Text("End In : " + counttime),
                                    ),
                                  ]
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                    child: Text("Contest Name",style:  TextStyle(
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
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: RichText(
                                          text: const TextSpan(
                                            text: "Contest Name",
                                            style: TextStyle(color: Colors.black, fontSize: 20),
                                            children: <TextSpan>[
                                              TextSpan(text: ' Live', style: TextStyle(
                                                color: Color.fromARGB(255, 163, 84, 80)
                                                )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                ]
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children:  [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                      child: RichText(
                                          text: const TextSpan(
                                            text: "Price",
                                            style: TextStyle(color: Colors.black, fontSize: 17),
                                            children: <TextSpan>[
                                              TextSpan(text: ' ₹ 200', style: TextStyle(
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                fontSize: 25,
                                                fontFamily: "SFPRO BOLD",
                                                
                                                )
                                              ),
                                            ],
                                          ),
                                        ),
                                    ),
                                ]
                              ),
                              IntrinsicHeight(
                                child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: RichText(
                                            text: const TextSpan(
                                              text: "No. of slot : ",
                                              style: TextStyle(color: Colors.black, fontSize: 15),
                                              children: <TextSpan>[
                                                TextSpan(text: ' 2', style: TextStyle(
                                                  color: Color.fromARGB(255, 231, 196, 41),
                                                  fontSize: 15,
                                                  fontFamily: "SFPRO BOLD",
                                                  
                                                  )
                                                ),
                                              ],
                                            ),
                                          ),
                                      ),
                                      const VerticalDivider(
                                        color: Color.fromARGB(255, 180, 180, 180),
                                        thickness: 2,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                                        child: RichText(
                                            text: const TextSpan(
                                              text: "Contest Type :",
                                              style: TextStyle(color: Colors.black, fontSize: 15),
                                              children: <TextSpan>[
                                                TextSpan(text: ' Express', style: TextStyle(
                                                  color: Color.fromARGB(255, 231, 196, 41),
                                                  fontSize: 15,
                                                  fontFamily: "SFPRO BOLD",
                                                  
                                                  )
                                                ),
                                              ],
                                            ),
                                          ),
                                      ),
                                      
                                    ],
                                ),
                              ),
                              
                            ]
                          ),
                          
                      )
                    )
                    .toList(),
                  ),
                  const SizedBox(
                    height:1
                  ),
                  builindicator(),     
            
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ 
                        const Text("Contest Category",style: TextStyle(
                            fontFamily: 'SFPRO semibold',
                            color: Color.fromARGB(255, 5, 5, 5),
                            fontSize: 25,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: const Text("View all",style: TextStyle(
                              fontFamily: 'SFPRO semibold',
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15,
                                decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ]
                      
                    ),
                    Container(
                       margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search),
                         border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          
                          hintText: 'Filter',
                          
                        ),
                      ),
                    ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            
                           margin: EdgeInsets.fromLTRB(20, 20, 5, 10),
                            padding: EdgeInsets.fromLTRB(10, 20, 15, 10),
                          height : height * 0.20,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(255, 201, 203, 206)),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Text ("Singapore Daires"),
                                ElevatedButton(
                                onPressed: () {
                                    Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) =>  const Contest()),
                                    );
                                },
                                child: const Text("Join Contest",style: TextStyle(
                                  fontSize: 20,
                                ),),
                                 style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffffa300),
                                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:  BorderRadius.circular(5.0),
                                   )
                                 )
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                           margin: EdgeInsets.fromLTRB(5, 20, 20, 10),
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          height : height * 0.20,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(255, 201, 203, 206)),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Text ("Singapore Daires"),
                                ElevatedButton(
                                onPressed: (){
                                  //  Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) =>  const  LoginPage()),
                                  // );
                                }, 
                                child: const Text("Join Contest",style: TextStyle(
                                  fontSize: 20,
                                ),),
                                 style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffffa300),
                                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:  BorderRadius.circular(5.0),
                                   )
                                 )
                                ),
                              ],
                            ),
                          ),
                        )
                        
                      ],
                    ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            
                           margin: EdgeInsets.fromLTRB(20, 20, 5, 10),
                            padding: EdgeInsets.fromLTRB(10, 20, 15, 10),
                          height : height * 0.20,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(255, 201, 203, 206)),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Text ("Singapore Daires"),
                                ElevatedButton(
                                onPressed: (){
                                  //  Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) =>  const  LoginPage()),
                                  // );
                                }, 
                                child: const Text("Join Contest",style: TextStyle(
                                  fontSize: 20,
                                ),),
                                 style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffffa300),
                                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:  BorderRadius.circular(5.0),
                                   )
                                 )
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                           margin: EdgeInsets.fromLTRB(5, 20, 20, 10),
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          height : height * 0.20,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(255, 201, 203, 206)),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Text ("Singapore Daires"),
                                ElevatedButton(
                                onPressed: (){
                                  //  Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) =>  const  LoginPage()),
                                  // );
                                }, 
                                child: const Text("Join Contest",style: TextStyle(
                                  fontSize: 20,
                                ),),
                                 style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffffa300),
                                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:  BorderRadius.circular(5.0),
                                   )
                                 )
                                ),
                              ],
                            ),
                          ),
                        )
                        
                      ],
                    )
                ],
              ),
            ),
          ],
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