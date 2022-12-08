import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'Dashboard.dart';
import 'Setting_edit.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'Changepassword.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'mydrawer.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';
import 'Appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Help_support extends StatefulWidget {
  const Help_support({
    Key? key,
  }) : super(key: key);

  @override
  State<Help_support> createState() => _Help_support();
}

class _Help_support extends State<Help_support> {
  bool isLoading = false;
  int counter = 2;
  String _title = "Help and Support";
  final storage = new LocalStorage('my_data');
  String useremail = "";
  String gender = "Male";
  @override
  void initState() {
    loaddata();
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

  Future<Map<String, dynamic>> loaddata() async {
    setState(() {
      isLoading = true;
    });
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
          useremail = jsonData['email'];
          dropdownvalue = jsonData['gender'];
          //userName.text = jsonData['name'];
        });
      }
    } else {}
    setState(() {
      isLoading = false;
    });
    return jsonDecode(response.body)['data'];
  }

  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  Future<http.Response?> createAlbum() async {
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
        Uri.parse('${dotenv.env['API_URL']}/api/create_support'),
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
      response.fields['description'] = desCription.text;
      if (file != null) {
        response.files
            .add(await http.MultipartFile.fromPath("file", file!.path));
      }

      var res = await response.send();
      // print(res.body);
      var streaMresponse = await http.Response.fromStream(res);
      print(streaMresponse.body);
      if (streaMresponse.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        var post = jsonDecode(streaMresponse.body);
        Fluttertoast.showToast(
            msg: post['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 33, 190, 59),
            textColor: Color.fromARGB(255, 255, 255, 255));
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

  File? file;
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController desCription = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController Subject = TextEditingController();
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
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: Form(
            key: formGlobalKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (isLoading)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  if (!isLoading)
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: const Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "SFPRO regular"),
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Text(useremail),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: const Text(
                      "Subject",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "SFPRO regular"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: TextFormField(
                      controller: Subject,
                      decoration:
                          InputDecoration(hintText: 'Enter Your Subject'),
                      validator: (val) {
                        if (val != '') {
                          setState(() {
                            // password = val!;
                          });
                        }

                        return val!.isEmpty ? 'Please enter a Subject' : null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      "Description",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "SFPRO regular"),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: desCription,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 5,
                        validator: (val) {
                          if (val != '') {
                            setState(() {
                              // password = val!;
                            });
                          }

                          return val!.isEmpty
                              ? 'Please enter a description'
                              : null;
                        },
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: width * 0.90,
                    child: ElevatedButton(
                        onPressed: () async {
                          final result = await FilePicker.platform.pickFiles();

                          if (result == null) return;
                          var file = result.files.first;
                          if (file != null) {
                            setState(() {
                              file = file;
                            });
                            // Navigator.push(
                            //       context,
                            //       MaterialPageRoute(builder: (context) => const Contested() )
                            // );
                          }
                          print('${file.name}');
                        },
                        child: const Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "Upload attachment",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "SFPRO regular",
                              color: Colors.black,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ))),
                  ),
                  Container(
                    width: width * 0.90,
                    height: height * 0.07,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formGlobalKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            createAlbum();
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
                                "Submit",
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
