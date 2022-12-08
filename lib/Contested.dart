import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:date_count_down/countdown.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:like_button/like_button.dart';
class Contested extends StatefulWidget {
  const Contested({Key? key}) : super(key: key);

  @override
  State<Contested> createState() => _Contested();
}

class _Contested extends State<Contested> {
  int counter = 0;
  
   final List<Map<String, dynamic>> _statistics = [
    {'key': 'Flutter Tutorial', 'value': 90},
    {'key': 'Android Tutorial', 'value': 50, 'border': true},
    {'key': 'Java Tutorial', 'value': 30},
    {'key': 'sdfjsfjk', 'value': 70}
  ];
   String counttime = "Loading";
 
 
  @override
  Widget build(BuildContext context) {
    counttime = CountDown().timeLeft(DateTime.parse("2022-07-23 10:00:00"), "Completed", "d :", "h :", "m :", "s", "D ", "H ", "M", "S");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
            preferredSize:  Size.fromHeight(height * 0.10),
            child: AppBar(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ), 
              title: Container(
                margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('Contest Details Screen',style: TextStyle(
                          fontSize: 20,
                        ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
          // Using Stack to show Notification Badge
           Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
                Container(
                 margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                 child: Stack(
                  children: <Widget>[
                     IconButton(icon: Icon(Icons.notifications,size: 30,), onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    }),
                     Positioned(
                      right: 11,
                      top: 11,
                      child:  Container(
                        padding: const EdgeInsets.all(2),
                        decoration:  BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
          ),
               ),
             ],
           ),
        ],
              centerTitle: true,
              toolbarHeight:100,
              backgroundColor: const Color(0xff1042aa), 
            ),
      ),
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Column(
              children: [

                  Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Row(
                          children: const [
                             Text('B/W portrait',style: TextStyle(
                                    fontSize: 17,
                                   
                                  ),
                              ),
                              Text(' Live',style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.red,
                                    
                                  ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 5,
                                
                              ),
                             
                               

                          ],
                        ),
                          Row(
                            children: [
                              Text("Ends In : "),
                              CountdownTimer(
                                endTime: DateTime.parse("2023-09-04 18:00:00Z").millisecondsSinceEpoch,
                              ),
                            ],
                          ),
                          
                        ]
                      ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
                    child: Column(
                     children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: const [
                              Text("Price Amount",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              ),
                              Text("₹ 100",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: const [
                              Text("Contest Type",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              ),
                              Text("Express",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: const [
                              Text("Duration",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              ),
                              Text("3:00hrs ",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: const [
                              Text("Available Slots",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              ),
                              Text("03",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              )
                            ]
                          ),
                        ],
                    ),
                    ],
                   ),
                ),

                Column(
                  children: _statistics.map((Map<String, dynamic> data) {
                      return 
                        
                     
                       Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Row(
                                children: const [
                                  Text('Participant Name : ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'SFPRO semibold'
                                    ),
                                  ),
                                  Text('Johnathan',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'SFPRO BOLD'
                                      ),
                                    ),
                                ],
                              ),
                              // PopupMenuButton(itemBuilder: itemBuilder)
                               Icon(Icons.more_vert),

                             
                            ],
                          ),
                        ),
                         Container(
                          height:250,
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Image.asset('images/group.png'),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              const Text("Points : 1000",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 92, 91, 91),
                                  fontSize: 15,
                                  fontFamily: 'SFPRO regular'
                                ), 
                              )
                              
                            ]
                          ),
                        ) 
                      ]
                    
                    );
                  }).toList()),
               
              ],
            ),
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
           icon: Icon(FontAwesomeIcons.home), 
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.star), 
            label: 'My Watch',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.rss),
            label: 'Feed',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.boxesStacked), 
            label: 'Others',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.user), 
            label: 'Profile',
            backgroundColor: Colors.pink,
          ),
        ],
       
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        showUnselectedLabels: true,
        iconSize: 35,
      ),
    );
  }
}