import 'package:date_count_down/countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:pixzaro/FollowersT.dart';
import 'package:pixzaro/FollowingsT.dart';
import 'package:pixzaro/PointsT.dart';
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
import 'Points.dart';
import 'PostsT.dart';
import 'Followers.dart';
import 'Followings.dart';
import 'Notifications.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Appbar.dart';

class MYProfile extends StatefulWidget {
  final int index;
  const MYProfile({Key? key, required this.index}) : super(key: key);

  @override
  State<MYProfile> createState() => _MYProfile();
}

class _MYProfile extends State<MYProfile> with TickerProviderStateMixin {
  int post = 0;
  int Point = 0;
  int followers = 0;
  int followings = 0;
  Future<Map<String, dynamic>> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    final response = await http.get(
      Uri.parse('${dotenv.env['API_URL']}/api/user_details/${widget.index}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
        //'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjYxMDY0MjkzLCJleHAiOjE2NjEwNjc4OTMsIm5iZiI6MTY2MTA2NDI5MywianRpIjoiNHZ3NXpoSWY4WEFuajJQZyIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.2uRgNx36JrNZzlezxQ7qfkqNsL8ydwxyZPCFUTgDsW',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['data'];
      var user_count = jsonDecode(response.body)['user_count'];
      setState(() {
        post = user_count['post_count'];
        Point = user_count['total_amount'];
        followers = user_count['user_followers'];
        followings = user_count['follow_user'];
      });
      print(jsonData);
    } else {}
    return jsonDecode(response.body)['data'];
  }

  late Future<Map<String, dynamic>> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = loaddata();
  }

  List<int> list = [1, 2, 3, 4, 5];
  final List<Map<String, dynamic>> _statistics = [
    {'key': 'Flutter Tutorial', 'value': 90},
    {'key': 'Android Tutorial', 'value': 50, 'border': true},
    {'key': 'Java Tutorial', 'value': 30},
    {'key': 'sdfjsfjk', 'value': 70}
  ];
  int counter = 0;
  int activeindex = 0;

  void refresh() async {
    print("loded");
  }

  String _title = "Profile";
  String counttime = "Loading";
  // Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);
  bool clikc = true;
  @override
  Widget build(BuildContext context) {
    TabController _controller = TabController(length: 4, vsync: this);
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
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: CustomAppBar(title: _title),
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
        //   title: Container(
        //     margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       crossAxisAlignment: CrossAxisAlignment.end,
        //       children: [
        //         Text(
        //           _title,
        //           style: TextStyle(
        //             fontSize: 20,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   actions: <Widget>[
        //     // Using Stack to show Notification Badge
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         Container(
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
        //       ],
        //     ),
        //   ],
        //   centerTitle: true,
        //   toolbarHeight: 100,
        //   backgroundColor: const Color(0xff1042aa),
        // ),
      ),
      body: IntrinsicHeight(
        child: Container(
          height: height * 0.80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FutureBuilder(
                  future: futureAlbum,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      var level;
                      if (snapshot.data['level'] != null) {
                        level = snapshot.data['level'];
                      } else {
                        level = 0;
                      }

                      return Container(
                        decoration: BoxDecoration(
                          color: Color(0xff1042aa),
                        ),
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (snapshot.data['user_type'] == "normal")
                              Container(
                                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  width: width * 0.30,
                                  height: height * 0.15,
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data['profile_pic'] !=
                                              null
                                          ? "${dotenv.env['Image_URL']}/profile_pic/${snapshot.data['profile_pic']}"
                                          : 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 110.0,
                                        height: 110.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          new CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          new Icon(Icons.error),
                                      maxHeightDiskCache: 200,
                                      maxWidthDiskCache: 500,
                                    ),
                                  )),
                            if (snapshot.data['user_type'] == "google" || snapshot.data['user_type'] == "facebook")
                              Container(
                                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  width: width * 0.30,
                                  height: height * 0.15,
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data['photoUrl'] !=
                                              null
                                          ? snapshot.data['photoUrl']
                                          : 'https://picsum.photos/200',
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 110.0,
                                        height: 110.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          new CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          new Icon(Icons.error),
                                      maxHeightDiskCache: 200,
                                      maxWidthDiskCache: 500,
                                    ),
                                  )),
                            Container(
                                child: Text(
                              snapshot.data['username'],
                              style: TextStyle(
                                  fontSize: 23,
                                  fontFamily: "SFPRO regular",
                                  color: Colors.white),
                            )),
                            // Container(
                            //     margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            //     child: const Text(
                            //       "Photographer & Youtuber",
                            //       style: TextStyle(
                            //           fontSize: 23,
                            //           fontFamily: "SFPRO regular",
                            //           color: Colors.white),
                            //     )),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.chessQueen,
                                    color: Color.fromARGB(255, 238, 220, 63),
                                    size: 40,
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Text(
                                        "Level - ${level}",
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontFamily: "SFPRO regular",
                                            color: Colors.white),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  }),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    decoration: BoxDecoration(
                      //This is for background color
                      color: Color(0xff1042aa),
                      //This is for bottom border that is needed
                      // border: Border(bottom: BorderSide(color: Colors.grey, width: 0.8))
                    ),
                    width: width,
                    height: height * 0.08,
                    child: TabBar(
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: Colors.grey,
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 30, 165, 255),
                              width: 2.0),
                          insets: EdgeInsets.symmetric(horizontal: 8.0)),
                      labelPadding: EdgeInsets.symmetric(horizontal: 6.0),
                      controller: _controller,
                      tabs: [
                        Tab(
                          child: Container(
                              child: Column(
                            children: [
                              Text(
                                "",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Post",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                        ),
                        Tab(
                          child: Container(
                              child: Column(
                            children: [
                              Text(
                                "",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Points",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                        ),
                        Tab(
                          child: Container(
                              child: Column(
                            children: [
                              Text(
                                "",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                        ),
                        Tab(
                          child: Container(
                              child: Column(
                            children: [
                              Text(
                                "",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                ]),
              ]),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(width * 0.05, 0, 0, 0),
                      width: width * 0.90,
                      height: height * 0.39,
                      child: TabBarView(
                          controller: _controller,
                          children: <Widget>[
                            PostsT(index: widget.index),
                            // Liv_contest(),
                            PointsT(index: widget.index),
                            FollowersT(
                              index: widget.index,
                            ),
                            FollowingsT(
                                index: widget.index, notifyParent: refresh),
                          ]),
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
