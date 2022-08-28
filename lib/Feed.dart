import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'Comments.dart';
import 'User_profile.dart';
import 'package:http/http.dart' as http;
import 'Contest.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _Feed();
}

class _Feed extends State<Feed> {
  Future<List<dynamic>> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    final username = await storage.getItem('username');

    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/participant_listing/${user_id}'),
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

  late Future<List<dynamic>> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = loaddata();
  }

  int counter = 2;
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  List<int> list = [1, 2, 3, 4, 5];
  final List<Map<String, dynamic>> _statistics = [
    {'key': 'Flutter Tutorial', 'value': 90},
    {'key': 'Android Tutorial', 'value': 50, 'border': true},
    {'key': 'Java Tutorial', 'value': 30},
    {'key': 'sdfjsfjk', 'value': 70}
  ];
  Future<bool> onLikeButtonTapped(int likes, int participant_id) async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    Map<String, dynamic> jsonMap_body = {
      "user_id": user_id,
      "likes": likes,
      "favourites": 0,
      "hearts": 0
    };
    final response = await http.post(
      Uri.parse(
          'http://10.0.2.2:8000/api/participant_reactions/${participant_id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: json.encode(jsonMap_body),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var post = jsonDecode(response.body);

      // print(post);
    } else if (response.statusCode == 401) {
    } else {
      throw Exception('Failed to create album.');
    }
    return jsonDecode(response.body)['status'];
  }

  Future<bool> onsmileButtonTapped(int favourites, int participant_id) async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    Map<String, dynamic> jsonMap_body = {
      "user_id": user_id,
      "likes": 0,
      "favourites": favourites,
      "hearts": 0
    };
    final response = await http.post(
      Uri.parse(
          'http://10.0.2.2:8000/api/participant_reactions/${participant_id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: json.encode(jsonMap_body),
    );
    if (response.statusCode == 200) {
      var post = jsonDecode(response.body)['status'];
      // print(post);

    } else if (response.statusCode == 401) {
    } else {
      throw Exception('Failed to create album.');
    }
    return jsonDecode(response.body)['status'];
  }

  Future<bool> onheartButtonTapped(int hearts, int participant_id) async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    Map<String, dynamic> jsonMap_body = {
      "user_id": user_id,
      "likes": 0,
      "favourites": 0,
      "hearts": hearts
    };
    final response = await http.post(
      Uri.parse(
          'http://10.0.2.2:8000/api/participant_reactions/${participant_id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: json.encode(jsonMap_body),
    );
    if (response.statusCode == 200) {
      var post = jsonDecode(response.body)['status'];
    } else if (response.statusCode == 401) {
    } else {
      throw Exception('Failed to create album.');
    }
    return jsonDecode(response.body)['status'];
  }

  Future<http.Response?> userFollow(int id) async {
    Map<String, dynamic> jsonMap_body = {"following_id": id};
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');

    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/user_follow_create/${user_id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: json.encode(jsonMap_body),
    );
    if (response.statusCode == 200) {
      var post = jsonDecode(response.body);
      if (post['message'] == "Already Followed") {
        Fluttertoast.showToast(
            msg: post['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 224, 36, 36),
            textColor: Color.fromARGB(255, 255, 255, 255));
      } else {
        Fluttertoast.showToast(
            msg: post['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 37, 167, 48),
            textColor: Color.fromARGB(255, 255, 255, 255));
        setState(() {
          futureAlbum = loaddata();
        });
      }
      print(post);
    } else if (response.statusCode == 401) {
    } else {
      throw Exception('Failed to create album.');
    }
  }
  // Future<http.Response?> onLikeButtonTapped(
  //     int user_id, int likes, int favourites, int hearts) async {
  //   Map<String, dynamic> jsonMap_body = {
  //     "user_id": "16",
  //     "likes": likes,
  //     "favourites": favourites,
  //     "hearts": hearts
  //   };
  //   final response = await http.post(
  //     Uri.parse('http://10.0.2.2:8000/api/login'),
  //     headers: {
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json'
  //     },
  //     body: json.encode(jsonMap_body),
  //   );
  //    var post = jsonDecode(response.body);
  //   return post;
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: FutureBuilder(
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
                      bool favoirted = false;
                      bool hearts = false;
                      bool isliked = false;
                      if (snapshot.data[index]['favourites'] != null) {
                        if (snapshot.data[index]['favourites'] > 0) {
                          favoirted = true;
                          // print(favoirted);
                        }
                      } else {
                        favoirted = false;
                      }
                      if (snapshot.data[index]['hearts'] != null) {
                        if (snapshot.data[index]['hearts'] > 0) {
                          hearts = true;
                          // print(favoirted);
                        }
                      } else {
                        hearts = false;
                      }
                      if (snapshot.data[index]['likes'] != null) {
                        if (snapshot.data[index]['likes'] > 0) {
                          isliked = true;
                          // print(favoirted);
                        }
                      } else {
                        isliked = false;
                      }
                      // print(favoirted);
                      // print(snapshot.data[index]['favourites']);
                      return Column(children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const User_profile()),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 30.0,
                                  // backgroundImage:
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot.data[index]['photoUrl'] != null ? snapshot.data[index]['photoUrl'] : "https://via.placeholder.com/150",
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
                                  // NetworkImage(
                                  //     'https://via.placeholder.com/150'),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const User_profile()),
                                      );
                                    },
                                    child: Text(
                                      "${snapshot.data[index]['username']}",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: "SFPRO semibold"),
                                    ),
                                  ),
                                  Text(
                                    "${snapshot.data[index]['contest_name']}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "SFPRO semibold"),
                                  ),
                                  Text(
                                    "${snapshot.data[index]['image_uploaded_date']}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "SFPRO regular",
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              PopupMenuButton(
                                  initialValue: 2,
                                  child: Center(
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  itemBuilder: (_) {
                                    return [
                                      PopupMenuItem(
                                          value: 1,
                                          child: GestureDetector(
                                              onTap: () {
                                                userFollow(snapshot.data[index]
                                                    ['user_id']);
                                              },
                                              child: Text("Follow"))),
                                      PopupMenuItem(child: Text("Report"))
                                    ];
                                  },
                                  onSelected: (value) {
                                    if (value == 1) {
                                     userFollow(snapshot.data[index]
                                                    ['user_id']);
                                      // if value 2 show dialog
                                    } else if (value == 2) {
                                      
                                    }
                                  }),
                            ],
                          ),
                        ),
                        InkWell(
                          child: Container(
                            height: 200,
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: CachedNetworkImage(
                              placeholder: (context, url) => new Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                              imageUrl:
                                  'http://10.0.2.2:8000/participant_images/${snapshot.data[index]['image_path']}',
                              maxHeightDiskCache: 200,
                              maxWidthDiskCache: 500,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return Show_image();
                            }));
                          },
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: width * 0.50,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      LikeButton(
                                        onTap: ((isLiked) async {
                                          var message =
                                              await onLikeButtonTapped(
                                                  1,
                                                  snapshot.data[index]
                                                      ['participant_id']);

                                          if (!message) {
                                            return false;
                                          } else {
                                            return true;
                                          }
                                        }),
                                        size: 30,
                                        circleColor: const CircleColor(
                                            start: Color(0xff00ddff),
                                            end: Color(0xff0099cc)),
                                        bubblesColor: const BubblesColor(
                                          dotPrimaryColor: Color(0xff33b5e5),
                                          dotSecondaryColor: Color(0xff0099cc),
                                        ),
                                        likeBuilder: (bool isLiked) {
                                          return Icon(
                                            Icons.thumb_up,
                                            color: isLiked || isliked
                                                ? Color.fromARGB(
                                                    255, 2, 95, 182)
                                                : Colors.grey,
                                            size: 30,
                                          );
                                        },
                                      ),
                                      LikeButton(
                                        onTap: ((emojed) async {
                                          var message =
                                              await onsmileButtonTapped(
                                                  1,
                                                  snapshot.data[index]
                                                      ['participant_id']);
                                          if (!message) {
                                            return false;
                                          } else {
                                            return true;
                                          }
                                        }),
                                        size: 30,
                                        circleColor: const CircleColor(
                                            start: Color(0xff00ddff),
                                            end: Color(0xff0099cc)),
                                        bubblesColor: const BubblesColor(
                                          dotPrimaryColor: Color(0xff33b5e5),
                                          dotSecondaryColor: Color(0xff0099cc),
                                        ),
                                        likeBuilder: (bool emojed) {
                                          return Icon(
                                            Icons.emoji_emotions,
                                            color: emojed || favoirted
                                                ? Color.fromARGB(
                                                    255, 2, 95, 182)
                                                : Colors.grey,
                                            size: 30,
                                          );
                                        },
                                      ),
                                      LikeButton(
                                        onTap: ((emojed) async {
                                          var message =
                                              await onheartButtonTapped(
                                                  1,
                                                  snapshot.data[index]
                                                      ['participant_id']);
                                          if (!message) {
                                            return false;
                                          } else {
                                            return true;
                                          }
                                        }),
                                        size: 30,
                                        circleColor: const CircleColor(
                                            start: Color.fromARGB(
                                                255, 226, 91, 82),
                                            end: Color.fromARGB(
                                                255, 226, 91, 82)),
                                        bubblesColor: const BubblesColor(
                                          dotPrimaryColor:
                                              Color.fromARGB(255, 226, 91, 82),
                                          dotSecondaryColor:
                                              Color.fromARGB(255, 226, 91, 82),
                                        ),
                                        likeBuilder: (bool favoirted) {
                                          // print(favoirted);
                                          return Icon(
                                            Icons.favorite,
                                            color: favoirted || hearts
                                                ? Color.fromARGB(
                                                    255, 226, 91, 82)
                                                : Colors.grey,
                                            size: 30,
                                          );
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                          child: Icon(
                                            Icons.comment,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Comments(
                                                    id: snapshot.data[index]
                                                        ['participant_id'])),
                                          );
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                          child: Icon(
                                            Icons.share,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        onTap: share,
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  "${snapshot.data[index]['points']} Points",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "SFPRO regular",
                                  ),
                                ),
                              ),
                              if (snapshot.data[index]['comment_count'] > 0)
                                Container(
                                  child: Text(
                                    "View All ${snapshot.data[index]['comment_count']} Comments",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "SFPRO regular",
                                    ),
                                  ),
                                ),
                              // if (snapshot.data[index]['comment_count'] == 0)
                              //   Container(
                              //     child: Text(
                              //       "Post Comment",
                              //       style: TextStyle(
                              //         fontSize: 15,
                              //         fontFamily: "SFPRO regular",
                              //       ),
                              //     ),
                              //   ),
                            ],
                          ),
                        ),
                        Container(
                          child: Divider(
                            color: Color.fromARGB(255, 133, 133, 133),
                            height: 20,
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                      ]);
                    });
              }
            }));
  }
}

class Show_image extends StatefulWidget {
  const Show_image({Key? key}) : super(key: key);

  @override
  State<Show_image> createState() => _Show_image();
}

class _Show_image extends State<Show_image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        child: Center(
          child: Hero(tag: 'imageHero', child: Image.asset('images/group.png')),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
