import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'Setting_edit.dart';
import 'package:file_picker/file_picker.dart';
import 'Appbar.dart';
import 'mydrawer.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class Notifications extends StatefulWidget {
  const Notifications({
    Key? key,
  }) : super(key: key);

  @override
  State<Notifications> createState() => _Notifications();
}

class _Notifications extends State<Notifications> {
  int counter = 2;
  String _title = "Notifications";
  final storage = new LocalStorage('my_data');
  String useremail = "test@gmail.com";
  String gender = "Male";
  @override
  void initState() {
    super.initState();
    futureAlbum = loaddata();
  }

  late Future<List<dynamic>> futureAlbum;
  Future<List<dynamic>> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    final response = await http.get(
      Uri.parse(
          '${dotenv.env['API_URL']}/api/get_notification_of_users/${user_id}'),
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
        setState(() {});
      }
    } else {}

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
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String strDigits(int n) => n.toString().padLeft(2, '0');

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: CustomAppBar(title: _title),
        //     child: AppBar(
        //       // leading: Column(
        //       //   mainAxisAlignment: MainAxisAlignment.end,
        //       //   children: [
        //       //     IconButton(
        //       //       icon: const Icon(Icons.arrow_back, color: Colors.white),
        //       //       onPressed: () => Navigator.of(context).pop(),
        //       //     ),
        //       //   ],
        //       // ),
        //       title: Container(
        //         margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           crossAxisAlignment: CrossAxisAlignment.end,
        //           children: [
        //             Text(_title,style: TextStyle(
        //                   fontSize: 20,
        //                 ),
        //             ),

        //           ],
        //         ),
        //       ),
        //       actions: <Widget>[
        //   // Using Stack to show Notification Badge
        //    Column(
        //      mainAxisAlignment: MainAxisAlignment.end,
        //      children: [
        //        Container(
        //          margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
        //          child: Stack(
        //           children: <Widget>[
        //              IconButton(icon: Icon(Icons.notifications,size: 30,), onPressed: () {
        //               setState(() {
        //                 counter = 0;
        //               });
        //             }),
        //              Positioned(
        //               right: 11,
        //               top: 11,
        //               child:  Container(
        //                 padding: const EdgeInsets.all(2),
        //                 decoration:  BoxDecoration(
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
        //   ),
        //        ),
        //      ],
        //    ),
        // ],
        //       centerTitle: true,
        //       toolbarHeight:100,
        //       backgroundColor: const Color(0xff1042aa),
        //     ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder(
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
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 5, 10, 10),
                                            child: CircleAvatar(
                                              radius: 30.0,
                                              child: CachedNetworkImage(
                                                imageUrl: snapshot.data[index]
                                                            ["profile_pic"] !=
                                                        ""
                                                    ? "${dotenv.env['API_URL']}/public/profile_pic/${snapshot.data[index]["profile_pic"]}"
                                                    : 'https://picsum.photos/200',
                                                imageBuilder:
                                                    (context, imageProvider) =>
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
                                                errorWidget:
                                                    (context, url, error) =>
                                                        new Icon(Icons.error),
                                                maxHeightDiskCache: 200,
                                                maxWidthDiskCache: 500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 0),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Text(
                                                  snapshot.data[index]["name"],
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily:
                                                          "SFPRO semibold"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 5, 0, 0),
                                              child: Text(
                                                snapshot.data[index]
                                                    ["description"],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "SFPRO light"),
                                              ),
                                            ),
                                            // Container(
                                            //   margin: EdgeInsets.fromLTRB(
                                            //       10, 10, 0, 0),
                                            //   child: Text(
                                            //     "02/05/2022 21:15",
                                            //     style: TextStyle(
                                            //         fontSize: 16,
                                            //         fontFamily: "SFPRO light"),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                                    child: Divider(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              );
                            });
                      }
                    }),
              ]),
        ),
      ),
      drawer: Drawer(child: DrawerWidget()),
    );
  }
}
