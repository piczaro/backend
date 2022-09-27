import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'Setting_edit.dart';
import 'package:file_picker/file_picker.dart';
import 'Appbar.dart';
import 'mydrawer.dart';
class About extends StatefulWidget {
  
  const About({Key? key, }) : super(key: key);
  
  @override
  
   

  
  State<About> createState() => _About();
}

class _About extends State<About> {
   int counter = 2;
   String _title =  "About";
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
            preferredSize:  Size.fromHeight(height * 0.08),
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center,
          children : [
              Container(
                child:Text("@ 2021 PicZaro LLp",style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 82, 81, 81),
                          ),)
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
                child: Text(
                  "www.piczaro.com"
                  ,style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 82, 81, 81),
                          ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
                child: Text(
                  "support@piczaro.com"
                  ,style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 82, 81, 81),
                          ),
                ),
              )
          ]
        ),
      ),
      drawer: Drawer(child: DrawerWidget()), 
    );
   }
}