import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './Login.dart';
class Register_setup extends StatefulWidget {
  const Register_setup({Key? key}) : super(key: key);

  @override
  State<Register_setup> createState() => _Register_setup();
}

class _Register_setup extends State<Register_setup>  {
  bool checkboxValue = false;
  bool man = false;
  bool woman = false;
  bool mixed = false;
  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
       backgroundColor: const Color(0xff042c96),
       body:  SingleChildScrollView(
         child: Column(
           children: [
             Container(
               margin: EdgeInsets.fromLTRB(20, 30, 10, 10),
                child: Expanded(
                  child: Column(
                   children:  <Widget> [
                     Container(
                       child: Row(
                          children: [
                           RichText(
                            text: const TextSpan(
                              text: 'H',
                              style: TextStyle(
                              color: Colors.white,
                                fontSize: 35,
                                fontFamily: "SFPRO semibold"
                              ),
                              children: <TextSpan>[
                                TextSpan(text: 'EY', 
                                style: TextStyle(
                                  color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: "SFPRO semibold"
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                           RichText(
                            text: const TextSpan(
                              text: 'T',
                              style: TextStyle(
                              color: Colors.white,
                                fontSize: 35,
                                fontFamily: "SFPRO semibold"
                              ),
                              children: <TextSpan>[
                                TextSpan(text: 'HERE', 
                                style: TextStyle(
                                  color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: "SFPRO semibold"
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                         ],
                       ),
                     ),
                    
                     Container(
                       child: Row(
                          children: [
                           RichText(
                            text: const TextSpan(
                              text: 'Wel',
                              style: TextStyle(
                              color: Colors.white,
                                fontSize: 25,
                                fontFamily: "SFPRO semibold"
                              ),
                              children: <TextSpan>[
                                TextSpan(text: 'come to', 
                                style: TextStyle(
                                  color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: "SFPRO semibold"
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                           RichText(
                            text: const TextSpan(
                              text: 'Pic',
                              style: TextStyle(
                              color: Colors.white,
                                fontSize: 25,
                                fontFamily: "SFPRO semibold"
                              ),
                              children: <TextSpan>[
                                TextSpan(text: 'Zaro', 
                                style: TextStyle(
                                  color: Color.fromARGB(255, 240, 159, 39),
                                    fontSize: 25,
                                    fontFamily: "SFPRO semibold"
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                         ],
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
                        height: height * 0.15,
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'SFPRO regular'
                                ),
                                decoration: InputDecoration(
                                  // enabledBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(width: 1.5),
                                  
                                  // ),
                                  // focusedBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(width: 1.5),
                                  
                                  // ),
                                label: Row(
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                          text: 'User Name',
                                          style: TextStyle(
                                              fontSize: 20.0, fontFamily: 'SFPRO reqular', color: Colors.white
                                            ),
                                          children: [
                                            TextSpan(
                                                text: ' *', style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20.0, fontFamily: 'SFPRO reqular', 
                                                ),
                                              ),
                                          ]),
                                    ),
                                    // Text("First name"),
                                    // Text("*", style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                // hintText: 'User Name',
                                // suffixText: '*',
                                // suffixStyle: TextStyle(
                                //   color: Colors.red,
                                // ),
                                // hintStyle: TextStyle(fontSize: 20.0, fontFamily: 'SFPRO reqular', color: Colors.white),
                                contentPadding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                                filled: true,
                                fillColor: Color(0xff1c40a0),
                              ),
                            ),
                            
                            ],
                          ),
                        ),
                     ),
                     
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      width: width,
                      height: height * 0.30,
                      child :Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 10,
                                child: Icon(Icons.man,color: Colors.white,)
                                ),
                              Icon(Icons.woman,color: Colors.white),
                              RichText(
                                text: const TextSpan(
                                  text: 'Gender',
                                  style: TextStyle(
                                      fontSize: 20.0, fontFamily: 'SFPRO reqular', color: Colors.white
                                    ),
                                  children: [
                                    TextSpan(
                                      text: ' *', style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20.0, fontFamily: 'SFPRO reqular', 
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                             height: height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                      if(man){
                                        man = false;
                                      }else{
                                        man = true;
                                        woman = false;
                                        mixed = false;
                                      }
                                  });
                                  
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: man ?Colors.white : Colors.transparent
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  width: width * 0.26,
                                  child: Image.asset('images/EMO2.png'),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                      if(woman){
                                        woman = false;
                                       
                                      }else{
                                        woman = true;
                                        man =false;
                                        mixed = false;
                                      }
                                  });
                                  
                                },
                                child: Container(
                                   decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: woman ?Colors.white : Colors.transparent
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  width: width * 0.26,
                                  child: Image.asset('images/EMO3.png'),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                      if(mixed){
                                        mixed = false;

                                      }else{
                                        mixed = true;
                                        woman = false;
                                        man =false;
                                      }
                                  });
                                  
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: mixed ?Colors.white : Colors.transparent
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  width: width * 0.26,
                                  child: Image.asset('images/EMO1.png'),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                    Container(
                       margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
                        height: height * 0.10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'SFPRO regular'
                              ),
                              decoration: InputDecoration(
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(width: 1.5),
                                
                                // ),
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(width: 1.5),
                                
                                // ),
                              label: Row(
                                children: [
                                  RichText(
                                    text: const TextSpan(
                                        text: 'Referral Code',
                                        style: TextStyle(
                                            fontSize: 20.0, fontFamily: 'SFPRO reqular', color: Colors.white
                                          ),
                                        ),
                                  ),
                                  // Text("First name"),
                                  // Text("*", style: TextStyle(color: Colors.red)),
                                ],
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              // hintText: 'User Name',
                              // suffixText: '*',
                              // suffixStyle: TextStyle(
                              //   color: Colors.red,
                              // ),
                              // hintStyle: TextStyle(fontSize: 20.0, fontFamily: 'SFPRO reqular', color: Colors.white),
                              contentPadding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                              filled: true,
                              fillColor: Color(0xff1c40a0),
                            ),
                          ),
                          
                          ],
                        ),
                     ),
                     FormField<bool>(
                      builder: (state) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: checkboxValue,
                                  onChanged: (value) {
                                    setState(() {
                                      if(checkboxValue){
                                         checkboxValue = false;
                                      }else{
                                        checkboxValue = true;
                                      }
                    //save checkbox value to variable that store terms and notify form that state changed
                                     
                
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.0),
                                    
                                  ),
                                  side: BorderSide(
                                    // ======> CHANGE THE BORDER COLOR HERE <====== 
                                    color: Colors.white,
                                    // Give your checkbox border a custom width
                                    width: 1.5,
                                  ),
                                  checkColor: Colors.black,
                                  activeColor: Colors.white,
                                  ),
                                Container(
                                  width: width * 0.60,
                                  child: Text('I accept the Terms & conditions and Privacy \t Policy by signing up',
                                     style: TextStyle(
                                            fontSize: 14.0, fontFamily: 'SFPRO reqular', color: Colors.white
                                          ),
                                  )
                                ),
                              ],
                            ),
                            //display error in matching theme
                            Text(
                              state.errorText ?? '',
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                              ),
                            )
                          ],
                        );
                      },
                    //output from validation will be displayed in state.errorText (above)
                      validator: (value) {
                        if (!checkboxValue) {
                          return 'You need to accept terms';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Container(
                           decoration: const BoxDecoration(color: Colors.green),
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          width: width * 0.80,
                          height: height * 0.07,
                          child: Expanded(
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
                        ),
                   ],
                               ),
                ),
             ),
           ],
         ),
       ),
    );
  }
}