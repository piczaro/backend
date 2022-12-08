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
import 'package:http/http.dart' as http;
import 'Contest.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Liv_contest extends StatefulWidget {
  const Liv_contest({Key? key}) : super(key: key);

  @override
  State<Liv_contest> createState() => _Liv_contest();
}

class _Liv_contest extends State<Liv_contest> {
  Future<List<dynamic>> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final response = await http.get(
      Uri.parse('${dotenv.env['API_URL']}/api/ongoing_contest'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['data'];
      print(jsonData);
      return jsonData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  late Future<List<dynamic>> futureAlbum;
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
  String counttime = "Loading";
  @override
  Widget build(BuildContext context) {
    counttime = CountDown().timeLeft(DateTime.parse("2022-07-23 10:00:00"),
        "Completed", "d :", "h :", "m :", "s", "D ", "H ", "M", "S");

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: FutureBuilder(
            future: futureAlbum,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                int l = snapshot.data.length;
                if (l == 0) {
                  return Center(
                      child: Text(
                    "No Data",
                    style: TextStyle(fontSize: 20),
                  ));
                }

                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (snapshot.data[index]['name'] == null) {
                        return Center(
                            child: Text(
                          "No Data",
                          style: TextStyle(fontSize: 20),
                        ));
                      }
                      return Column(children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 7, 7, 5),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 0),
                                      child: Text(
                                        "${snapshot.data[index]['name']}",
                                        style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontFamily: "SFPRO regular",
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 0),
                                      child: Row(
                                        children: [
                                          Text("Ends In : "),
                                          CountdownTimer(
                                            endTime: DateTime.parse(
                                                    "2023-09-04 18:00:00Z")
                                                .millisecondsSinceEpoch,
                                            widgetBuilder: (_, time) {
                                              if (time == null) {
                                                return Text('Game over');
                                              }
                                              return Text(
                                                  '${time.hours}h:${time.min}m:${time.sec}s');
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 0),
                                      child: Text(
                                        "${snapshot.data[index]['name']}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontFamily: "SFPRO semibold",
                                        ),
                                      ),
                                    ),
                                    // Container(
                                    //   margin: const EdgeInsets.fromLTRB(
                                    //       10, 5, 10, 0),
                                    //   child: const Text(
                                    //     "1412",
                                    //     style: TextStyle(
                                    //       fontSize: 20,
                                    //       color: Color.fromARGB(255, 0, 153, 5),
                                    //       fontFamily: "SFPRO semibold",
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    
                                    
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 0),
                                      child: const Text(
                                        "In-Progress",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 233, 206, 56),
                                          fontFamily: "SFPRO semibold",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //   LikeButton(
                                        //     size: 30,
                                        //     circleColor: const CircleColor(
                                        //         start: Color(0xff00ddff),
                                        //         end: Color(0xff0099cc)),
                                        //     bubblesColor: const BubblesColor(
                                        //       dotPrimaryColor: Color(0xff33b5e5),
                                        //       dotSecondaryColor:
                                        //           Color(0xff0099cc),
                                        //     ),
                                        //     likeBuilder: (bool isLiked) {
                                        //       return Icon(
                                        //         Icons.thumb_up,
                                        //         color: isLiked
                                        //             ? Color.fromARGB(
                                        //                 255, 2, 95, 182)
                                        //             : Colors.grey,
                                        //         size: 30,
                                        //       );
                                        //     },
                                        //     likeCount: 665,
                                        //   ),
                                        //   LikeButton(
                                        //     size: 30,
                                        //     circleColor: const CircleColor(
                                        //         start: Color(0xff00ddff),
                                        //         end: Color(0xff0099cc)),
                                        //     bubblesColor: const BubblesColor(
                                        //       dotPrimaryColor: Color(0xff33b5e5),
                                        //       dotSecondaryColor:
                                        //           Color(0xff0099cc),
                                        //     ),
                                        //     likeBuilder: (bool isLiked) {
                                        //       return Icon(
                                        //         Icons.emoji_emotions,
                                        //         color: isLiked
                                        //             ? Color.fromARGB(
                                        //                 255, 2, 95, 182)
                                        //             : Colors.grey,
                                        //         size: 30,
                                        //       );
                                        //     },
                                        //     likeCount: 665,
                                        //   ),
                                        //   LikeButton(
                                        //     size: 30,
                                        //     circleColor: const CircleColor(
                                        //         start: Color.fromARGB(
                                        //             255, 226, 91, 82),
                                        //         end: Color.fromARGB(
                                        //             255, 226, 91, 82)),
                                        //     bubblesColor: const BubblesColor(
                                        //       dotPrimaryColor: Color.fromARGB(
                                        //           255, 226, 91, 82),
                                        //       dotSecondaryColor: Color.fromARGB(
                                        //           255, 226, 91, 82),
                                        //     ),
                                        //     likeBuilder: (bool isLiked) {
                                        //       return Icon(
                                        //         Icons.favorite,
                                        //         color: isLiked
                                        //             ? Color.fromARGB(
                                        //                 255, 226, 91, 82)
                                        //             : Colors.grey,
                                        //         size: 30,
                                        //       );
                                        //     },
                                        //     likeCount: 665,
                                        //   ),
                                      ]),
                                  // const Text(
                                  //   "Points : 1000",
                                  //   style: TextStyle(
                                  //       color: Color.fromARGB(255, 92, 91, 91),
                                  //       fontSize: 15,
                                  //       fontFamily: 'SFPRO regular'),
                                  // )
                                ],
                              ),
                            ),
                          ]),
                        )
                      ]);
                    });
              }
            }));
  }
}
