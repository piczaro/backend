import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'Setting_edit.dart';
class Settings extends StatefulWidget {
  
  const Settings({Key? key, }) : super(key: key);
  
  @override
  
   

  
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
   int counter = 2;
   String _title =  "Settings";
    final storage = new LocalStorage('my_data');
    String useremail = "";
    String gender = "";
     @override
  void initState() {
    setState(() {
        useremail  = storage.getItem('Usermail');
        gender  = storage.getItem('usergender');
    });
  }
   Widget build(BuildContext context) {
   
    double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    String strDigits(int n) => n.toString().padLeft(2, '0');
    
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
      body: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:MainAxisAlignment.start,
            children : [
                Container(
                   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: const Text("Email",style: 
                    TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "SFPRO regular"
                    ),
                  ),
                ),
                Container(
                   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: Text(useremail,style :
                     const TextStyle(
                      color: Color.fromARGB(255, 107, 106, 106),
                      fontSize: 16,
                      fontFamily: "SFPRO regular"
                    ),
                  ),
                ),
                Container(
                   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: const Text("Date of Birth",style: 
                    TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "SFPRO regular"
                    ),
                  ),
                ),
                Container(
                   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: const Text("10-02-2022",style :
                     TextStyle(
                      color: Color.fromARGB(255, 107, 106, 106),
                      fontSize: 16,
                      fontFamily: "SFPRO regular"
                    ),
                  ),
                ),
                Container(
                   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: Text(gender,style: 
                    const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "SFPRO regular"
                    ),
                  ),
                ),
                Container(
                   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: const Text("Male",style :
                     TextStyle(
                      color: Color.fromARGB(255, 107, 106, 106),
                      fontSize: 16,
                      fontFamily: "SFPRO regular"
                    ),
                  ),
                ),
                Container(
                   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: const Text("Pancard",style: 
                    TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "SFPRO regular"
                    ),
                  ),
                ),
                Container(
                   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: const Text("ASFH10234",style :
                     TextStyle(
                      color: Color.fromARGB(255, 107, 106, 106),
                      fontSize: 16,
                      fontFamily: "SFPRO regular"
                    ),
                  ),
                ),
                Container(
                   margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: const Text("Password",style: 
                    TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "SFPRO regular"
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                       margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: GestureDetector(
                        onTap: (){
                          print("change password");
                        },
                        child: const Text("change password",style :
                           TextStyle(
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
                 Container(
                  width: width * 0.90,
                   height: height * 0.07,
                   child: ElevatedButton(
                      
                       onPressed: (){
                         Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  const Settings_edit()),
                        );
                      }, 
                      child: const Text("Edit",style: TextStyle(
                        fontSize: 20,
                      ),),
                       style: ElevatedButton.styleFrom(
                          primary:  Color(0xffffa300),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white),
                            borderRadius:  BorderRadius.circular(8.0),
                         ),
                         
                       )
                      ),
                 ),
            ]
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const Settings()),
                    );
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