import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Bottom_modal_for_register.dart';
import 'package:flutter/gestures.dart';
class Registerpage extends StatefulWidget {
  const Registerpage({Key? key}) : super(key: key);

  @override
  State<Registerpage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Registerpage> with TickerProviderStateMixin {
   bool clikc = true;
  @override
  Widget build(BuildContext context) {
    TabController _controller = TabController(length: 2, vsync: this);
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        
         backgroundColor: const Color(0xff1042aa),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child:  const Text("Let’s sign you in.",style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontFamily: 'SFPRO semibold'
                      ),
                  ),
                
                  ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 7, 10, 0),
                  child: const Text("Welcome back",style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'SFPRO reqular'
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 7, 10, 30),
                  child: const Text("You’ve been missed!",style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'SFPRO light'
                    ),
                  ),
                ),
                
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                      width: width * 0.35,
                      child:TabBar(
                        indicatorColor: Colors.transparent,
                         unselectedLabelColor: Colors.grey,
                        indicator: const BoxDecoration(
                              color: Color(0xffffa300)
                        ),
                          controller: _controller,
                          tabs:  [
                            Tab(
                              child: Container(
                                  padding:  const EdgeInsets.fromLTRB(0,0,0,0),
                                
                                child: const FaIcon(FontAwesomeIcons.mobileScreen), 
                                ),
                            ),
                            Tab( child: Container(
                                padding: const EdgeInsets.all(8.0),
                                
                                child: const FaIcon(FontAwesomeIcons.envelope), 
                                ),
                            )
                              
                          ],
                      ),
                    ),
                  ]
                ),
                ]
              ),
              Container(
                  height: height *0.25,
                  child: TabBarView(
                      controller: _controller,
                      children: <Widget> [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
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
                    SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
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
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                      )
                    ),
                  ]
                ),
              ),
               Container(
                      margin: EdgeInsets.fromLTRB(width * 0.10, height * 0.05, 0, 0),
                      width: width * 0.80,
                      height: height * 0.08,
                      child: ElevatedButton(
                        onPressed: (){
                          showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return const Bottommodal_for_register();
                          }
                          );
                        }, 
                        child: const Text("Signin",style: TextStyle(
                          fontSize: 20,
                        ),),
                         style: ElevatedButton.styleFrom(
                            primary: const Color(0xffffa300),
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                           )
                         )
                        ),
                        ),
                      Container(
                        width: width,
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
                            ]
                        ),
                      ),
                      Row(
                           children: [
                             Container(
                                margin: EdgeInsets.fromLTRB(width * 0.30, height * 0.01, 0, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    print("selected");
                                  },
                                  child:
                                  
                                    Image.asset('images/oval.png'),
                              ),
                        ),
                           
                         Container(
                            margin: EdgeInsets.fromLTRB(width *  0.15, height * 0.01, 0, 0),
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
                     
                     
              ],
            ),
          ),
        ),
        ),
      );
  }
}