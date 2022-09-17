import 'package:flutter/material.dart';
import 'package:pixzaro/Dashboard.dart';
import 'Mybalance.dart';
import 'Find_my_friends.dart';
import 'Refer_earn.dart';
import './Settings.dart';
import 'Help_support.dart';
import 'Terms_condition.dart';
import 'About.dart';
import 'Login.dart';
import 'Profile.dart';
import 'MyProfile.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:localstorage/localstorage.dart';
import 'google_signin.dart';
import 'Notifications.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'mydrawer.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class CustomAppBar extends StatelessWidget {
   int counter = 2;
  final storage = new LocalStorage('my_data');
  String? user_type;
  String title;
  CustomAppBar({ required this.title});
    @override
  void initState() {
    loaddata();
  }
  int unread_count = 0;
  void loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    final response = await http.get(
      Uri.parse('${dotenv.env['API_URL']}/api/get_notification_of_users/${user_id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['data'];
      unread_count = jsonDecode(response.body)['unread_count'];
      print(jsonData);
      return jsonData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Text(
        //       _title,
        //       style: TextStyle(
        //         fontSize: 20,
        //       ),
        //     ),
        //   ],
        // ),
      ),
      actions: <Widget>[
        // Using Stack to show Notification Badge
        Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Notifications()),
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Stack(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.notifications,
                        size: 30,
                      ),
                      onPressed: () {
                        
                      }),
                  if(unread_count > 0) Positioned(
                    right: 11,
                    top: 11,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child:  Text(
                        '${unread_count}',
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
        ),
      ],
      centerTitle: true,
      toolbarHeight: 100,
      backgroundColor: const Color(0xff1042aa),
    );
  }
}
