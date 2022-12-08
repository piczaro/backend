// ignore_for_file: unnecessary_const
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:pixzaro/Dashboard.dart';
import 'package:pixzaro/Register.dart';
import 'google_signin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'Bottom_modal.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Forgot_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  bool clikc = true;
  String email = '';
  String Mobile_number = '';
  String password = '';
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;
  Map jsonMap_body = new Map<String, dynamic>();

  // String? token;
  bool _passwordVisible = false;
  final LocalStorage storage = new LocalStorage('my_data');
  @override
  void initState() {
    super.initState();
    checkPreviousSessionAndRedirect();
    _passwordVisible = false;
    final token = storage.getItem("jwt_token");
    print(token);
  }

  void checkPreviousSessionAndRedirect() async {
    final token = await storage.getItem("jwt_token");
    print(token);
    if (token != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const Dashboard(
                  index: 0,
                  profileindex: 0,
                )),
      );
    }
  }

  Future<http.Response?> createAlbum(String logintype) async {
    print(await storage.getItem("jwt_token"));
    print("tgest");
    Map<String, dynamic> jsonMap_body = {
      "email": email,
      "password": password,
    };
    if (logintype == "email") {
      jsonMap_body = {
        "email": email,
        "password": password,
      };
    } else if (logintype == "mobile") {
      jsonMap_body = {
        "email": email,
        "password": password,
      };
    }

    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/api/login'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(jsonMap_body),
      );
      if (response.statusCode == 200) {
        var post = jsonDecode(response.body);
        print(post);
        if (post["token"] != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('jwt_token', post['token']);
          await storage.setItem('jwt_token', post['token']);
          await storage.setItem('user_id', post['data']['id']);
          await storage.setItem('username', post['data']['username']);
          await storage.setItem('user_type', post['data']['user_type']);
          await storage.setItem('referal_code', post['data']['referal_code']);
          await storage.setItem('profile_pic', post['data']['profile_pic']);
          print(post['data']['id']);
          // print(await storage.getItem("jwt_token"));
          Future.delayed(const Duration(milliseconds: 1000), () {
            setState(() {
              isLoading = false;
            });
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const Dashboard(
                    index: 0,
                    profileindex: 0,
                  ),
                ),
                (Route<dynamic> route) => false);
          });
        } else if (post["data"] == null || post["token"] == null) {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
              msg: "Invalid login details",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.yellow);
        }
      } else if (response.statusCode == 401) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
            msg: "Invalid login details",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
      } else {
        Fluttertoast.showToast(
            msg: "Invalid login details",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
        setState(() {
          isLoading = false;
        });
        // throw Exception('Failed to create album.');
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: 'Please check your internet connection',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    }
  }

  bool isLoading = false;
  Future signIn() async {
    // final user = await GoogleSignInApi.signout();

    final user = await GoogleSignInApi.login();
    Map<String, dynamic> jsonMap_body = {
      "email": user?.email,
      "user_type": "google"
    };
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/api/login'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(jsonMap_body),
      );
      if (response.statusCode == 200) {
        var post = jsonDecode(response.body);
        print("googleresgister");
        print(post);
        if (post["message"] == "User not Found") {
          Fluttertoast.showToast(
              msg: "Invalid login details",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.yellow);
          setState(() {
            isLoading = false;
          });
          Future.delayed(const Duration(milliseconds: 1000), () {
            setState(() {
              isLoading = false;
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Registerpage()),
            );
          });
        } else if (post["token"] != '') {
          await storage.setItem('jwt_token', post['token']);
          await storage.setItem('user_id', post['data']['id']);
          await storage.setItem('username', post['data']['username']);
          await storage.setItem('user_type', post['data']['user_type']);
          print(post['data']['id']);

          Future.delayed(const Duration(milliseconds: 1000), () {
            setState(() {
              isLoading = false;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Dashboard(
                        index: 0,
                        profileindex: 0,
                      )),
            );
          });
        } else if (post["data"] != '') {}
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(
            msg: "Invalid login details",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
      } else {
        Fluttertoast.showToast(
            msg: "Invalid login details",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
        setState(() {
          isLoading = false;
        });
        // throw Exception('Failed to create album.');
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: 'Please check your internet connection',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    }
    // if (user == null) {
    //   Fluttertoast.showToast(
    //       msg: 'Google signin faild',
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.yellow);
    // } else {
    //   Fluttertoast.showToast(
    //       msg: 'Google singin Successfull',
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       backgroundColor: Color.fromARGB(255, 24, 133, 14),
    //       textColor: Color.fromARGB(255, 255, 255, 255));
    // }
    print(user);
  }

  void _printCredentials() {
    print(
      _accessToken!.toJson(),
    );
  }

  void initiateFacebookLogin() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      _printCredentials();
      // get the user data
      // by default we get the userId, email,name and picture
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      _userData = userData;
      Map<String, dynamic> jsonMap_body = {
        "email": userData!["email"],
        "user_type": "facebook"
      };
      try {
        setState(() {
          isLoading = true;
        });
        final response = await http.post(
          Uri.parse('${dotenv.env['API_URL']}/api/login'),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          },
          body: json.encode(jsonMap_body),
        );
        if (response.statusCode == 200) {
          var post = jsonDecode(response.body);
          print(post["token"]);
          if (post["message"] == "User not Found") {
            Fluttertoast.showToast(
                msg: "Invalid login details",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.yellow);
            setState(() {
              isLoading = false;
            });
            Future.delayed(const Duration(milliseconds: 1000), () {
              setState(() {
                isLoading = false;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Registerpage()),
              );
            });
          } else if (post["token"] != '') {
            await storage.setItem('jwt_token', post['token']);
            await storage.setItem('user_id', post['data']['id']);
            await storage.setItem('username', post['data']['username']);
            await storage.setItem('user_type', post['data']['user_type']);
            print(post['data']['id']);

            Future.delayed(const Duration(milliseconds: 1000), () {
              setState(() {
                isLoading = false;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Dashboard(
                          index: 0,
                          profileindex: 0,
                        )),
              );
            });
          } else if (post["data"] != '') {}
        } else if (response.statusCode == 401) {
          Fluttertoast.showToast(
              msg: "Invalid login details",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.yellow);
        } else {
          Fluttertoast.showToast(
              msg: "Invalid login details",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.yellow);
          setState(() {
            isLoading = false;
          });
          // throw Exception('Failed to create album.');
        }
      } on SocketException catch (_) {
        Fluttertoast.showToast(
            msg: 'Please check your internet connection',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
      }
    } else {
      print(result.status);
      print(result.message);
    }
    // if (result == null) {
    //   Fluttertoast.showToast(
    //       msg: 'Facebook signin Faild',
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.yellow);
    // } else {
    //   Fluttertoast.showToast(
    //       msg: 'Facebook signin Successfull',
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       backgroundColor: Color.fromARGB(255, 24, 133, 14),
    //       textColor: Color.fromARGB(255, 255, 255, 255));
    // }
    print(result);
  }

  int tabsPosition = 0;
  final formGlobalKey = GlobalKey<FormState>();
  final formGlobalKey_mobile = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TabController _controller =
        TabController(length: 2, vsync: this, initialIndex: tabsPosition);
    // _controller.animateTo(tabsPosition);
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
                  child: const Text(
                    "Let’s sign you in.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontFamily: 'SFPRO semibold'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 7, 10, 0),
                  child: const Text(
                    "Welcome back",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'SFPRO reqular'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 7, 10, 30),
                  child: const Text(
                    "You’ve been missed!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'SFPRO light'),
                  ),
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                          width: width * 0.35,
                          child: TabBar(
                            indicatorColor: Colors.transparent,
                            unselectedLabelColor: Colors.grey,
                            indicator:
                                const BoxDecoration(color: Color(0xffffa300)),
                            controller: _controller,
                            tabs: [
                              Tab(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      tabsPosition = 0;
                                    });
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: const FaIcon(
                                        FontAwesomeIcons.mobileScreen),
                                  ),
                                ),
                              ),
                              Tab(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      tabsPosition = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        const FaIcon(FontAwesomeIcons.envelope),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ]),
                Container(
                  height: height * 0.25,
                  child: TabBarView(controller: _controller, children: <Widget>[
                    Form(
                      key: formGlobalKey_mobile,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'SFPRO regular'),
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff979197), width: 1.5),
                            ),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'SFPRO reqular',
                                color: Colors.white),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  top: 0), // add padding to adjust icon
                              child: Icon(
                                IconData(
                                  0xe4a2,
                                  fontFamily: 'MaterialIcons',
                                ),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          validator: (val) {
                            if (val != '' && val!.length < 10) {
                              return val!.length < 10
                                  ? 'please provide a valid number'
                                  : null;
                            }
                            if (val != '' && val!.length >= 10) {
                              setState(() {
                                Mobile_number = val;
                              });
                            }

                            return val!.isEmpty
                                ? 'please provide a mobile number'
                                : null;
                          },
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                        child: Form(
                      key: formGlobalKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                            child: TextFormField(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'SFPRO regular'),
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff979197), width: 1.5),
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'SFPRO reqular',
                                    color: Colors.white),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      top: 0), // add padding to adjust icon
                                  child: Icon(
                                    IconData(
                                      0xe3c3,
                                      fontFamily: 'MaterialIcons',
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              validator: (val) {
                                if (val != '') {
                                  setState(() {
                                    email = val!;
                                  });
                                }

                                return val!.isEmpty
                                    ? 'please provide email'
                                    : null;
                              },
                            ),
                          ),
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
                                hintText: 'Password',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Forgot_password(),
                                      ));
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'SFPRO reqular'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                  ]),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(width * 0.10, height * 0.05, 0, 0),
                  width: width * 0.80,
                  height: height * 0.08,
                  child: ElevatedButton(
                      onPressed: () {
                        print(tabsPosition);
                        if (tabsPosition == 0) {
                          if (formGlobalKey_mobile.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return const Bottommodal();
                                });
                          }
                        } else {
                          if (formGlobalKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();

                            createAlbum("email");
                          }
                        }
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
                              "Signin",
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
                Container(
                  width: width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, height * 0.04, 0, 0),
                          child: const Text(
                            "or",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          width * 0.30, height * 0.01, 0, 0),
                      child: GestureDetector(
                        onTap: signIn,
                        child: Image.asset('images/oval.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          width * 0.15, height * 0.01, 0, 0),
                      child: GestureDetector(
                        onTap: () => initiateFacebookLogin(),
                        child: Image.asset('images/oval-fb.png'),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, height * 0.04, 0, 0),
                        child: RichText(
                          text: TextSpan(
                              text: 'Don\'t have a account ?',
                              children: [
                                TextSpan(
                                  text: 'Register',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // print("The word touched is ");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Registerpage(),
                                          ));
                                    },
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
        ),
      ),
    );
  }
}
