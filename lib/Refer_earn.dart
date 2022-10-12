import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'Dashboard.dart';
import 'Setting_edit.dart';
import 'package:file_picker/file_picker.dart';
import 'Change_bank_account.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'mydrawer.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Appbar.dart';
class Refer_earn extends StatefulWidget {
  const Refer_earn({
    Key? key,
  }) : super(key: key);

  @override
  State<Refer_earn> createState() => _Refer_earn();
}

class _Refer_earn extends State<Refer_earn> {
  int counter = 2;
  late Future<int> futureAlbum;
  String _title = "Refer & Earn";
  final storage = new LocalStorage('my_data');
  String referal_code = "";
  String useremail = "test@gmail.com";
  String gender = "Male";
  @override
  void initState() {
    changeState();
    futureAlbum = loaddata();
  }

  void changeState() async {
    await storage.ready;
    var Getreferal_code = await storage.getItem("referal_code");
    setState(() {
      referal_code = Getreferal_code;
    });
  }

  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  Future<int> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    final response = await http.get(
      Uri.parse(
          '${dotenv.env['API_URL']}/api/check_referral_balance/${user_id}'),
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
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String strDigits(int n) => n.toString().padLeft(2, '0');

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
      body: SingleChildScrollView(
        child: FutureBuilder<int>(
          future: futureAlbum, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                ));
              default:
                if (snapshot.hasError) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                } else {
                  return Container(
                    width: width,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 200,
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Image.network(
                                'https://via.placeholder.com/300X180'),
                          ),
                          Container(
                            width: width * 0.60,
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              "Refer to your Friend and to get reward of ₹ 100.00",
                              style: TextStyle(
                                  fontSize: 18, fontFamily: "SFPRO semibold"),
                            ),
                          ),
                          Container(
                            width: width * 0.90,
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text(
                              "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.",
                              style: TextStyle(
                                  fontSize: 18, fontFamily: "SFPRO reqular"),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(17, 10, 10, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Referral Code",
                                  style: TextStyle(
                                      fontSize: 22, fontFamily: "SFPRO BOLD"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(17, 10, 10, 10),
                                  width: width * 0.70,
                                  child: Text(
                                    "${referal_code}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "SFPRO semibold"),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Clipboard.setData(new ClipboardData(
                                            text: referal_code))
                                        .then((_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Referral code copied')));
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        17, 10, 10, 10),
                                    child: Icon(
                                      FontAwesomeIcons.copy,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(17, 10, 10, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Referral bonus earned ₹ ${snapshot.data}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "SFPRO reqular"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(17, 10, 10, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Share to",
                                  style: TextStyle(
                                      fontSize: 22, fontFamily: "SFPRO BOLD"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(17, 10, 10, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  FontAwesomeIcons.line,
                                  color: Color.fromARGB(255, 58, 160, 49),
                                  size: 40,
                                ),
                                Icon(
                                  FontAwesomeIcons.twitterSquare,
                                  color: Color.fromARGB(255, 116, 193, 255),
                                  size: 40,
                                ),
                                Icon(
                                  FontAwesomeIcons.facebookSquare,
                                  color: Color.fromARGB(255, 7, 106, 187),
                                  size: 40,
                                ),
                                Icon(
                                  FontAwesomeIcons.whatsappSquare,
                                  color: Color.fromARGB(255, 81, 201, 26),
                                  size: 40,
                                ),
                                Text(
                                  "More...",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "SFPRO BOLD",
                                      color: Color(0xffffa300)),
                                )
                              ],
                            ),
                          ),
                        //   Container(
                        //     margin: const EdgeInsets.fromLTRB(17, 10, 10, 10),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           "Your Invited Friends in Piczaro",
                        //           style: TextStyle(
                        //               fontSize: 18,
                        //               fontFamily: "SFPRO reqular"),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        //   Container(
                        //     margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        //     child: TextField(
                        //       decoration: InputDecoration(
                        //           suffixIcon: Material(
                        //             color: Color(0xffffa300),
                        //             shadowColor: Color(0xffffa300),
                        //             child:
                        //                 Icon(Icons.search, color: Colors.white),
                        //           ),
                        //           border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(1.0),
                        //           ),
                        //           contentPadding: EdgeInsets.fromLTRB(
                        //               20.0, 10.0, 20.0, 10.0),
                        //           enabledBorder: OutlineInputBorder(
                        //               borderRadius: BorderRadius.circular(5.0),
                        //               borderSide: BorderSide(
                        //                   color: Colors.black, width: 1.0))),
                        //     ),
                        //   ),
                        //   Container(
                        //     margin: const EdgeInsets.fromLTRB(17, 5, 10, 0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           "4 Results Found",
                        //           style: TextStyle(
                        //               fontSize: 16,
                        //               fontFamily: "SFPRO reqular"),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        //   Container(
                        //     margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       boxShadow: [
                        //         new BoxShadow(
                        //           color: Color.fromARGB(255, 218, 217, 217),
                        //           blurRadius: 20.0,
                        //         ),
                        //       ],
                        //     ),
                        //     child: Container(
                        //       width: width * 0.90,
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           GestureDetector(
                        //             onTap: () {},
                        //             child: Container(
                        //               margin:
                        //                   EdgeInsets.fromLTRB(10, 5, 10, 10),
                        //               child: CircleAvatar(
                        //                 radius: 30.0,
                        //                 backgroundImage: NetworkImage(
                        //                     'https://via.placeholder.com/120'),
                        //                 backgroundColor: Colors.transparent,
                        //               ),
                        //             ),
                        //           ),
                        //           Column(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               Container(
                        //                 margin:
                        //                     EdgeInsets.fromLTRB(10, 10, 10, 0),
                        //                 child: GestureDetector(
                        //                   onTap: () {},
                        //                   child: Text(
                        //                     "Saranya",
                        //                     style: TextStyle(
                        //                         fontSize: 18,
                        //                         fontFamily: "SFPRO semibold"),
                        //                   ),
                        //                 ),
                        //               ),
                        //               Container(
                        //                 margin:
                        //                     EdgeInsets.fromLTRB(10, 5, 0, 0),
                        //                 child: Text(
                        //                   "456 Followers",
                        //                   style: TextStyle(
                        //                       fontSize: 18,
                        //                       fontFamily: "SFPRO semibold"),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           Container(
                        //             margin: const EdgeInsets.fromLTRB(
                        //                 30, 15, 0, 10),
                        //             width: width * 0.25,
                        //             height: height * 0.05,
                        //             child: ElevatedButton(
                        //                 onPressed: () {},
                        //                 child: const Text(
                        //                   "Follow",
                        //                   style: TextStyle(
                        //                     fontSize: 20,
                        //                   ),
                        //                 ),
                        //                 style: ElevatedButton.styleFrom(
                        //                     primary: const Color(0xffffa300),
                        //                     padding: const EdgeInsets.fromLTRB(
                        //                         0, 0, 0, 0),
                        //                     shape: RoundedRectangleBorder(
                        //                       borderRadius:
                        //                           BorderRadius.circular(20.0),
                        //                     ))),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        //   Container(
                        //     margin: EdgeInsets.fromLTRB(0, 15, 0, 40),
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       boxShadow: [
                        //         new BoxShadow(
                        //           color: Color.fromARGB(255, 218, 217, 217),
                        //           blurRadius: 20.0,
                        //         ),
                        //       ],
                        //     ),
                        //     child: Container(
                        //       width: width * 0.90,
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           GestureDetector(
                        //             onTap: () {},
                        //             child: Container(
                        //               margin:
                        //                   EdgeInsets.fromLTRB(10, 5, 10, 10),
                        //               child: CircleAvatar(
                        //                 radius: 30.0,
                        //                 backgroundImage: NetworkImage(
                        //                     'https://via.placeholder.com/120'),
                        //                 backgroundColor: Colors.transparent,
                        //               ),
                        //             ),
                        //           ),
                        //           Column(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               Container(
                        //                 margin:
                        //                     EdgeInsets.fromLTRB(10, 10, 10, 10),
                        //                 child: GestureDetector(
                        //                   onTap: () {},
                        //                   child: Text(
                        //                     "Saranya",
                        //                     style: TextStyle(
                        //                         fontSize: 18,
                        //                         fontFamily: "SFPRO semibold"),
                        //                   ),
                        //                 ),
                        //               ),
                        //               Container(
                        //                 margin:
                        //                     EdgeInsets.fromLTRB(10, 5, 0, 0),
                        //                 child: Text(
                        //                   "456 Followers",
                        //                   style: TextStyle(
                        //                       fontSize: 18,
                        //                       fontFamily: "SFPRO semibold"),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           Container(
                        //             margin: const EdgeInsets.fromLTRB(
                        //                 30, 15, 0, 10),
                        //             width: width * 0.25,
                        //             height: height * 0.05,
                        //             child: ElevatedButton(
                        //                 onPressed: () {},
                        //                 child: const Text(
                        //                   "Follow",
                        //                   style: TextStyle(
                        //                     fontSize: 20,
                        //                   ),
                        //                 ),
                        //                 style: ElevatedButton.styleFrom(
                        //                     primary: const Color(0xffffa300),
                        //                     padding: const EdgeInsets.fromLTRB(
                        //                         0, 0, 0, 0),
                        //                     shape: RoundedRectangleBorder(
                        //                       borderRadius:
                        //                           BorderRadius.circular(20.0),
                        //                     ))),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // 
                        ]),
                  );
                }
            }
          },
        ),
      ),
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
