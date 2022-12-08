import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'Dashboard.dart';
import 'Setting_edit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'Contest.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'Login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Appbar.dart';
import 'mydrawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Terms_condition extends StatefulWidget {
  const Terms_condition({
    Key? key,
  }) : super(key: key);

  @override
  State<Terms_condition> createState() => _Terms_condition();
}

class _Terms_condition extends State<Terms_condition> {
  int counter = 2;
  String _title = "Terms and Conditions";
  final storage = new LocalStorage('my_data');
  String useremail = "test@gmail.com";
  String gender = "Male";
  @override
  void initState() {
    super.initState();
    futureAlbum = loaddata();
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

  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  Future<Map<String, dynamic>> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final response = await http.get(
      Uri.parse('${dotenv.env['API_URL']}/api/cms_details/terms'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
        //'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjYxMDY0MjkzLCJleHAiOjE2NjEwNjc4OTMsIm5iZiI6MTY2MTA2NDI5MywianRpIjoiNHZ3NXpoSWY4WEFuajJQZyIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.2uRgNx36JrNZzlezxQ7qfkqNsL8ydwxyZPCFUTgDsW',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['status'];
      if (jsonData == true) {
        return jsonDecode(response.body)['data'];
      } else {
        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        });
      }
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  late Future<Map<String, dynamic>> futureAlbum;

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String strDigits(int n) => n.toString().padLeft(2, '0');

    return Scaffold(
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
            child: FutureBuilder(
                future: futureAlbum,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Html(
                              data: "${snapshot.data['description']}",
                            )
                          ]),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                })),
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
        drawer: Drawer(child: DrawerWidget()));
  }
}
