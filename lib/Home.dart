import 'package:date_count_down/countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_countdown_timer/countdown.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:date_count_down/date_count_down.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'Contest.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'mydrawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';
import 'Login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:date_count_down/countdown.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'Participantslisting.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class Category {
  final int id;
  final String name;
  final String file;
  final int count;

  Category(
      {required this.id,
      required this.name,
      required this.file,
      required this.count});
  factory Category.fromJson(Map<String, dynamic> json) {
    print(json);
    return Category(
      id: json['data'][0]['id'],
      name: json['data'][0]['name'],
      file: json['data'][0]['file'],
      count: json['count'],
    );
  }
}

class _Home extends State<Home> {
  Future<List<dynamic>> loaddata() async {
    try {
      final storage = new LocalStorage('my_data');
      final token = await storage.getItem('jwt_token');
      final response = await http.get(
        Uri.parse('${dotenv.env['API_URL']}/api/category_listing'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
      );
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body)['status'];
        print(jsonData);
        if (jsonDecode(response.body)['status'] ?? true) {
          return jsonDecode(response.body)['data'];
        } else if (jsonDecode(response.body)['status'] ?? false) {
          Future.delayed(const Duration(milliseconds: 0), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          });
        }

        return jsonDecode(response.body)['data'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    } on Exception catch (_) {
      return [];
      print('never reached');
    }
  }

  Future<List<dynamic>> ongoingSlider() async {
    try {
      final storage = new LocalStorage('my_data');
      final token = await storage.getItem('jwt_token');
      final user_id = await storage.getItem('user_id');
      final response = await http.get(
        Uri.parse(
            '${dotenv.env['API_URL']}/api/user_ongoing_upcoming_contest/${user_id}'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
      );
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body)['status'];
        print("Ongoing");
        print(jsonData);
        if (jsonDecode(response.body)['status'] ?? true) {
          var data = jsonDecode(response.body)['data'].length;

          for (var i = 0; i < data; i++) {
            list.add(i);
          }
          print(list);
          return jsonDecode(response.body)['data'];
        } else if (jsonDecode(response.body)['status'] ?? false) {}

        return jsonDecode(response.body)['data'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    } on Exception catch (_) {
      return [];
      print('never reached');
    }
  }

  int activeindex = 0;
  List<int> list = [];
  int counter = 2;
  String counttime = "Loading";
  // Timer? countdownTimer;
  Duration myDuration = const Duration(days: 5);
  late Future<List<dynamic>> futureAlbum;
  late Future<List<dynamic>> sliDer;
  Future<bool> checkLoginStatus() async {
    final storage = new LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    Map<String, dynamic> jsonMap_body = {
      "token": token,
    };

    final response = await http.get(
      Uri.parse('${dotenv.env['API_URL']}/api/auth_token_check'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${token}',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['status'];
      print(jsonData);
      if (jsonData ?? true) {
        return jsonDecode(response.body)['data'];
      } else if (jsonData ?? false) {
        Future.delayed(const Duration(milliseconds: 0), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        });
      }
    }
    return true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // checkLoginStatus();
    futureAlbum = loaddata();
    sliDer = ongoingSlider();
  }

  @override
  Widget build(BuildContext context) {
    counttime = CountDown().timeLeft(DateTime.parse("2022-07-23 10:00:00"),
        "Completed", "d :", "h :", "m :", "s", "D ", "H ", "M", "S");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // String strDigits(int n) => n.toString().padLeft(2, '0');
    // final days = strDigits(myDuration.inDays); // <-- SEE HERE
    // final hours = strDigits(myDuration.inHours.remainder(24));
    // final minutes = strDigits(myDuration.inMinutes.remainder(60));
    // final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // InkWell(
                //   child: Container(
                //     margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                //     child: const Text(
                //       "View all",
                //       style: TextStyle(
                //         fontFamily: 'SFPRO semibold',
                //         color: Color.fromARGB(255, 0, 0, 0),
                //         fontSize: 15,
                //         decoration: TextDecoration.underline,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          FutureBuilder(
              future: sliDer,
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  int l = snapshot.data.length;
                  if (l == 0) {
                    return Center(
                        child: Text(
                      "",
                      style: TextStyle(fontSize: 20),
                    ));
                  }
                  var carouselSlider = snapshot.data;
                  print(carouselSlider);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "My Contest",
                        style: TextStyle(
                          fontFamily: 'SFPRO semibold',
                          color: Color.fromARGB(255, 5, 5, 5),
                          fontSize: 25,
                        ),
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                            disableCenter: true,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            height: 200,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 1,
                            onPageChanged: (index, reason) =>
                                {setState((() => activeindex = index))}),
                        items: carouselSlider
                            .map<Widget>((item) => GestureDetector(
                              child: Container(
                                    
                                    margin:
                                        const EdgeInsets.fromLTRB(25, 10, 25, 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 211, 211, 211)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Column(children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,

                                          children: [
                                            Text("End In : "),
                                            CountdownTimer(
                                              endTime: DateTime.parse(
                                                      "${item['end_datetime']}")
                                                  .millisecondsSinceEpoch,
                                              widgetBuilder: (_, time) {
                                                if (time == null) {
                                                  return Text('Game over');
                                                }
                                                return Text(
                                                    '${time.hours}h:${time.min}m:${time.sec}s');
                                              },
                                            ),
                                          ]),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 10, 10),
                                            child: Text(
                                              '${item['name']}',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontFamily: "SFPRO regular",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  10, 0, 10, 0),
                                              child: RichText(
                                                text: TextSpan(
                                                  text:
                                                      '${item['category_name']}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: ' Live',
                                                        style: TextStyle(
                                                            color: Color.fromARGB(255, 108, 212, 67))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  10, 0, 10, 10),
                                              child: RichText(
                                                text: TextSpan(
                                                  text: "Price",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text:
                                                            ' ₹ ${item['amount']}',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontSize: 25,
                                                          fontFamily:
                                                              "SFPRO BOLD",
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]),
                                      IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              child: RichText(
                                                text: const TextSpan(
                                                  text: "No. of slot : ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: ' 2',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 231, 196, 41),
                                                          fontSize: 15,
                                                          fontFamily:
                                                              "SFPRO BOLD",
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const VerticalDivider(
                                              color: Color.fromARGB(
                                                  255, 180, 180, 180),
                                              thickness: 2,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  25, 10, 10, 10),
                                              child: RichText(
                                                text: TextSpan(
                                                  text: "Contest Type :",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text:
                                                            '${item['contest_type']}',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 231, 196, 41),
                                                          fontSize: 15,
                                                          fontFamily:
                                                              "SFPRO BOLD",
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                            ))
                            .toList(),
                      ),
                      const SizedBox(height: 1),
                      builindicator(),
                    ],
                  );
                }
              }),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Contest Category",
                    style: TextStyle(
                      fontFamily: 'SFPRO semibold',
                      color: Color.fromARGB(255, 5, 5, 5),
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  // child: TextField(
                  //   decoration: InputDecoration(
                  //     suffixIcon: const Icon(Icons.search),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(25.0),
                  //     ),
                  //     hintText: 'Filter',
                  //   ),
                  // ),
                ),
                FutureBuilder(
                    future: futureAlbum,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                        return LoginPage();
                      } else {
                        int l = snapshot.data.length;
                        if (l == 0) {
                          return Center(
                              child: Text(
                            "No Data",
                            style: TextStyle(fontSize: 20),
                          ));
                        }
                        return GridView.count(
                          shrinkWrap: true,
                          // scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          // physics: ScrollPhysics(),
                          // crossAxisSpacing: 8, 
                          // mainAxisSpacing: 8,
                          // Create a grid with 2 columns. If you change the scrollDirection to
                          // horizontal, this produces 2 rows.
                          crossAxisCount: 2,
                          // Generate 100 widgets that display their index in the List.
                          children:
                              List.generate(snapshot.data!.length, (index) {
                            return SingleChildScrollView(
                              child: Column(children: [
                                Center(
                                  child: Container(
                                    // margin:
                                    //     const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    //     // EdgeInsets.,
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 20, 15, 0),
                                    height: height * 0.21,
                                    width: width * 0.43,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 201, 203, 206)),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 0, 10, 10),
                                              child: Text(
                                                  "${snapshot.data[index]['name']}")),
                                          // FadeInImage(
                                          //   placeholder: circularProgressIndicator,
                                          //   image: NetworkImage(
                                          //       "${dotenv.env['API_URL']}/category_images/${snapshot.data[index]['file']}"),
                                          // ),
                                          CachedNetworkImage(
                                            placeholder: (context, url) =>
                                                new Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget: (context, url, error) =>
                                                new Icon(Icons.error),
                                            imageUrl:
                                                '${dotenv.env['API_URL']}/category_images/${snapshot.data[index]['file']}',
                                            maxHeightDiskCache: 100,
                                            maxWidthDiskCache: 130,
                                            width: 110,
                                            height: 55,
                                            
                                          ),
                                          // CachedNetworkImage(
                                          //   imageUrl:
                                          //       "${dotenv.env['API_URL']}/category_images/${snapshot.data[index]['file']}",
                                          //   placeholder: (context, url) =>
                                          //       const CircleAvatar(
                                          //     backgroundColor: Colors.amber,
                                          //     radius: 150,
                                          //   ),
                                          // ),
                                          // FadeInImage.assetNetwork(
                                          //   placeholder: 'images/loading.gif',
                                          //   image:
                                          //       "${dotenv.env['API_URL']}/category_images/${snapshot.data[index]['file']}",
                                          //   width: 110,
                                          //   height: 55,
                                          // ),
                                          // Image.network("${dotenv.env['API_URL']}/category_images/${snapshot.data[index]['file']}"
                                          //     ,
                                          //     width: 110,
                                          //     height: 65,
                                          //     fit: BoxFit.fill),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Contest(
                                                                id: snapshot
                                                                        .data[index]
                                                                    ['id'])),
                                                  );
                                                },
                                                child: const Text(
                                                  "Join Contest",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    primary:
                                                        const Color(0xffffa300),
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                            5, 0, 5, 0),
                                                   
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ))),
                                          ),
                                                  
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            );
                          }),
                        );
                      }
                      return const CircularProgressIndicator();
                    }),
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
