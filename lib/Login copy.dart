import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  
  @override
  
   

  
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
   List<Color> _colors = [Colors.transparent, Color.fromARGB(255, 177, 167, 77)];
   bool clikc = true;
  @override
  Widget build(BuildContext context) {
     TabController _controller = TabController(length: 2, vsync: this);
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
         resizeToAvoidBottomInset : false,
         backgroundColor: Color(0xff1042aa),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                ),
                Expanded(
                  
                  flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:
                                Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                                      width: width * 0.35,
                                      child:TabBar(
                                          
                                        indicatorColor: Colors.transparent,
                                        indicator: BoxDecoration(color: Color(0xffffa300)),
                                      controller: _controller,
                                      tabs:  [
                                          Tab(
                                            
                                            child: Container(
                                               padding: new EdgeInsets.fromLTRB(0,0,0,0),
                                             
                                              child: FaIcon(FontAwesomeIcons.mobileScreen), 
                                              ),
                                          ),
                                          Tab( child: Container(
                                              padding: new EdgeInsets.all(8.0),
                                             
                                              child: FaIcon(FontAwesomeIcons.envelope), 
                                              ),
                                            )
                                         
                                        ],
                                      ),
                                    )
                                    
                                  ]
                                ),
                              ),
                            ]
                          ),
                            Container(
                              height: height *0.20,
                              child: TabBarView(
                                  controller: _controller,
                                  children: <Widget> [
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
                                Column(
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
                                          hintText: 'Email',
                                          hintStyle: TextStyle(fontSize: 20.0, fontFamily: 'SFPRO reqular', color: Colors.white),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                                            child: Icon( IconData(0xe3c3, fontFamily: 'MaterialIcons',),color: Colors.white, ),
                                            
                                          ),
                                          
                                        ),
                                    ),
                                  ),  
                                  Container(
                                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                                        hintText: 'Password',
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
                              ]
                            ),
                          ),
                        ]
                      ),
                     
                //     ],
                //   ),
                  
                    
                    
                 
                
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Container(
                //         margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                //       child: TextFormField(
                          
                //           style: const TextStyle(
                //              color: Colors.white,
                //             fontSize: 18,
                //             fontFamily: 'SFPRO regular'
                //           ),
                //           decoration: const InputDecoration(
                //              enabledBorder: OutlineInputBorder(
                //               borderSide: BorderSide(color: Color(0xff979197), width: 1.5),
                //           ),
                //             hintText: 'Email',
                //             hintStyle: TextStyle(fontSize: 20.0, fontFamily: 'SFPRO reqular', color: Colors.white),
                //             prefixIcon: Padding(
                //               padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                //               child: Icon( IconData(0xe3c3, fontFamily: 'MaterialIcons',),color: Colors.white, ),
                              
                //             ),
                            
                //           ),
                //       ),
                //       ),
                //       Container(
                //     margin: EdgeInsets.fromLTRB(10, height * 0.05, 10, 0),
                //     child: TextFormField(
                      
                //       style: const TextStyle(
                //          color: Colors.white,
                //         fontSize: 18,
                //         fontFamily: 'SFPRO regular'
                //       ),
                //       decoration: const InputDecoration(
                //          enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Color(0xff979197), width: 1.5),
                //       ),
                //         hintText: 'Password',
                //         hintStyle: TextStyle(fontSize: 20.0, fontFamily: 'SFPRO reqular', color: Colors.white),
                //         prefixIcon: Padding(
                //           padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                //           child: Icon( IconData(0xe3ae, fontFamily: 'MaterialIcons',),color: Colors.white, ),
                          
                //         ),
                        
                //       ),)
                // ),
                //     ],
                  // ),
                ),
                // Expanded(
                //   flex: 1,
                //    child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Container(
                   
                //     height: height *0.10,
                //          child: TabBarView(
                //             controller: _controller,
                //             children: <Widget> [
                //           TextFormField(
                          
                //           style: const TextStyle(
                //              color: Colors.white,
                //             fontSize: 18,
                //             fontFamily: 'SFPRO regular'
                //           ),
                //           decoration: const InputDecoration(
                //              enabledBorder: OutlineInputBorder(
                //               borderSide: BorderSide(color: Color(0xff979197), width: 1.5),
                //           ),
                //             hintText: 'Phone Number',
                //             hintStyle: TextStyle(fontSize: 20.0, fontFamily: 'SFPRO reqular', color: Colors.white),
                //             prefixIcon: Padding(
                //               padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                //               child: Icon( IconData(0xe3c3, fontFamily: 'MaterialIcons',),color: Colors.white, ),
                              
                //             ),
                            
                //             ),
                //           ),
                //             Text("Location"),
                             
                //             ],
                //           ),
                //           ),
                //         ]
                //    )
                //   ),
                
                Expanded(
                  flex: 1,
                  child:Column(
                   mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                      margin: EdgeInsets.fromLTRB(width * 0.10, height * 0.05, 0, 0),
                      width: width * 0.80,
                      height: height * 0.08,
                      child: ElevatedButton(
                        onPressed: (){
                           Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  LoginPage()),
                          );
                        }, 
                        child: const Text("Signin",style: TextStyle(
                          fontSize: 20,
                        ),),
                         style: ElevatedButton.styleFrom(
                            primary: Color(0xffffa300),
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                           )
                         )
                        ),
                        ),
                      ]
                    ), 
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
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
                      Container(
                      margin: EdgeInsets.fromLTRB(0, height * 0.04, 0, 0),
                      child: RichText(
                        text: new TextSpan(text: 'Don\'t have a account ?', children: [
                          new TextSpan(
                            text: 'Register',
                            recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                          )
                        ]),
                      ),
                      ),
                      ],
                    ),
                  ),
              ],
              ),
              ),
              
            );
          }
        ),
      ),
    );
  }

}