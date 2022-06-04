import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:date_count_down/countdown.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';


import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'Contested.dart';

class Contest extends StatefulWidget {
  const Contest({Key? key}) : super(key: key);

  @override
  State<Contest> createState() => _Contest();
}

class _Contest extends State<Contest> {
   List<int> list = [1, 2, 3, 4, 5];
  final List<Map<String, dynamic>> _statistics = [
    {'key': 'Flutter Tutorial', 'value': 90},
    {'key': 'Android Tutorial', 'value': 50, 'border': true},
    {'key': 'Java Tutorial', 'value': 30},
    {'key': 'sdfjsfjk', 'value': 70}
  ];
  int counter = 0;
    
  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 192, 192, 192),
        appBar: PreferredSize(
            preferredSize:  Size.fromHeight(height * 0.10),
            child: AppBar(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ), 
              title: Container(
                margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('Upcomming Contest',style: TextStyle(
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
           
           

            child: GestureDetector(
               onTap: (){
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const Contest_pay()),
                      );
                    },
              child: Column(
                  children: _statistics.map((Map<String, dynamic> data) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(5, 7, 7, 5),
                    
                      decoration:  const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    child: Column(
                      
                      children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                    child: const Text("Contest Name",style:  TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                
                                Column(
                                  children: const [
                                    Text("Price Amount",style:  TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                      ),
                                    ),
                                    Text("₹ 100",style:  TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text("Contest Type",style:  TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                      ),
                                    ),
                                    Text("Express",style:  TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text("Duration",style:  TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                      ),
                                    ),
                                    Text("3:00hrs ",style:  TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "SFPRO regular",
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    ElevatedButton(
                                          onPressed: (){
                                           
                                          }, 
                                          child: const Text("Pay ₹ 100",style: TextStyle(
                                            fontSize: 20,
                                          ),),
                                           style: ElevatedButton.styleFrom(
                                              primary: const Color(0xff7acd20),
                                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:  BorderRadius.circular(5.0),
                                             )
                                           )
                                          ),
                                   
                                  ],
                                ),
                    
                              ],
                            )
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 1, 10, 1),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5, 5, 10, 5),
                                      child: const Text("Slots",style:  TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontFamily: "SFPRO regular",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 10,
                                    child: const LinearProgressIndicator(
                                      value: 0.35, // percent filled
                                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xffffa300)),
                                      backgroundColor: Color.fromARGB(255, 207, 207, 207),
                                    ),
                                  ),
                                ),
                               Container(
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: const [
                                     Text("3/6 Slots",style:  TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontFamily: "SFPRO regular",
                                        ),
                                      )
                                  ],
                              ),
                               )
                              ],
                             
                            ),
                    
                          )
                      ]),
                  );
                 }).toList(),
                
              ),
            ),
          ),
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
      ),
    );
  }
}


class Contest_pay extends StatefulWidget {
  const Contest_pay({Key? key}) : super(key: key);

  @override
  State<Contest_pay> createState() => _Contest_pay();
}

class _Contest_pay extends State<Contest_pay> {
  static const platform = const MethodChannel("razorpay_flutter");

  late Razorpay _razorpay;
  
  int counter = 0;
  String counttime = "Loading";
  bool upload = false;
  bool pay = true;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
     var options = {
      'key': 'rzp_test_sgGpnHRywcx0ke',
      'amount': 100,
      'name': 'Piczaro.',
      'description': 'Contest pay',
      
      'send_sms_hash': true,
      'prefill': {'contact': '9003306701', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }
 
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
     print('Success Response: $response');
    setState (() => { 
      upload = true,
      pay = false
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message,
    //     timeInSecForIos: 4);
  }
 

 
  void _handleExternalWallet(ExternalWalletResponse response) {
     print('External SDK Response: $response');
    // Fluttertoast.showToast(
    //     msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }
 
  @override
  Widget build(BuildContext context) {
    counttime = CountDown().timeLeft(DateTime.parse("2022-07-23 10:00:00"), "Completed", "d :", "h :", "m :", "s", "D ", "H ", "M", "S");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
            preferredSize:  Size.fromHeight(height * 0.10),
            child: AppBar(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ), 
              title: Container(
                margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('Contest Details Screen',style: TextStyle(
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
            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Column(
              children: [
                 Container(
                   margin: EdgeInsets.fromLTRB(5, 10, 5, 20),
                   child: const Text('Note : Pay Entry fee to upload & participate in the contest',style: TextStyle(
                            fontSize: 17,
                          ),
                      ),
                 ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text('B/W portrait',style: TextStyle(
                                fontSize: 17,
                              ),
                          ),
                          Row(
                            children: [
                              Text("Start in : "),
                              CountdownTimer(
                                endTime: DateTime.parse("2023-09-04 18:00:00Z").millisecondsSinceEpoch,
                              ),
                            ],
                          ),
                          
                        ]
                      ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
                    child: Column(
                     children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: const [
                              Text("Price Amount",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              ),
                              Text("₹ 100",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: const [
                              Text("Contest Type",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              ),
                              Text("Express",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: const [
                              Text("Duration",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              ),
                              Text("3:00hrs ",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: const [
                              Text("Available Slots",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              ),
                              Text("03",style:  TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "SFPRO regular",
                                ),
                              )
                            ]
                          ),
                        ],
                    ),
                    ],
                   ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Slots",style:  TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                  height: 10,
                    child: const LinearProgressIndicator(
                      value: 0.35, // percent filled
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xffffa300)),
                      backgroundColor: Color.fromARGB(255, 207, 207, 207),
                    ),
                  ),
                ),
                Visibility(
                  visible: pay,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
                      child:  ElevatedButton(
                      onPressed: openCheckout,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Pay ₹ 100",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffffa300),
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(5.0),
                        )
                      )
                    ),
                  ),
                ),
                Visibility(
                  visible: upload,
                  child: Container(
                     margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
                    child: ElevatedButton(
                      onPressed: () async{
                         final result = await FilePicker.platform.pickFiles();
                
                          if(result == null) return;
                          final file = result.files.first;
                          if(file != null){
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Contested() )
                              );
                          }
                          print('${file.name}');
                      },
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                        child: Text("Upload",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffffa300),
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(5.0),
                        )
                      )
                    ),
                  ),
                )
              ],
            ),
          )
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
            label: 'My Watch',
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
      ),
    );
  }
}