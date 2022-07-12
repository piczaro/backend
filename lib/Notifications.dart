import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'Setting_edit.dart';
import 'package:file_picker/file_picker.dart';
class Notifications extends StatefulWidget {
  
  const Notifications({Key? key, }) : super(key: key);
  
  @override
  
   

  
  State<Notifications> createState() => _Notifications();
}

class _Notifications extends State<Notifications> {
   int counter = 2;
   String _title =  "Notifications";
    final storage = new LocalStorage('my_data');
    String useremail = "test@gmail.com";
    String gender = "Male";
     @override
  void initState() {
    setState(() {
        // useremail  = storage.getItem('Usermail');
        // gender  = storage.getItem('usergender');
    });
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:MainAxisAlignment.start,
            children : [
              Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                        child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                NetworkImage('https://via.placeholder.com/120'),
                            backgroundColor: Colors.transparent,
                          ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: GestureDetector(
                            onTap: () {
                                
                            },
                            child: Text("Cristino",
                              style: TextStyle( 
                                fontSize: 18,
                                fontFamily: "SFPRO semibold"
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Text("Cristino likes your content",
                            style: TextStyle( 
                              fontSize: 16,
                              fontFamily: "SFPRO light"
                            ),
                          ),
                        ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text("02/05/2022 21:15",
                            style: TextStyle( 
                              fontSize: 16,
                              fontFamily: "SFPRO light"
                            ),
                          ),
                        ),
                        
                        
                      ],
                    ),
                    
                  ],
                ),
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Color.fromARGB(255, 0, 0, 0)
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                        child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                NetworkImage('https://via.placeholder.com/120'),
                            backgroundColor: Colors.transparent,
                          ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: GestureDetector(
                            onTap: () {
                                
                            },
                            child: Text("Cristino",
                              style: TextStyle( 
                                fontSize: 18,
                                fontFamily: "SFPRO semibold"
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Text("Cristino likes your content",
                            style: TextStyle( 
                              fontSize: 16,
                              fontFamily: "SFPRO light"
                            ),
                          ),
                        ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text("02/05/2022 21:15",
                            style: TextStyle( 
                              fontSize: 16,
                              fontFamily: "SFPRO light"
                            ),
                          ),
                        ),
                        
                        
                      ],
                    ),
                    
                  ],
                ),
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Color.fromARGB(255, 0, 0, 0)
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                        child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                NetworkImage('https://via.placeholder.com/120'),
                            backgroundColor: Colors.transparent,
                          ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: GestureDetector(
                            onTap: () {
                                
                            },
                            child: Text("Cristino",
                              style: TextStyle( 
                                fontSize: 18,
                                fontFamily: "SFPRO semibold"
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Text("Cristino likes your content",
                            style: TextStyle( 
                              fontSize: 16,
                              fontFamily: "SFPRO light"
                            ),
                          ),
                        ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text("02/05/2022 21:15",
                            style: TextStyle( 
                              fontSize: 16,
                              fontFamily: "SFPRO light"
                            ),
                          ),
                        ),
                        
                        
                      ],
                    ),
                    
                  ],
                ),
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Color.fromARGB(255, 0, 0, 0)
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                        child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                NetworkImage('https://via.placeholder.com/120'),
                            backgroundColor: Colors.transparent,
                          ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: GestureDetector(
                            onTap: () {
                                
                            },
                            child: Text("Cristino",
                              style: TextStyle( 
                                fontSize: 18,
                                fontFamily: "SFPRO semibold"
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Text("Cristino likes your content",
                            style: TextStyle( 
                              fontSize: 16,
                              fontFamily: "SFPRO light"
                            ),
                          ),
                        ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text("02/05/2022 21:15",
                            style: TextStyle( 
                              fontSize: 16,
                              fontFamily: "SFPRO light"
                            ),
                          ),
                        ),
                        
                        
                      ],
                    ),
                    
                  ],
                ),
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Color.fromARGB(255, 0, 0, 0)
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                        child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                NetworkImage('https://via.placeholder.com/120'),
                            backgroundColor: Colors.transparent,
                          ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: GestureDetector(
                            onTap: () {
                                
                            },
                            child: Text("Cristino",
                              style: TextStyle( 
                                fontSize: 18,
                                fontFamily: "SFPRO semibold"
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Text("Cristino likes your content",
                            style: TextStyle( 
                              fontSize: 16,
                              fontFamily: "SFPRO light"
                            ),
                          ),
                        ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text("02/05/2022 21:15",
                            style: TextStyle( 
                              fontSize: 16,
                              fontFamily: "SFPRO light"
                            ),
                          ),
                        ),
                        
                        
                      ],
                    ),
                    
                  ],
                ),
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Color.fromARGB(255, 0, 0, 0)
                ),
              ),             
                         
                
            ]
          ),
        ),
      ),
      drawer: Drawer(  
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
          color: Color(0xff1042aa),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.money,color: Colors.white,),
                    Text(' My Balance',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.share_rounded,color: Colors.white,),
                    Text(' Refer & Earn',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.grade_outlined,color: Colors.white,),
                    Text(' My Level',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.gps_fixed,color: Colors.white,),
                    Text(' Find my Friends',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              InkWell(
                onTap: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>  const Settings()),
                    // );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child : 
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const[
                      
                      Icon(Icons.settings,color: Colors.white,),
                      Text(' My Settings',style: TextStyle(
                        color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )
                ),
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.help_center,color: Colors.white,),
                    Text(' Help Desk',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.account_box_outlined,color: Colors.white,),
                    Text(' About App',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.money_outlined,color: Colors.white,),
                    Text(' Terms & condition',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.logout_outlined,color: Colors.white,),
                    Text(' Logout',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
            ]
          ),
        ),
      ), 
    );
   }
}