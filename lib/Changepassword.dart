import 'package:flutter/material.dart';
import 'mydrawer.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Appbar.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({
    Key? key,
  }) : super(key: key);

  @override
  State<Changepassword> createState() => _Changepassword();
}

class _Changepassword extends State<Changepassword> {
  String _title = "Settings";
  int counter = 2;
  bool isLoading = false;
  // String useremail = "testmail@gmail.com";
  String gender = "Male";
  String dropdownvalue = 'Male';
  // String userName = "sfdsdf";
  Future<Map<String, dynamic>> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    final response = await http.get(
      Uri.parse('${dotenv.env['API_URL']}/api/user_details/${user_id}'),
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
      if (jsonData != null) {
        setState(() {
          // userEmail.text = jsonData['email'];
          // dropdownvalue = jsonData['gender'];
          // userName.text = jsonData['name'];
        });
      }
    } else {}
    return jsonDecode(response.body)['data'];
  }

  late Future<Map<String, dynamic>> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = loaddata();
  }

  // List of items in our dropdown menu
  var items = [
    'Male',
    'Female',
    'Mixed',
  ];
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController currentPassword = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();
  TextEditingController NewPassword = TextEditingController();
  void changePassword() async {
    Map<String, dynamic> jsonMap_body = {"password": NewPassword.text};
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    setState(() {
      isLoading = true;
    });
    final response = await http.post(
      Uri.parse('${dotenv.env['API_URL']}/api/change_password/${user_id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: json.encode(jsonMap_body),
    );
    if (response.statusCode == 200) {
      var post = jsonDecode(response.body);
      print(post);
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(
          msg: post['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 38, 131, 15),
          textColor: Color.fromARGB(255, 255, 255, 255));
    }
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.08),
          child: CustomAppBar(title: _title,),
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
          //   title: Center(
          //     child: Text(
          //       _title,
          //       style: TextStyle(
          //         fontSize: 20,
          //       ),
          //     ),
          //   ),
          //   actions: <Widget>[
          //     // Using Stack to show Notification Badge
          //     Center(
          //       child: Container(
          //         margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
          //         child: Stack(
          //           children: <Widget>[
          //             IconButton(
          //                 icon: Icon(
          //                   Icons.notifications,
          //                   size: 30,
          //                 ),
          //                 onPressed: () {
          //                   setState(() {
          //                     counter = 0;
          //                   });
          //                 }),
          //             Positioned(
          //               right: 11,
          //               top: 11,
          //               child: Container(
          //                 padding: const EdgeInsets.all(2),
          //                 decoration: BoxDecoration(
          //                   color: Colors.red,
          //                   borderRadius: BorderRadius.circular(6),
          //                 ),
          //                 constraints: const BoxConstraints(
          //                   minWidth: 18,
          //                   minHeight: 18,
          //                 ),
          //                 child: const Text(
          //                   '1',
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 12,
          //                   ),
          //                   textAlign: TextAlign.center,
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          //   centerTitle: true,
          //   toolbarHeight: 100,
          //   backgroundColor: const Color(0xff1042aa),
          // ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Form(
              key: formGlobalKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: const Text(
                        "Current Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "SFPRO regular"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: TextFormField(
                        obscureText: true,
                        controller: currentPassword,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontFamily: 'SFPRO regular'),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff979197), width: 1.5),
                          ),
                          hintText: 'Current Password',
                          hintStyle: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'SFPRO reqular',
                              color: Color.fromARGB(255, 104, 104, 104)),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(
                              Icons.vpn_key,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        validator: (val) {
                          if (val != '') {
                            setState(() {
                              // password = val!;
                            });
                          }

                          return val!.isEmpty
                              ? 'please enter current password'
                              : null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: const Text(
                        "New Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "SFPRO regular"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: TextFormField(
                        obscureText: true,
                        controller: NewPassword,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontFamily: 'SFPRO regular'),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff979197), width: 1.5),
                          ),
                          hintText: 'New Password',
                          hintStyle: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'SFPRO reqular',
                              color: Color.fromARGB(255, 104, 104, 104)),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(
                              Icons.vpn_key,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        validator: (val) {
                          if (val != '') {
                            setState(() {
                              // password = val!;
                            });
                          }

                          return val!.isEmpty
                              ? 'please enter a password'
                              : null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: const Text(
                        "Confirm New Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "SFPRO regular"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: TextFormField(
                        obscureText: true,
                        controller: ConfirmPassword,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontFamily: 'SFPRO regular'),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff979197), width: 1.5),
                          ),
                          hintText: 'Confirm New Password',
                          hintStyle: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'SFPRO reqular',
                              color: Color.fromARGB(255, 104, 104, 104)),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(
                              Icons.vpn_key,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        validator: (val) {
                          if (val != NewPassword.text) {
                            return 'Password Not match';
                          } else {}

                          return val!.isEmpty
                              ? 'please enter confirm password'
                              : null;
                        },
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    //   child: const Text(
                    //     "Date of Birth",
                    //     style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 18,
                    //         fontFamily: "SFPRO regular"),
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    //   child: const Text(
                    //     "10-02-2022",
                    //     style: TextStyle(
                    //         color: Color.fromARGB(255, 107, 106, 106),
                    //         fontSize: 16,
                    //         fontFamily: "SFPRO regular"),
                    //   ),
                    // ),

                    // Container(
                    //   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    //   child: const Text(
                    //     "Male",
                    //     style: TextStyle(
                    //         color: Color.fromARGB(255, 107, 106, 106),
                    //         fontSize: 16,
                    //         fontFamily: "SFPRO regular"),
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    //   child: const Text(
                    //     "Pancard",
                    //     style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 18,
                    //         fontFamily: "SFPRO regular"),
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    //   child: const Text(
                    //     "ASFH10234",
                    //     style: TextStyle(
                    //         color: Color.fromARGB(255, 107, 106, 106),
                    //         fontSize: 16,
                    //         fontFamily: "SFPRO regular"),
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      width: width * 0.90,
                      height: height * 0.07,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formGlobalKey.currentState!.validate()) {
                              changePassword();
                            }
                          },
                          child: isLoading
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

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
                                  "Save",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffffa300),
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          )),
                    ),
                  ]),
            ),
          ),
        ),
        drawer: DrawerWidget());
  }
}
