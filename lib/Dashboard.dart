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
import 'Mybalance.dart';
import 'Refer_earn.dart';
import 'Profile.dart';
import 'mydrawer.dart';
import "Appbar.dart";
class Dashboard extends StatefulWidget {
  final int index;
  final int profileindex;
  const Dashboard({
    Key? key,
    required this.index,required this.profileindex,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  // late profileindex _translatorModel = widget.transModel;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int activeindex = 0;
  late Dashboard _profileindex ;
  List<int> list = [1, 2, 3, 4, 5];
  int counter = 2;
  String counttime = "Loading";
  // Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);
  String _title = "Home";
  int _selectedIndex = 0;
   @override
  initState() {
    _title = 'Home';
    _selectedIndex = widget.index;
    // _profileindex = widget.profileindex;
  }
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late List<Widget> _widgetOptions = [
    Home(),
    Globe_contest(),
    Feed(),
    Profile(index: 0,),
    Profile(index: 0,),
    
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];
  
  final pages = [
    Home(),
    Globe_contest(),
    Feed(),
    Profile(index: 0,),
    Profile(index: 0,),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Home';
          }
          break;
        case 1:
          {
            _title = 'My Contests';
          }
          break;
        case 2:
          {
            _title = 'Feed';
          }
          break;
        case 3:
          {
            _title = 'My Profile';
            // _scaffoldKey.currentState!.openDrawer();
          }
          break;
        case 4:
          {
            _title = 'My Profile';
          }
          break;
      }
    });
  }
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    counttime = CountDown().timeLeft(DateTime.parse("2022-07-23 10:00:00"),
        "Completed", "d :", "h :", "m :", "s", "D ", "H ", "M", "S");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays); // <-- SEE HERE
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: CustomAppBar(title:_title),
        // child: AppBar(
        //   // leading: Column(
        //   //   mainAxisAlignment: MainAxisAlignment.end,
        //   //   children: [
        //   //     IconButton(
        //   //       icon: const Icon(Icons.arrow_back, color: Colors.white),
        //   //       onPressed: () => Navigator.of(context).pop(),
        //   //     ),
        //   //   ],
        //   // ),
        //   title: Center(
        //     child: Text(
        //       _title,
        //       style: TextStyle(
        //         fontSize: 20,
        //       ),
        //     ),
        //     // child: Column(
        //     //   mainAxisAlignment: MainAxisAlignment.center,
        //     //   crossAxisAlignment: CrossAxisAlignment.center,
        //     //   children: [
        //     //     Text(
        //     //       _title,
        //     //       style: TextStyle(
        //     //         fontSize: 20,
        //     //       ),
        //     //     ),
        //     //   ],
        //     // ),
        //   ),
        //   actions: <Widget>[
        //     // Using Stack to show Notification Badge
        //     Center(
        //       child: InkWell(
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const Notifications()),
        //           );
        //         },
        //         child: Container(
        //           margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
        //           child: Stack(
        //             children: <Widget>[
        //               IconButton(
        //                   icon: Icon(
        //                     Icons.notifications,
        //                     size: 30,
        //                   ),
        //                   onPressed: () {
        //                     setState(() {
        //                       counter = 0;
        //                     });
        //                   }),
        //               Positioned(
        //                 right: 11,
        //                 top: 11,
        //                 child: Container(
        //                   padding: const EdgeInsets.all(2),
        //                   decoration: BoxDecoration(
        //                     color: Colors.red,
        //                     borderRadius: BorderRadius.circular(6),
        //                   ),
        //                   constraints: const BoxConstraints(
        //                     minWidth: 18,
        //                     minHeight: 18,
        //                   ),
        //                   child: const Text(
        //                     '1',
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontSize: 12,
        //                     ),
        //                     textAlign: TextAlign.center,
        //                   ),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        //   centerTitle: true,
        //   toolbarHeight: 100,
        //   backgroundColor: const Color(0xff1042aa),
        // ),
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
            icon: FaIcon(FontAwesomeIcons.star),
            label: 'My Match',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.rss),
            label: 'Feed',
            backgroundColor: Colors.purple,
          ),
          // BottomNavigationBarItem(
          //   icon: FaIcon(FontAwesomeIcons.boxesStacked),
          //   label: 'Others',
          //   backgroundColor: Colors.pink,
          // ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: 'Profile',
            backgroundColor: Colors.pink,
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        showUnselectedLabels: true,
        iconSize: 30,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(child: DrawerWidget()),
    );
  }
}
