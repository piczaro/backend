import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class Comments extends StatefulWidget {
  final int id;

  const Comments({Key? key, required this.id}) : super(key: key);

  @override
  State<Comments> createState() => _Comments();
}

class _Comments extends State<Comments> {
  final storage = LocalStorage('my_data');
  late String username = "";
  String? photoUrl;
  TextEditingController textarea = TextEditingController();
  final dateFormate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  int counter = 2;
  late Future<List<dynamic>> futureAlbum;
  void initState() {
    super.initState();
    username = storage.getItem('username');

    futureAlbum = loaddata();
  }

  TextEditingController userInput = TextEditingController();
  bool isLoading = false;
  Future<http.Response?> createAlbum() async {
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    Map<String, dynamic> jsonMap_body = {
      "user_id": user_id,
      "comments": userInput.text
    };
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/api/participant_comments/${widget.id}'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
        body: json.encode(jsonMap_body),
      );
      if (response.statusCode == 200) {
        var post = jsonDecode(response.body);
        if (post['message'] == "Comment Added Successfully") {
          Fluttertoast.showToast(
              msg: post['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Color.fromARGB(255, 71, 184, 5),
              textColor: Color.fromARGB(255, 255, 255, 255));
        }
        print(post);
        Future.delayed(const Duration(milliseconds: 1000), () {
          setState(() {
            isLoading = false;
            futureAlbum = loaddata();
          });
        });
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(
            msg: "Invalid login details",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
      } else {
        throw Exception('Failed to create album.');
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

  Future<List<dynamic>> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    final username = await storage.getItem('username');

    final response = await http.get(
      Uri.parse(
          '${dotenv.env['API_URL']}/api/get_participant_comments/${widget.id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['data'];
      // print(jsonData);
      return jsonData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.10),
        child: AppBar(
          leading: Center(
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          title: Center(
            child: Text(
              "Comments",
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: 100,
                  // decoration: BoxDecoration(
                  //   color: Colors.grey,
                  // ),
                  child: CircleAvatar(
                    radius: 30.0,
                    child: CachedNetworkImage(
                      imageUrl: photoUrl != null
                          ? '${photoUrl}'
                          : 'https://picsum.photos/200',
                      imageBuilder: (context, imageProvider) => Container(
                        width: 110.0,
                        height: 110.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.fill),
                        ),
                      ),
                      placeholder: (context, url) =>
                          new CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                      maxHeightDiskCache: 200,
                      maxWidthDiskCache: 500,
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(child: Text("${username}")),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(
                                  dateFormate,
                                  style: TextStyle(
                                      fontFamily: 'SFPRO regular',
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: width * 0.60,
                            child: TextField(
                              controller: userInput,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 145, 145, 145),
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 145, 145, 145),
                                      width: 1.0),
                                ),
                              ),
                              // onSaved: (String? value) {
                              //   // This optional block of code can be used to run
                              //   // code when the user saves the form.
                              // },
                              // onChanged: (value) {
                              //   setState(() {
                              //     userInput.text = value.toString();
                              //   });
                              // },
                              // validator: (String? value) {

                              //   return (value != null && value.contains('@'))
                              //       ? 'Do not use the @ char.'
                              //       : null;
                              // },
                            ),
                          ),
                          Container(
                            width: width * 0.60,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      createAlbum();
                                    },
                                    child: isLoading
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,

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
                                        : const Text(" Post ",
                                            style: TextStyle(
                                              fontSize: 20,
                                            )),
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color(0xffffa300),
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ))),
                              ],
                            ),
                          )
                        ])),
              ],
            ),
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
                        "No Comments",
                        style: TextStyle(fontSize: 20),
                      ));
                    }
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          // print(snapshot.data[index]);
                          return Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      margin:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      width: 100,
                                      // decoration: BoxDecoration(
                                      //   color: Colors.grey,
                                      // ),
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        child: CachedNetworkImage(
                                          imageUrl: snapshot.data[index]['photoUrl']  != null
                                              ? snapshot.data[index]['photoUrl']
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
                                          errorWidget: (context, url, error) =>
                                              new Icon(Icons.error),
                                          maxHeightDiskCache: 200,
                                          maxWidthDiskCache: 500,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: Text(
                                                "${snapshot.data[index]['user_name']}")),
                                        Container(
                                          width: width * 0.60,
                                          margin: EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          child: Flexible(
                                            child: Text(
                                              "${snapshot.data[index]['comments']}",
                                              style: TextStyle(
                                                  fontFamily: 'SFPRO regular',
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                  }
                }),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(FontAwesomeIcons.home),
      //       label: 'Home',
      //       backgroundColor: Color.fromARGB(255, 255, 255, 255),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.star),
      //       label: 'My Match',
      //       backgroundColor: Colors.green,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.rss),
      //       label: 'Feed',
      //       backgroundColor: Colors.purple,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.boxesStacked),
      //       label: 'Others',
      //       backgroundColor: Colors.pink,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.user),
      //       label: 'Profile',
      //       backgroundColor: Colors.pink,
      //     ),
      //   ],
      //   selectedItemColor: Color.fromARGB(255, 0, 0, 0),
      //   unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
      //   showUnselectedLabels: true,
      //   iconSize: 35,
      // ),
    );
  }
}
