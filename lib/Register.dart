import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({Key? key}) : super(key: key);

  @override
  State<Registerpage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Registerpage> {
  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1042aa),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Container(
                       margin: EdgeInsets.fromLTRB(10, 7, 10, 0),
                      child:  const Text("Let’s sign you in.",style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontFamily: 'SFPRO semibold'
                        ),
                    ),
                  
                    ),
                  Container(
                     margin: EdgeInsets.fromLTRB(10, 7, 10, 0),
                    child: const Text("Welcome back",style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'SFPRO reqular'
                      ),
                    ),
                  ),
                  Container(
                     margin: EdgeInsets.fromLTRB(10, 7, 10, 0),
                    child: const Text("You’ve been missed!",style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'SFPRO light'
                      ),
                    ),
                  ),
                  
    
                ],
              ),
              ),
               Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: TextFormField(
                      
                      style: const TextStyle(
                         color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'SFPRO regular'
                      ),
                      decoration: const InputDecoration(
                         enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff979197), width: 1.5),
                      ),
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(fontSize: 20.0, fontFamily: 'SFPRO reqular', color: Colors.white),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                          child: Icon( IconData(0xe3c3, fontFamily: 'MaterialIcons',),color: Colors.white, ),
                          
                        ),
                        
                        ),
                      ),
                      ),
                    ],
                  ),
               ),              
             Expanded(
                    flex: 2,
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children :[
                        Container(
                     margin: EdgeInsets.fromLTRB(0, height * 0.04, 0, 0),
                     child: const Text("or",style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      ),
                       ),
                       Row(
                         children: [
                           Container(
                              margin: EdgeInsets.fromLTRB(width * 0.30, height * 0.04, 0, 0),
                              child: GestureDetector(
                                onTap: () {
                                  print("selected");
                                },
                                child:
                                
                                  Image.asset('images/oval.png'),
                                  
                                
                             
                            ),
                      ),
                         
                       Container(
                          margin: EdgeInsets.fromLTRB(width *  0.15, height * 0.04, 0, 0),
                          child: GestureDetector(
                             onTap: () {
                              print("selected");
                            },
                            child:
                              Image.asset('images/oval-fb.png'),
                          ),
                        ),
                    
                      ],
                    ),
                    ]
                    ),
             ),
            ]
        ),
      ),
    );
  }
}