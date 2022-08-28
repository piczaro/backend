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
import 'package:localstorage/localstorage.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class Followings extends StatefulWidget {
  const Followings({Key? key}) : super(key: key);

  @override
  State<Followings> createState() => _Followings();
}

class _Followings extends State<Followings> {
  Future<List<dynamic>> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    final username = await storage.getItem('username');

    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/get_user_follow/${user_id}'),
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
    {'key': 'sdfjsfjk', 'value': 70},
    {'key': 'sdfjsfjk', 'value': 70},
    {'key': 'sdfjsfjk', 'value': 70},
    {'key': 'sdfjsfjk', 'value': 70},
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
      child: Column(
        children: [
          FutureBuilder(
              future: futureAlbum,
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  int l = snapshot.data.length;
                  if (l == 0) {
                    return Center(
                        child: Text(
                      "No Following",
                      style: TextStyle(fontSize: 20),
                    ));
                  }
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Color.fromARGB(255, 218, 217, 217),
                                      blurRadius: 20.0,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  width: width * 0.90,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              10, 5, 10, 10),
                                          child: CircleAvatar(
                                            child: CachedNetworkImage(
                                              imageUrl: snapshot.data[index]
                                                          ['photoUrl'] !=
                                                      null
                                                  ? snapshot.data[index]
                                                      ['photoUrl']
                                                  : 'https://picsum.photos/200',
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                width: 120.0,
                                                height: 150.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  new CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      new Icon(Icons.error),
                                              maxHeightDiskCache: 200,
                                              maxWidthDiskCache: 500,
                                            ),
                                             radius: 30.0,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Text(
                                                snapshot.data[index]
                                                          ['username'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily:
                                                        "SFPRO semibold"),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 5, 0, 0),
                                            child: Text(
                                              snapshot.data[index]
                                                          ['name'],
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: "SFPRO regular"),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            60, 15, 0, 10),
                                        width: width * 0.25,
                                        height: height * 0.05,
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "Remove",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontFamily: "SFPRO regular"),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 0, 0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }
              }),
          Container(
              child: Text(
            "Suggestions for you",
            style: TextStyle(fontSize: 20, fontFamily: "SFPRO BOLD"),
          )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                new BoxShadow(
                  color: Color.fromARGB(255, 218, 217, 217),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Container(
              width: width * 0.90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/120'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Saranya",
                            style: TextStyle(
                                fontSize: 15, fontFamily: "SFPRO semibold"),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Text(
                          "Saranya",
                          style: TextStyle(
                              fontSize: 13, fontFamily: "SFPRO regular"),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(60, 15, 0, 10),
                    width: width * 0.25,
                    height: height * 0.05,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Follow",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "SFPRO regular"),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffffa300),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
