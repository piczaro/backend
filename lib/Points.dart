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
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Points extends StatefulWidget {
  const Points({Key? key}) : super(key: key);

  @override
  State<Points> createState() => _Points();
}

class _Points extends State<Points> {
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
  Future<List<dynamic>> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    final response = await http.get(
      Uri.parse(
          '${dotenv.env['API_URL']}/api/user_contest_level_details/${user_id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
        //'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjYxMDY0MjkzLCJleHAiOjE2NjEwNjc4OTMsIm5iZiI6MTY2MTA2NDI5MywianRpIjoiNHZ3NXpoSWY4WEFuajJQZyIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.2uRgNx36JrNZzlezxQ7qfkqNsL8ydwxyZPCFUTgDsW',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['data'];

      print(jsonData);
    } else {}
    return jsonDecode(response.body)['data'];
  }

  late Future<List<dynamic>> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = loaddata();
  }

  int counter = 0;
  String counttime = "Loading";
  @override
  Widget build(BuildContext context) {
    counttime = CountDown().timeLeft(DateTime.parse("2022-07-23 10:00:00"),
        "Completed", "d :", "h :", "m :", "s", "D ", "H ", "M", "S");

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        width: width,
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FutureBuilder(
                  future: futureAlbum,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      int l = snapshot.data.length;
                      if (l == 0) {
                        return Center(
                            child: Text(
                          "No Post",
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
                              height: height * 0.10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            width * 0.20, 0, 0, 0),
                                        padding:
                                            EdgeInsets.fromLTRB(15, 10, 15, 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Color(0xff1042aa),
                                        ),
                                        child: Text(
                                          "${snapshot.data[index]['level']}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      if(double.parse(snapshot.data[index]['rewards']) > 0)Row(
                                        children: [
                                          Container(
                                            width: width * 0.50,
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            padding: EdgeInsets.fromLTRB(
                                                10, 7, 0, 7),
                                            decoration: BoxDecoration(
                                              color: Color(0xffffa300),
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                            child: Text(
                                              "${snapshot.data[index]['rewards']} cash bonus await",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: height * 0.053,
                                    margin: EdgeInsets.fromLTRB(
                                        width * 0.225, 0, 0, 0),
                                    child: VerticalDivider(
                                      color: Colors.black,
                                      thickness: 5,
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                  })
            ]),
      ),
    );
  }
}
