import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pixzaro/Register.dart';
import './Login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'dart:convert';
import 'google_signin.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Register_setup extends StatefulWidget {
  const Register_setup({Key? key}) : super(key: key);

  @override
  State<Register_setup> createState() => _Register_setup();
}

class _Register_setup extends State<Register_setup> {
  final storage = new LocalStorage('my_data');
  final formGlobalKey = GlobalKey<FormState>();
  bool checkboxValue = false;
  bool man = false;
  bool woman = false;
  bool mixed = false;
  String username = "";
  String Referral_code = "";
  Map jsonMap_body = new Map<String, dynamic>();

  Future<http.Response?> createAlbum(String logintype) async {
    setState(() {
      isLoading = true;
    });
    final String register_type = storage.getItem('register_type');

    if (register_type == 'google') {
      final user = await GoogleSignInApi.login();
      // print(user);
      Map<String, dynamic> jsonMap_body = {
        "displayName": user?.displayName,
        "email": user?.email,
        "id": "117824256095574502399",
        "photoUrl": user?.photoUrl,
        "referal_code": "",
        "socialAuth": "google",
        "username": username,
        "gender": "Male",
        "user_type": "google"
      };
      final response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/api/register'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(jsonMap_body),
      );
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        var post = jsonDecode(response.body);
        print(post);
        if (post['message'] == 'Email Already Exists') {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
              msg: post['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white);
          Future.delayed(const Duration(milliseconds: 1000), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          });
        } else if (post['message'] == 'Successfully Registered') {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
              msg: post['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white);
          Future.delayed(const Duration(milliseconds: 1000), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          });
        } else if (jsonDecode(response.body)['username'] != null) {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
              msg: jsonDecode(response.body)['username'][0],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Color.fromARGB(255, 194, 31, 31),
              textColor: Colors.white);
          Future.delayed(const Duration(milliseconds: 1000), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          });
        }
      } else if (response.statusCode == 400) {
        var post = jsonDecode(response.body);
        print(post);
        if (post['message'] == 'Email Already Exists') {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
              msg: post['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white);
          Future.delayed(const Duration(milliseconds: 1000), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          });
        }
      } else {
        var post = jsonDecode(response.body);
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
            msg: post,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 194, 31, 31),
            textColor: Colors.white);
        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        });
      }
    } else if (register_type == 'facebook') {
      if (storage.getItem("fb_email")) {
        Map<String, dynamic> jsonMap_body = {
          "displayName": storage.getItem("fb_name"),
          "email": storage.getItem("fb_email"),
          "referal_code": "",
          "photoUrl": storage.getItem("fb_db"),
          "user_type": "facebook",
          "username": username,
          "gender": "Male"
        };
        final response = await http.post(
          Uri.parse('${dotenv.env['API_URL']}/api/register'),
          // headers: {
          //     'Content-type': 'application/json',
          //     'Accept': 'application/json'
          // },
          // body: jsonEncode(jsonMap_body),
        );
        if (response.statusCode == 200) {
          var post = jsonDecode(response.body);
          if (post['message'] == 'Email Already Exists') {
            Fluttertoast.showToast(
                msg: post['message'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white);
            Future.delayed(const Duration(milliseconds: 1000), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            });
          } else if (post['message'] == 'Successfully registerd') {
            Fluttertoast.showToast(
                msg: post['message'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white);
            Future.delayed(const Duration(milliseconds: 1000), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            });
          }else{
            Future.delayed(const Duration(milliseconds: 1000), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Registerpage()),
              );
            });
          }
        } else {
          throw Exception('Failed to create album.');
        }
      }
    } else if (register_type == 'email') {
      String email = storage.getItem('email');
      String password = storage.getItem('password');

      Map<String, dynamic> jsonMap_body = {
        "name": username,
        "email": email,
        "password": password,
        "username": username,
        "gender": "Male",
        "referal_code": Referral_code
      };
      final response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/api/register'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(jsonMap_body),
      );
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        var post = jsonDecode(response.body);
        print(post);
        if (post['message'] == 'Email Already Exists') {
          Fluttertoast.showToast(
              msg: post['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white);
          Future.delayed(const Duration(milliseconds: 1000), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          });
        } else if (post['message'] == 'Successfully Registered') {
          Fluttertoast.showToast(
              msg: post['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white);
          Future.delayed(const Duration(milliseconds: 1000), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          });
        } else {
          post["error"].forEach((key, messages) {
            if ("email" == key) {
              setState(() {
                isLoading = false;
              });
              // show email errors like this
              for (var message in messages) {
                Fluttertoast.showToast(
                    msg: message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white);
              }
            } else if ("password" == key) {
              setState(() {
                isLoading = false;
              });
              // show password erros like this
              for (var message in messages) {
                Fluttertoast.showToast(
                    msg: message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white);
              }
            } else if ("username" == key) {
              setState(() {
                isLoading = false;
              });
              // show password erros like this
              for (var message in messages) {
                Fluttertoast.showToast(
                    msg: message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white);
              }
            }
          });
          // if (post['error']) {
          //   Fluttertoast.showToast(
          //       msg: post['error'],
          //       toastLength: Toast.LENGTH_SHORT,
          //       gravity: ToastGravity.BOTTOM,
          //       timeInSecForIosWeb: 1,
          //       backgroundColor: Colors.red,
          //       textColor: Colors.white);
          // }
        }
      }
    }

    // final response = await http.post(

    //   Uri.parse('${dotenv.env['API_URL']}/api/register'),
    //   headers: {
    //        'Content-type': 'application/json',
    //        'Accept': 'application/json'
    //   },
    //   // body: json.encode(jsonMap_body),

    // );
    // if (response.statusCode == 200) {
    //     var post = jsonDecode(response.body);
    //     if(post['message'] == 'Email Already Exists'){
    //       Fluttertoast.showToast(
    //         msg: post['message'],
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.BOTTOM,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.yellow
    //       );
    //       Future.delayed(const Duration(milliseconds: 1000), () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) =>  const LoginPage()),
    //         );
    //       });
    //     }
    // } else {
    //   throw Exception('Failed to create album.');
    // }
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff042c96),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 30, 10, 10),
              child: Expanded(
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'H',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontFamily: "SFPRO semibold"),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'EY',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: "SFPRO semibold"),
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
                                    fontFamily: "SFPRO semibold"),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'HERE',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: "SFPRO semibold"),
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
                                    fontFamily: "SFPRO semibold"),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'come to',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: "SFPRO semibold"),
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
                                    fontFamily: "SFPRO semibold"),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Zaro',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 240, 159, 39),
                                        fontSize: 25,
                                        fontFamily: "SFPRO semibold"),
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
                                    fontFamily: 'SFPRO regular'),
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
                                                fontSize: 20.0,
                                                fontFamily: 'SFPRO reqular',
                                                color: Colors.white),
                                            children: [
                                              TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20.0,
                                                  fontFamily: 'SFPRO reqular',
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
                                  contentPadding:
                                      EdgeInsets.fromLTRB(30, 10, 10, 10),
                                  filled: true,
                                  fillColor: Color(0xff1c40a0),
                                ),
                                validator: (val) {
                                  if (val != '') {
                                    setState(() {
                                      username = val.toString();
                                    });
                                  }

                                  return val!.isEmpty
                                      ? 'please provide a valid Username'
                                      : null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          width: width,
                          height: height * 0.30,
                          child: Column(
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
                                      child: Icon(
                                        Icons.man,
                                        color: Colors.white,
                                      )),
                                  Icon(Icons.woman, color: Colors.white),
                                  RichText(
                                    text: const TextSpan(
                                        text: 'Gender',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'SFPRO reqular',
                                            color: Colors.white),
                                        children: [
                                          TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 20.0,
                                              fontFamily: 'SFPRO reqular',
                                            ),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        if (man) {
                                          man = false;
                                        } else {
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
                                            color: man
                                                ? Colors.white
                                                : Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      width: width * 0.26,
                                      child: Image.asset('images/EMO2.png'),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        if (woman) {
                                          woman = false;
                                        } else {
                                          woman = true;
                                          man = false;
                                          mixed = false;
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: woman
                                                ? Colors.white
                                                : Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      width: width * 0.26,
                                      child: Image.asset('images/EMO3.png'),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        if (mixed) {
                                          mixed = false;
                                        } else {
                                          mixed = true;
                                          woman = false;
                                          man = false;
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: mixed
                                                ? Colors.white
                                                : Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      width: width * 0.26,
                                      child: Image.asset('images/EMO1.png'),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
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
                                  fontFamily: 'SFPRO regular'),
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
                                            fontSize: 20.0,
                                            fontFamily: 'SFPRO reqular',
                                            color: Colors.white),
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
                                contentPadding:
                                    EdgeInsets.fromLTRB(30, 10, 10, 10),
                                filled: true,
                                fillColor: Color(0xff1c40a0),
                              ),
                              validator: (val) {
                                if (val != '') {
                                  setState(() {
                                    Referral_code = val.toString();
                                  });
                                }
                              },
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
                                        if (checkboxValue) {
                                          checkboxValue = false;
                                        } else {
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
                                      child: Text(
                                        'I accept the Terms & conditions and Privacy \t Policy by signing up',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'SFPRO reqular',
                                            color: Colors.white),
                                      )),
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
                              onPressed: () {
                                if (formGlobalKey.currentState!.validate()) {
                                  if (man || woman || mixed) {
                                    createAlbum('google');
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Please Select Gender',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.yellow);
                                  }
                                }
                              },
                              child: isLoading
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,

                                      // as elevated button gets clicked we will see text"Loading..."
                                      // on the screen with circular progress indicator white in color.
                                      //as loading gets stopped "Submit" will be displayed
                                      children: const [
                                        Text(
                                          'Loading...',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ],
                                    )
                                  : const Text(
                                      "Signin",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffffa300),
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
