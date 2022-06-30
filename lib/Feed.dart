import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_share/flutter_share.dart';    
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'Comments.dart';
import 'User_profile.dart';
class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _Feed();
}

class _Feed extends State<Feed> {
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
   @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: _statistics.map((Map<String, dynamic> data) {
          return
          Column(
            children: [
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
                        MaterialPageRoute(builder: (context) =>  const User_profile()),
                      );
                    },
                    child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/150'),
                        backgroundColor: Colors.transparent,
                      ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      GestureDetector(
                         onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  const User_profile()),
                            );
                        },
                        child: Text("Kate Hollomann",
                          style: TextStyle( 
                            fontSize: 25,
                            fontFamily: "SFPRO semibold"
                          ),
                        ),
                      ),
                      Text("Forest Watterfalls",
                        style: TextStyle( 
                          fontSize: 15,
                          fontFamily: "SFPRO semibold"
                        ),
                      ),
                      Text("wednesday, january 13,2022",
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
                    child:  Icon(Icons.more_vert,color: Colors.grey,),),
                     itemBuilder: (_) {
                      return [
                        PopupMenuItem(child: Text("Follow")),
                        PopupMenuItem(child: Text("Report"))
                      ];
                    },
                  ),
                ],
              ),
            ),
             InkWell(
                child: Container(
                  height:200,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Image.asset('images/group.png'),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
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
                      
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        LikeButton(
                          size: 30,
                          circleColor:
                              const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Color(0xff33b5e5),
                            dotSecondaryColor: Color(0xff0099cc),
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.thumb_up,
                              color: isLiked ? Color.fromARGB(255, 2, 95, 182) : Colors.grey,
                              size: 30,
                            );
                          },
                          
                          
                        ),
                        LikeButton(
                          size: 30,
                          circleColor:
                              const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Color(0xff33b5e5),
                            dotSecondaryColor: Color(0xff0099cc),
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.emoji_emotions,
                              color: isLiked ? Color.fromARGB(255, 2, 95, 182) : Colors.grey,
                              size: 30,
                            );
                          },
                          
                          
                        ),
                        LikeButton(
                          size: 30,
                          circleColor:
                              const CircleColor(start: Color.fromARGB(255, 226, 91, 82), end: Color.fromARGB(255, 226, 91, 82)),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Color.fromARGB(255, 226, 91, 82),
                            dotSecondaryColor: Color.fromARGB(255, 226, 91, 82),
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.favorite,
                              color: isLiked ? Color.fromARGB(255, 226, 91, 82) : Colors.grey,
                              size: 30,
                            );
                          },
                          
                          
                        ),
                        InkWell(
                          child: Container(
                                
                            child: Icon(Icons.comment,color: Colors.grey,),
                          ),
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  const Comments()),
                              );
                          },
                        ),
                        InkWell(
                          child: Container(
                                        
                            child: Icon(Icons.share,color: Colors.grey,),
                          ),
                          onTap: share,
                        )
                        
                        
                      ]
                    ),
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
                    child: Text("32,144 Points",style: TextStyle(
                      fontSize: 15,
                      fontFamily: "SFPRO regular",
                    ),),
                  ),
                  Container(
                    child: Text("View All 321 Comments",style: TextStyle(
                      fontSize: 15,
                      fontFamily: "SFPRO regular",
                    ),),
                  ),
                  
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
          ]
          );
        }).toList(),
      ),
    );
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
        backgroundColor:Colors.black,
      body: GestureDetector(
        child: Center(
          
          child: Hero(
            tag: 'imageHero',
            child: Image.asset('images/group.png')
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}