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

class DrawerWidget extends StatelessWidget {
  final storage = new LocalStorage('my_data');
  String? user_type;
  @override
  void initState() async {
    // super.initState();
    user_type = await storage.getItem('user_type');
    print(user_type);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
      color: Color(0xff1042aa),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Mybalance()),
                );
              },
              child: Container(
                  width: width,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Icon(
                        Icons.money,
                        color: Colors.white,
                      ),
                      Text(
                        ' My Balance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
              child: Divider(color: Colors.grey),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Refer_earn()),
                );
              },
              child: Container(
                width: width,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Icon(
                        Icons.share_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        ' Refer & Earn',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )),
            ),
            // Container(
            //   margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
            //   child: Divider(color: Colors.grey),
            // ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const  Dashboard(index: 3,profileindex: 1,)),
            //     );
            //   },
            //   child: Container(
            //       margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            //       child: Wrap(
            //         crossAxisAlignment: WrapCrossAlignment.center,
            //         children: const [
            //           Icon(
            //             Icons.grade_outlined,
            //             color: Colors.white,
            //           ),
            //           Text(
            //             ' My Level',
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 18,
            //               fontFamily: "SFPRO regular",
            //             ),
            //           ),
            //         ],
            //       )),
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
              child: Divider(color: Colors.grey),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Find_my_friends()),
                );
              },
              child: Container(
                width: width,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Icon(
                        Icons.gps_fixed,
                        color: Colors.white,
                      ),
                      Text(
                        ' Find my Friends',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
              child: Divider(color: Colors.grey),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
              child: Container(
                width: width,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      Text(
                        ' My Settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
              child: Divider(color: Colors.grey),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Help_support()),
                );
              },
              child: Container(
                width: width,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Icon(
                        Icons.help_center,
                        color: Colors.white,
                      ),
                      Text(
                        ' Help Desk',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
              child: Divider(color: Colors.grey),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const About()),
                );
              },
              child: Container(
                width: width,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Icon(
                        Icons.account_box_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        ' About App',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
              child: Divider(color: Colors.grey),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Terms_condition()),
                );
              },
              child: Container(
                width: width,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Icon(
                        Icons.money_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        ' Terms & condition',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
              child: Divider(color: Colors.grey),
            ),
            InkWell(
              onTap: () async {
                user_type = await storage.getItem('user_type');
                if (user_type == 'google') {
                  await GoogleSignInApi.signout().whenComplete(() async {
                    await storage.deleteItem("jwt_token");
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (Route<dynamic> route) => false);
                  });
                } else {
                  await storage.deleteItem("jwt_token");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (Route<dynamic> route) => false);
                }
              },
              child: Container(
                width: width,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        ' Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
              child: Divider(color: Colors.grey),
            ),
          ]),
    );
  }
}
