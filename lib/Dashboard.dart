import 'package:date_count_down/countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "Contest.dart";
import 'Home.dart';
import 'Globe_contest.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import './Feed.dart';
import './Settings.dart';
import 'Help_support.dart';
import 'Terms_condition.dart';
import 'About.dart';
import 'Find_my_friends.dart';
import 'Notifications.dart';
class Dashboard extends StatefulWidget {
  
  const Dashboard({Key? key, }) : super(key: key);
  
  @override
  
   

  
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  int activeindex =0;
  List<int> list = [1, 2, 3, 4, 5];
  int counter = 2;
  String counttime = "Loading";
  // Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);
  String _title =  "Home";
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Globe_contest(),
    Feed(),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
     Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
     Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];
   @override
  initState(){
    _title = 'Home';
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch(index) { 
       case 0: { _title = 'Home'; } 
       break; 
       case 1: { _title = 'My Contests'; } 
       break;
       case 2: { _title = 'Feed'; } 
       break;
       case 3: { _title = 'Clients'; } 
       break; 
      } 
    });
  }


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
    return Scaffold(
       
      appBar: PreferredSize(
            preferredSize:  Size.fromHeight(height * 0.10),
            child: AppBar(
              // leading: Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     IconButton(
              //       icon: const Icon(Icons.arrow_back, color: Colors.white),
              //       onPressed: () => Navigator.of(context).pop(),
              //     ),
              //   ],
              // ), 
              title: Container(
                margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(_title,style: TextStyle(
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
               InkWell(
                onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const Notifications()),
                    );
                },
                 child: Container(
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
               ),
             ],
           ),
        ],
              centerTitle: true,
              toolbarHeight:100,
              backgroundColor: const Color(0xff1042aa), 
            ),
      ),
          
        
     
      body: _widgetOptions.elementAt(_selectedIndex),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
           icon: Icon(FontAwesomeIcons.home), 
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.star), 
            label: 'My Match',
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
         onTap: _onItemTapped,
      ),
      drawer: Drawer(  
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
          color: Color(0xff1042aa),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.money,color: Colors.white,),
                    Text(' My Balance',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.share_rounded,color: Colors.white,),
                    Text(' Refer & Earn',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.grade_outlined,color: Colors.white,),
                    Text(' My Level',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              InkWell(
                onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const Find_my_friends()),
                    );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child : 
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const[
                      
                      Icon(Icons.gps_fixed,color: Colors.white,),
                      Text(' Find my Friends',style: TextStyle(
                        color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )
                ),
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              InkWell(
                onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const Settings()),
                    );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child : 
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const[
                      
                      Icon(Icons.settings,color: Colors.white,),
                      Text(' My Settings',style: TextStyle(
                        color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )
                ),
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              InkWell(
                onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const Help_support()),
                    );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child : 
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const[
                      
                      Icon(Icons.help_center,color: Colors.white,),
                      Text(' Help Desk',style: TextStyle(
                        color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )
                ),
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              InkWell(
                onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const About()),
                    );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child : 
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const[
                      
                      Icon(Icons.account_box_outlined,color: Colors.white,),
                      Text(' About App',style: TextStyle(
                        color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )
                ),
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              InkWell(
                 onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const Terms_condition()),
                    );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child : 
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const[
                      
                      Icon(Icons.money_outlined,color: Colors.white,),
                      Text(' Terms & condition',style: TextStyle(
                        color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )
                ),
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.logout_outlined,color: Colors.white,),
                    Text(' Logout',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
            ]
          ),
        ),
      ),   
        
    );
    
  }
 
}