import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class User_profile extends StatefulWidget {
  
  const User_profile({Key? key, }) : super(key: key);
  
  @override
  State<User_profile> createState() => _User_profile();
}

class _User_profile extends State<User_profile> {
  String _title =  "User Profile";
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch(index) { 
       case 0: { _title = 'Home'; } 
       break; 
       case 1: { _title = 'My Contests'; } 
       break;
       case 2: { _title = 'Feed'; } 
       break;
       case 3: { _title = 'Clients'; } 
       break; 
      } 
    });
  }
  int counter = 2;
    @override
    Widget build(BuildContext context) {
       double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      return Scaffold(
        appBar: PreferredSize(
            preferredSize:  Size.fromHeight(height * 0.10),
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
              title: Container(
                margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(_title,style: TextStyle(
                          fontSize: 20,
                        ),
                    ),
                    
                  ],
                ),
              ),
              actions: <Widget>[
          // Using Stack to show Notification Badge
           Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Container(
                 margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                 child: Stack(
                  children: <Widget>[
                     IconButton(icon: Icon(Icons.notifications,size: 30,), onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    }),
                     Positioned(
                      right: 11,
                      top: 11,
                      child:  Container(
                        padding: const EdgeInsets.all(2),
                        decoration:  BoxDecoration(
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
             ],
           ),
        ],
              centerTitle: true,
              toolbarHeight:100,
              backgroundColor: const Color(0xff1042aa), 
            ),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width:  width * 0.60,
              margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      GestureDetector(
                         onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  const User_profile()),
                            );
                        },
                        child: Text("Level 10",
                          style: TextStyle( 
                            fontSize: 20,
                            color: Color.fromARGB(255, 219, 203, 57),
                            fontFamily: "SFPRO semibold"
                          ),
                        ),
                      ),
                      Text("John Smith",
                        style: TextStyle( 
                          fontSize: 20,
                          fontFamily: "SFPRO semibold"
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(
                children: [
                  Container(
                    width: width * 0.30,
                    child:  Row(
                      children: [
                        CircleAvatar(
                          radius: 15.0,
                          backgroundImage:
                              NetworkImage('https://via.placeholder.com/30'),
                          backgroundColor: Colors.transparent,
                        ),
                         CircleAvatar(
                          radius: 15.0,
                          backgroundImage:
                              NetworkImage('https://via.placeholder.com/30'),
                          backgroundColor: Colors.transparent,
                        ),
                         CircleAvatar(
                          radius: 15.0,
                          child: Text("+4",style: TextStyle(color: Colors.white),),
                          backgroundImage:
                              NetworkImage('https://via.placeholder.com/30'),
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text("Followed by username and 4 others")
                  ),
                ],
              ),
            ),
            Container(
              color:  Color(0xff1042aa),
              padding: EdgeInsets.fromLTRB(10, 25, 10, 25),
              width:  width ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Text("Points",
                          style: TextStyle( 
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "SFPRO reqular"
                          ),
                        ),
                      Text("400",
                        style: TextStyle( 
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "SFPRO reqular"
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Text("Followers",
                          style: TextStyle( 
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "SFPRO reqular"
                          ),
                        ),
                      Text("30",
                        style: TextStyle( 
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "SFPRO reqular"
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Text("Following",
                          style: TextStyle( 
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "SFPRO reqular"
                          ),
                        ),
                      Text("30",
                        style: TextStyle( 
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "SFPRO reqular"
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text("Posts",style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: "SFPRO semibold"
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      Container(
                        width: width * 0.30,
                        child: Image.network('https://via.placeholder.com/100')
                      ),
                      Container(
                        width: width * 0.30,
                        child: Image.network('https://via.placeholder.com/100')
                      ),
                      Container(
                        width: width * 0.30,
                        child: Image.network('https://via.placeholder.com/100')
                      ),
                    ]
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
           icon: Icon(FontAwesomeIcons.home), 
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.star), 
            label: 'My Match',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.rss),
            label: 'Feed',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.boxesStacked), 
            label: 'Others',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.user), 
            label: 'Profile',
            backgroundColor: Colors.pink,
          ),
        ],
       
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        showUnselectedLabels: true,
        iconSize: 35,
         onTap: _onItemTapped,
      ),
      );
    }
}