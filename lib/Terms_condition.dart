import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'Setting_edit.dart';
import 'package:file_picker/file_picker.dart';
class Terms_condition extends StatefulWidget {
  
  const Terms_condition({Key? key, }) : super(key: key);
  
  @override
  
   

  
  State<Terms_condition> createState() => _Terms_condition();
}

class _Terms_condition extends State<Terms_condition> {
   int counter = 2;
   String _title =  "Terms and Conditions";
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
            margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:MainAxisAlignment.start,
              children : [
                  Container(
                    child:Text("Terms and Conditions",style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 82, 81, 81),
                              ),)
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
                    child: Text(
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."
                      ,style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 82, 81, 81),
                              ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
                    child: Text(
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."
                      ,style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 82, 81, 81),
                              ),
                    ),
                  )
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