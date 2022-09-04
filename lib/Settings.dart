import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'Setting_edit.dart';
import 'mydrawer.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'Changepassword.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Settings extends StatefulWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  int counter = 2;
  bool loading = true;
  String _title = "Settings";
  final storage = new LocalStorage('my_data');
  String useremail = "";
  String gender = "Gender";
  String dropdownvalue = '';
  String name = "";
  String user_type = "";
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
          useremail = jsonData['email'];
          dropdownvalue = jsonData['gender'];
          name = jsonData['name'];
          user_type = jsonData['user_type'];
        });
      }
    } else {}
    setState(() {
        loading = false;
      });
    return jsonDecode(response.body)['data'];
  }

  late Future<Map<String, dynamic>> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = loaddata();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String strDigits(int n) => n.toString().padLeft(2, '0');

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.10),
          child: AppBar(
            // leading: Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     IconButton(
            //       icon: const Icon(Icons.arrow_back, color: Colors.white),
            //       onPressed: () => Navigator.of(context).pop(),
            //     ),
            //   ],
            // ),
            title: Center(
              child: Text(
                _title,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            actions: <Widget>[
              // Using Stack to show Notification Badge
              Center(
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
                            setState(() {
                              counter = 0;
                            });
                          }),
                      Positioned(
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
                          child: const Text(
                            '1',
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
            ],
            centerTitle: true,
            toolbarHeight: 100,
            backgroundColor: const Color(0xff1042aa),
          ),
        ),
        body: Column(
          children: [
            if (loading)
              Center(
                child: CircularProgressIndicator(),
              ),
            if (!loading)
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: const Text(
                          "Name",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "SFPRO regular"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Text(
                          name,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 107, 106, 106),
                              fontSize: 16,
                              fontFamily: "SFPRO regular"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: const Text(
                          "Email",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "SFPRO regular"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Text(
                          useremail,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 107, 106, 106),
                              fontSize: 16,
                              fontFamily: "SFPRO regular"),
                        ),
                      ),
                      // Container(
                      //    margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      //   child: const Text("Date of Birth",style:
                      //     TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 18,
                      //       fontFamily: "SFPRO regular"
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //    margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      //   child: const Text("10-02-2022",style :
                      //      TextStyle(
                      //       color: Color.fromARGB(255, 107, 106, 106),
                      //       fontSize: 16,
                      //       fontFamily: "SFPRO regular"
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Text(
                          gender,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "SFPRO regular"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Text(
                          dropdownvalue,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 107, 106, 106),
                              fontSize: 16,
                              fontFamily: "SFPRO regular"),
                        ),
                      ),
                      // Container(
                      //    margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      //   child: const Text("Pancard",style:
                      //     TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 18,
                      //       fontFamily: "SFPRO regular"
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //    margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      //   child: const Text("ASFH10234",style :
                      //      TextStyle(
                      //       color: Color.fromARGB(255, 107, 106, 106),
                      //       fontSize: 16,
                      //       fontFamily: "SFPRO regular"
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: const Text(
                          "Password",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "SFPRO regular"),
                        ),
                      ),
                      if (user_type == "normal")
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Changepassword()),
                                  );
                                },
                                child: const Text(
                                  "change password",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 109, 201),
                                    fontSize: 16,
                                    fontFamily: "SFPRO regular",
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (user_type == "normal")
                        Container(
                          width: width * 0.90,
                          height: height * 0.07,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Settings_edit()),
                                );
                              },
                              child: const Text(
                                "Edit",
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
          ],
        ),
        drawer: DrawerWidget());
  }
}
