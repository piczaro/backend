import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_countdown_timer/countdown.dart';
import 'package:date_count_down/countdown.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'Contested.dart';
// import './Feed.dart';
import 'package:flutter/gestures.dart';
import 'Dashboard.dart';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Appbar.dart';

class RecentTransaction extends StatefulWidget {
  const RecentTransaction({Key? key}) : super(key: key);

  @override
  State<RecentTransaction> createState() => _Contest();
}

class _Contest extends State<RecentTransaction> {
  bool isPaid = false;

  Future<List<dynamic>> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    final response = await http.get(
      Uri.parse(
          '${dotenv.env['API_URL']}/api/recent_transaction_of_users/${user_id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['data'];
      print(jsonData);
      //  print(jsonDecode(response.body)['paid']);
      if (jsonDecode(response.body)['paid'] != null) {
        setState(() {
          isPaid = jsonDecode(response.body)['paid'];
        });
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Contest_pay(id: jsonData[0]['id'])),
        );
      }

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
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(
                index: 0,
                profileindex: 0,
              ),
            ),
          );
        }
        break;
      case 1:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(
                index: 1,
                profileindex: 0,
              ),
            ),
          );
        }
        break;
      case 2:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(
                index: 2,
                profileindex: 0,
              ),
            ),
          );
        }
        break;
      case 3:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(
                index: 3,
                profileindex: 0,
              ),
            ),
          );
          // _scaffoldKey.currentState!.openDrawer();
        }
        break;
    }
  }
  int counter = 0;
  String _title = "Recent Transaction";
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 192, 192, 192),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: CustomAppBar(title: _title),
      ),
      body: SingleChildScrollView(
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
                      var date = DateTime.parse(snapshot.data[index]['created_at']);
                      var formattedDate =
                          "${date.day}-${date.month}-${date.year}";
                      return Container(
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => Contest_pay(
                            //           id: snapshot.data[index]['id'])),
                            // );
                          },
                          child: Column(children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(5, 7, 7, 5),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 5, 10, 0),
                                          child: Text(
                                            formattedDate,
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
                                          child: Text(
                                            "${snapshot.data[index]['description']}",
                                            style: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                              fontFamily: "SFPRO regular",
                                            ),
                                          ),
                                        ),
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    const Text(
                                                      "Amount",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "SFPRO regular",
                                                      ),
                                                    ),
                                                    Text(
                                                      "₹ ${snapshot.data[index]['credit']}",
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "SFPRO regular",
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ]),
                            ),
                          ]),
                        ),
                      );
                    });
              }
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
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
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.boxesStacked),
            label: 'Others',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
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

class Contest_pay extends StatefulWidget {
  final int id;
  const Contest_pay({Key? key, required this.id}) : super(key: key);

  @override
  State<Contest_pay> createState() => _Contest_pay();
}

class _Contest_pay extends State<Contest_pay> {
  bool isPaid = false;
  static const platform = const MethodChannel("razorpay_flutter");
  Future<List<dynamic>> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    final response = await http.get(
      Uri.parse(
          '${dotenv.env['API_URL']}/api/contest_details/${widget.id}/${user_id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['data'];
      // print(jsonData);
      print(jsonDecode(response.body)['paid']);
      if (jsonDecode(response.body)['paid']) {
        setState(() {
          isPaid = true;
          upload = true;
        });
      }
      return jsonData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  bool isLoading = false;

  late Future<List<dynamic>> futureAlbum;

  late Razorpay _razorpay;

  int counter = 0;
  String counttime = "Loading";
  bool upload = false;
  bool pay = true;

  int? amount;
  int? contest_id;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    futureAlbum = loaddata();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout(int _amount, String name, int _contest_id) async {
    setState(() {
      isLoading = true;
      amount = _amount;
      contest_id = _contest_id;
    });
    print(contest_id);
    var options = {
      'key': 'rzp_test_0WWfLPotWIzETC',
      'amount': num.parse(amount.toString()) * 100,
      'name': 'Piczaro.',
      'description': name,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9003306701', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print(' ========================= >Success Response: $response');
    print(response.toString());
    setState(() => {upload = true, pay = false});

    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    Map<String, dynamic> jsonMap_body = {
      "user_id": user_id,
      "contest_id": contest_id,
      "amount": amount
    };
    try {
      print(jsonMap_body);
      final response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/api/pay_contest_amount/${user_id}'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
        body: json.encode(jsonMap_body),
      );
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });

        var post = jsonDecode(response.body);
        if (post['status']) {
          Fluttertoast.showToast(
              msg: post['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Color.fromARGB(255, 38, 153, 9),
              textColor: Color.fromARGB(255, 255, 255, 255));
        }
        print(post);
      } else if (response.statusCode == 401) {}
      print(response.body);
      // else {
      //   throw Exception('Failed to create album.');
      // }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: 'Please check your internet connection',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    }
  }

  Future<http.Response?> createAlbum(file, int contest_id) async {
    Map<String, dynamic> jsonMap_body = {
      // "user_id": 16,
      // "contest_id": contest_id,
      // "file": file
    };
    try {
      setState(() {
        isLoading = true;
      });
      final storage = LocalStorage('my_data');
      final token = await storage.getItem('jwt_token');
      final user_id = await storage.getItem('user_id');
      final response = http.MultipartRequest(
        "POST",
        Uri.parse('${dotenv.env['API_URL']}/api/create_participant'),
        // headers: {
        //   'Content-type': 'application/json',
        //   'Accept': 'application/json',
        //   'Authorization': 'Bearer ${token}',
        // },
        // body: json.encode(jsonMap_body),
      );

      response.headers['Content-type'] = 'application/json';
      response.headers['Accept'] = 'application/json';
      response.headers['Authorization'] = 'Bearer ${token}';
      response.fields['user_id'] = user_id.toString();
      response.fields['contest_id'] = contest_id.toString();
      response.files.add(await http.MultipartFile.fromPath("file", file.path));
      var res = await response.send();
      // print(res.body);
      var streaMresponse = await http.Response.fromStream(res);
      // print(streaMresponse.body);
      if (streaMresponse.statusCode == 200) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          setState(() {
            isLoading = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Dashboard(
                      index: 2,
                      profileindex: 0,
                    )),
          );
        });
      } else if (streaMresponse.statusCode == 401) {
        Fluttertoast.showToast(
            msg: "Invalid login details",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
      } else if (streaMresponse.statusCode == 400) {
        // print(res);
      } else {
        print(streaMresponse);
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: 'Please check your internet connection',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message,
    //     timeInSecForIos: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    // Fluttertoast.showToast(
    //     msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }

  String _title = "Contest Details Screen";
  //  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    counttime = CountDown().timeLeft(DateTime.parse("2022-07-23 10:00:00"),
        "Completed", "d :", "h :", "m :", "s", "D ", "H ", "M", "S");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.08),
          child: CustomAppBar(
            title: _title,
          )),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: FutureBuilder(
            future: futureAlbum,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                int available_slot = 0;
                if (snapshot.data[0]['available_slot'] != null) {
                  available_slot = snapshot.data[0]['total_slot'] -
                      snapshot.data[0]['available_slot'];
                } else {
                  available_slot = snapshot.data[0]['total_slot'];
                }
                double percentage = 0;
                if (snapshot.data[0]['available_slot'] != null) {
                  percentage = (snapshot.data[0]['available_slot'] /
                      snapshot.data[0]['total_slot']);
                }
                DateTime dateTimeCreatedAt =
                    DateTime.parse(snapshot.data[0]['start_datetime']);
                DateTime dateTimeNow =
                    DateTime.parse(snapshot.data[0]['end_datetime']);
                final differenceInDays =
                    dateTimeNow.difference(dateTimeCreatedAt).inDays;
                final differenceInHours =
                    dateTimeNow.difference(dateTimeCreatedAt).inHours;
                final differenceInMintues =
                    dateTimeNow.difference(dateTimeCreatedAt).inMinutes;
                String Duration = "";
                if (differenceInDays > 0) {
                  Duration = differenceInDays.toString() + " Days";
                } else if (differenceInHours > 0) {
                  Duration = differenceInHours.toString() + " Hrs";
                } else if (differenceInMintues > 0) {
                  Duration = differenceInMintues.toString() + " Min";
                }
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 20),
                      child: const Text(
                        'Note : Pay Entry fee to upload & participate in the contest',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${snapshot.data[0]['name']}',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            Row(
                              children: [
                                Text("Start in : "),
                                CountdownTimer(
                                  endTime: DateTime.parse(
                                          "${snapshot.data[0]['start_datetime']}")
                                      .millisecondsSinceEpoch,
                                ),
                              ],
                            ),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "Price Amount",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                    ),
                                  ),
                                  Text(
                                    "₹ ${snapshot.data[0]['amount']}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Contest Type",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                    ),
                                  ),
                                  Text(
                                    snapshot.data[0]['category_name'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Duration",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                    ),
                                  ),
                                  Text(
                                    "${Duration}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                    ),
                                  )
                                ],
                              ),
                              Column(children: [
                                const Text(
                                  "Available Slots",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: "SFPRO regular",
                                  ),
                                ),
                                Text(
                                  "${available_slot}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: "SFPRO regular",
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Slots",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "SFPRO regular",
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 10,
                        child: LinearProgressIndicator(
                          value: percentage, // percent filled
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xffffa300)),
                          backgroundColor:
                              const Color.fromARGB(255, 207, 207, 207),
                        ),
                      ),
                    ),
                    if (available_slot > 0 && !isPaid)
                      Visibility(
                        visible: pay,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(5, 20, 5, 20),
                          child: ElevatedButton(
                              onPressed: () => openCheckout(
                                  snapshot.data[0]['amount'],
                                  snapshot.data[0]['name'].toString(),
                                  snapshot.data[0]['id']),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Pay ₹ ${snapshot.data[0]['amount']}",
                                  style: const TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffffa300),
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ))),
                        ),
                      ),
                    Visibility(
                      visible: upload,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
                        child: ElevatedButton(
                            onPressed: () async {
                              final result =
                                  await FilePicker.platform.pickFiles();

                              if (result == null) return;
                              final file = result.files.first;
                              if (file != null) {
                                createAlbum(file, snapshot.data[0]['id']);
                              }
                              print('${file.name}');
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                              child: isLoading
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,

                                      // as elevated button gets clicked we will see text"Loading..."
                                      // on the screen with circular progress indicator white in color.
                                      //as loading gets stopped "Submit" will be displayed
                                      children: const [
                                        Text(
                                          'Loading...',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ],
                                    )
                                  : const Text(
                                      "Upload",
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xffffa300),
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ))),
                      ),
                    )
                  ],
                );
              }
            }),
      )),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(FontAwesomeIcons.home),
      //       label: 'Home',
      //       backgroundColor: Color.fromARGB(255, 255, 255, 255),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.star),
      //       label: 'My Watch',
      //       backgroundColor: Colors.green,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.rss),
      //       label: 'Feed',
      //       backgroundColor: Colors.purple,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.boxesStacked),
      //       label: 'Others',
      //       backgroundColor: Colors.pink,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.user),
      //       label: 'Profile',
      //       backgroundColor: Colors.pink,
      //     ),
      //   ],
      //   selectedItemColor: Color.fromARGB(255, 0, 0, 0),
      //   unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
      //   showUnselectedLabels: true,
      //   iconSize: 35,
      // ),
    );
  }
}
