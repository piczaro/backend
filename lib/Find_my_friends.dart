import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'Setting_edit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'mydrawer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Appbar.dart';
class Find_my_friends extends StatefulWidget {
  const Find_my_friends({
    Key? key,
  }) : super(key: key);

  @override
  State<Find_my_friends> createState() => _Find_my_friends();
}

class _Find_my_friends extends State<Find_my_friends> {
  Future<http.Response?> searchFriends(String name) async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    setState(() {
      isLoading = true;
    });
    final response = await http.get(
      Uri.parse('${dotenv.env['API_URL']}/api/find_my_users?name=${name}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    if (response.statusCode == 200) {
      var post = jsonDecode(response.body);
      print(post);
      setState(() {
        _foundUsers = post['data'];
      });
    }
  }

  // throw Exception('Failed to create album.');
  List<dynamic> _foundUsers = [];
  bool isLoading = false;
  int counter = 2;
  String _title = "Find Your Friends";
  final storage = new LocalStorage('my_data');
  String useremail = "test@gmail.com";
  String gender = "Male";

  @override
  void initState() {}

  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  late Future<List<dynamic>> futureAlbum;
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String strDigits(int n) => n.toString().padLeft(2, '0');

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 233, 233),
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
              margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 20, 10, 10),
                      child: TextField(
                        controller: myController,
                        decoration: InputDecoration(
                            suffixIcon: Material(
                                color: Color(0xffffa300),
                                shadowColor: Color(0xffffa300),
                                child: IconButton(
                                  onPressed: () =>{
                                     FocusScope.of(context).unfocus(),
                                     searchFriends(myController.text),
                                  },
                                      
                                  icon: Icon(Icons.search, color: Colors.white),
                                )),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0))),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Find Your Friends",
                        style: TextStyle(
                          color: Color.fromARGB(255, 68, 66, 66),
                          fontSize: 20,
                          fontFamily: "SFPRO BOLD",
                        ),
                      ),
                    ),
                   
                     _foundUsers.isNotEmpty
                        ?  ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: _foundUsers.length,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              // print(snapshot.data[index]);
                              return Container(
                                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Color.fromARGB(255, 160, 159, 159),
                                      blurRadius: 20.0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 7, 10, 7),
                                        child: CircleAvatar(
                                          radius: 30.0,
                                          child: CachedNetworkImage(
                                            imageUrl: _foundUsers[index]
                                                        ['photoUrl'] !=
                                                    null
                                                ? _foundUsers[index]['photoUrl']
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
                                          width: width * 0.65,
                                          margin: EdgeInsets.fromLTRB(
                                              10, 10, 10, 0),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Flexible(
                                              child: Text(
                                                _foundUsers[index]['username'],
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "SFPRO semibold"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.65,
                                          margin:
                                              EdgeInsets.fromLTRB(10, 5, 0, 0),
                                          child: Flexible(
                                            child: Text(
                                              _foundUsers[index]['email'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: "SFPRO semibold"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                             
                            })
                        : Column(
                          children: [
                             if(isLoading)Center(child: CircularProgressIndicator(),),
                            if(!isLoading)Center(
                                child: const Text(
                                  'No results found',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                          ],
                        ),
                        
                  ]))),
      drawer: DrawerWidget(),
    );
  }
}
