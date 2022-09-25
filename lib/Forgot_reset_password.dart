import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Bottom_modal_for_register.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/src/services/platform_channel.dart';
import 'google_signin.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'Login.dart';
import 'package:localstorage/localstorage.dart';
import 'Register_setup.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   // Optional clientId
//   // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
//   scopes: <String>[
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

class Forgot_reset_password extends StatefulWidget {
  const Forgot_reset_password({Key? key}) : super(key: key);

  @override
  State<Forgot_reset_password> createState() => _Forgot_reset_password();
}

class _Forgot_reset_password extends State<Forgot_reset_password> {
  String email = '';
  String password = '';
  String confirmpassword = '';
  final storage = new LocalStorage('my_data');
  bool clikc = true;
  String socialAuth = '';
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  Map<String, dynamic> jsonMap_body = {
    "displayName": "test111@gmail.com",
    "email": "suraj11111@gmail.com",
    "id": "117824256095574502399",
    "photoUrl":
        "https://lh3.googleusercontent.com/a-/AOh14Gg-iYPOraKORXKZNygwRZQXO4Zq0dcC7XlTLggMSg",
    "serverAuthCode": "",
    "socialAuth": "google",
    "username": "username",
    "gender": "Male"
  };
  bool _passwordVisible = false;
  bool _RepasswordVisible = false;
  Future<http.Response?> createemail_album() async {
    var email = await storage.getItem("forgot_mail");
    var otp = await storage.getItem("forgot_otp");

    if (confirmpassword != '') {
      Map<String, dynamic> jsonMap_body = {
        "email": email,
        "otp": otp,
        "password": confirmpassword
      };
      try {
        setState(() {
          isLoading = true;
        });
        final response = await http.post(
          Uri.parse('${dotenv.env['API_URL']}/api/password_reset'),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          },
          body: json.encode(jsonMap_body),
        );
        print(response);
        if (response.statusCode == 200) {
          var post = jsonDecode(response.body);
          print(post);
          if (post["message"] == "Password has been successfully changed") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          } else if (post["message"] == "Invalid") {
            Fluttertoast.showToast(
                msg: "Invalid OTP",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Color.fromARGB(255, 216, 19, 19),
                textColor: Color.fromARGB(255, 255, 255, 255));
          }
        }
      } catch (e) {}
    }

    // String social_data  = storage.getItem('register_type');
  }

  bool isLoading = false;

  Future<http.Response?> createAlbum(String logintype) async {
    final response = await http.post(
      Uri.parse('${dotenv.env['API_URL']}/api/register'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
      body: json.encode(jsonMap_body),
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
            textColor: Colors.yellow);
        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        });
      }
    } else {
      throw Exception('Failed to create album.');
    }
  }

  Future<void> _handleSignOut() => GoogleSignInApi.signout();
  Future signIn() async {
    try {
      final user = await GoogleSignInApi.login();
      if (user == null) {
        Fluttertoast.showToast(
            msg: 'Google signin faild',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
      } else {
        storage.setItem('register_type', 'google');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Register_setup()),
        );
      }
      // String social_data  = storage.getItem('social_data');
      // // createAlbum("google");
      // print(social_data);
    } on PlatformException catch (_) {
      Fluttertoast.showToast(
          msg: 'Google singin Successfull',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 24, 133, 14),
          textColor: Color.fromARGB(255, 255, 255, 255));
    }
  }

  void initiateFacebookLogin() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      // get the user data
      // by default we get the userId, email,name and picture
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      _userData = userData;

      print(userData);
    } else {
      print(result.status);
    }
    if (result == null) {
      Fluttertoast.showToast(
          msg: 'Facebook signin Faild',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    } else {
      storage.setItem('register_type', 'facebook');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Register_setup()),
      );
    }
    print(result);
  }

  int tabsPosition = 0;
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
            child: Form(
              key: formGlobalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                      child: const Text(
                        "Reset your Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontFamily: 'SFPRO semibold'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          obscureText: !_passwordVisible,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'SFPRO regular'),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff979197), width: 1.5),
                            ),
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'SFPRO reqular',
                                color: Colors.white),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  top: 0), // add padding to adjust icon
                              child: Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (val) {
                            if (val != '') {
                              setState(() {
                                password = val!;
                              });
                            }

                            return val!.isEmpty
                                ? 'please enter a password'
                                : null;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          obscureText: !_RepasswordVisible,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'SFPRO regular'),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff979197), width: 1.5),
                            ),
                            hintText: 'Re-enter Password',
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'SFPRO reqular',
                                color: Colors.white),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  top: 0), // add padding to adjust icon
                              child: Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _RepasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _RepasswordVisible = !_RepasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (val) {
                            if (val != '') {}
                            if (password == val) {
                              setState(() {
                                confirmpassword = val!;
                              });
                            } else {
                              return "Password not match";
                            }
                            return val!.isEmpty
                                ? 'please enter a password'
                                : null;
                          },
                        ),
                      ),
                    ],
                  )),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(width * 0.10, height * 0.05, 0, 0),
                    width: width * 0.80,
                    height: height * 0.08,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formGlobalKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();

                            createemail_album();
                          }
                          // showModalBottomSheet(
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(30.0),
                          // ),
                          // context: context,
                          // isScrollControlled: true,
                          // builder: (BuildContext context) {
                          //   return const Bottommodal_for_register();
                          // }
                          // );
                        },
                        child: isLoading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,

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
                                "Submit",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xffffa300),
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
