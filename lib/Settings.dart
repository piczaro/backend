import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'Setting_edit.dart';
import 'mydrawer.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'Changepassword.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
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
  String profile_pic = "";
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
          profile_pic = jsonData['profile_pic'];
        });
      }
    } else {}
    setState(() {
      loading = false;
    });
    return jsonDecode(response.body)['data'];
  }

  bool isLoading = false;
  Future<http.Response?> Profile_upload(file) async {
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
        Uri.parse('${dotenv.env['API_URL']}/api/profile_pic_update/${user_id}'),
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
      

      response.files.add(await http.MultipartFile.fromPath("profile_pic", file.path));
      var res = await response.send();
      // print(res.body);
      var streaMresponse = await http.Response.fromStream(res);
      final result = jsonDecode(streaMresponse.body) as Map<String, dynamic>;
      // print(streaMresponse.body);
      if (streaMresponse.statusCode == 200) {
        var jsonBodyData = streaMresponse.body;
        print(result['file']);

        setState(() {
          isLoading = false;
          profile_pic = result['file'];
        });
      }
    } catch (e) {}
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
                      if (user_type == "normal")
                        Center(
                          child: Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              width: width * 0.30,
                              height: height * 0.15,
                              child: CircleAvatar(
                                radius: 30.0,
                                child: CachedNetworkImage(
                                  imageUrl: profile_pic != ""
                                      ? "${dotenv.env['API_URL']}/profile_pic/${profile_pic}"
                                      : 'https://picsum.photos/200',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 110.0,
                                    height: 110.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      new CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      new Icon(Icons.error),
                                  maxHeightDiskCache: 200,
                                  maxWidthDiskCache: 500,
                                ),
                              )),
                        ),
                      if (user_type == "normal")
                        Container(
                          width: width * 0.90,
                          height: height * 0.07,
                          child: ElevatedButton(
                              onPressed: () async {
                                final result =
                                  await FilePicker.platform.pickFiles();

                              if (result == null) return;
                              final file = result.files.first;
                              if (file != null) {
                                Profile_upload(file);
                              }
                              },
                              child: const Text(
                                "Change Profile pic",
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
