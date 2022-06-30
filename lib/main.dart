import 'package:flutter/material.dart';
import './Login.dart';
import './Register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff1042aa),
      body:  SafeArea(
        
        child:
          Expanded(
           
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget> [
                          Image.asset('images/group.png'),
                          Image.asset('images/piczaro.png')
                        ]
                      ),
                         
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                         decoration: const BoxDecoration(color: Colors.green),
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        width: width * 0.80,
                        height: height * 0.07,
                        child: ElevatedButton(
                          onPressed: (){
                             Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  const  LoginPage()),
                            );
                          }, 
                          child: const Text("Signin",style: TextStyle(
                            fontSize: 20,
                          ),),
                           style: ElevatedButton.styleFrom(
                              primary: const Color(0xffffa300),
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius:  BorderRadius.circular(8.0),
                             )
                           )
                          ),
                      ),
                      Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  width: width * 0.80,
                  height: height * 0.07,
                  child: ElevatedButton(
                     onPressed: (){
                       Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  const Registerpage()),
                      );
                    }, 
                    child: const Text("Register",style: TextStyle(
                      fontSize: 20,
                    ),),
                     style: ElevatedButton.styleFrom(
                        primary: const Color(0xff1042aa),
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius:  BorderRadius.circular(8.0),
                       ),
                       
                     )
                    ),
                )
                    ],
                  ),
                ),
                
              ],
            ),
          ),
      
        
            
          
        ),
        
        
      
    );
  }
}
