// ignore: file_names
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'Register_setup.dart';

class Bottommodal_for_register extends StatefulWidget {
  const Bottommodal_for_register({Key? key}) : super(key: key);
  
  @override
  
   

  
  State<Bottommodal_for_register> createState() => _Bottommodal_for_register();
}

class _Bottommodal_for_register extends State<Bottommodal_for_register> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
     
      padding: mediaQueryData.viewInsets,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
               children:  [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: const Text('OTP sent to your given mobile number',
                  style: TextStyle(
                    fontFamily: 'SFPRO regular',
                    fontSize: 26,
                    color: Colors.black,
                    
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: width ,
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                      const SizedBox(
                        width: 40,
                        height: 40
                      ),
                      SizedBox(
                        width: 50,
                        height: 55,
                          child: TextField(
                            onChanged: (value) {
                              if(value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                              inputFormatters: [ 
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 20),
                            decoration:  const InputDecoration(
                            
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 122, 121, 121)),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            
                            
                            ),
                          ),
                      ),
                      const Text('-' ,style: TextStyle(color: Colors.black),),
                      SizedBox(
                          width: 50,
                        height: 55,
                          child: TextField(
                              onChanged: (value) {
                              if(value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            inputFormatters: [ 
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 20),
                            decoration:  const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 122, 121, 121)),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ), 
                            ),
                          ),
                      ),
                        const Text('-'),
                      SizedBox(
                          width: 50,
                        height: 55,
                          child: TextField(
                              onChanged: (value) {
                              if(value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            inputFormatters: [ 
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 20),
                            decoration:  const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 122, 121, 121)),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),    
                            ),
                          ),
                      ),
                        const Text('-'),
                      SizedBox(
                        width: 50,
                        height: 55,
                          child: TextField(
                              onChanged: (value) {
                              if(value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            inputFormatters: [ 
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 20),
                            decoration:  const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 122, 121, 121)),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ), 
                            ),
                            
                          ),
                      ),
                        const SizedBox(
                        width: 40,
                        height: 40
                      ),
                  ]
              
                ),
                SizedBox(
                  width: width ,
                  height: height * 0.05,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Text Clicked');
                      },
                      child: const Text('Resend Otp',
                        style: TextStyle(
                          fontFamily: 'SFPRO semibold',
                          color: Color.fromARGB(255, 10, 56, 143),
                          fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: width ,
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width:width * 0.10
                    ),
                    SizedBox(
                      width: width * 0.80,
                      height: height * 0.07,
                      child: ElevatedButton(
                        
                        onPressed: () {
                          Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  const Register_setup()),
                      );
                        },
                        child: const Text("Validate Otp",style: TextStyle(
                          fontSize: 20,
                        ),),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(5, 5),
                            primary: const Color(0xffffa300),
                            
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                          ),
                       
                          
                        )
                        ),
                    ),
                  ],
                ),
                SizedBox(
                  width: width ,
                  height: height * 0.05,
                ),
             ]
          ) 
        ),
      ),
    );
  }
}