import 'package:flutter/material.dart';
import './Login.dart';
import './Register.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pixzaro/Dashboard.dart';
import 'Dashboard.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString('jwt_token');
  final storage = LocalStorage('my_data');
  print(email);
  print(storage);
  await storage.ready;
  final token = await storage.getItem('jwt_token');
  print(token);
  print("token");
  await dotenv.load();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    home: token != null ? Dashboard(index: 0, profileindex: 0) : MyHomePage(),
    // home:MyHomePage() ,
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  final storage = LocalStorage('my_data');
  MyApp({Key? key}) : super(key: key);
  void checkPreviousSessionAndRedirect() async {
    
    final token = await storage.getItem("jwt_token");
    print(token);
    print("askdhfjksahfkjshdakf");
    // if (token != null) {
    //   MaterialPageRoute(
    //       builder: (context) => const Dashboard(
    //             index: 0,
    //             profileindex: 0,
    //           ));
    // }
  }

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
  late Future<String> futureAlbum;

  void loaddata() async {
    final storage = LocalStorage('my_data');
     print("loaddata");
    String isnotloged = "true";
   
    final token = await storage.getItem('jwt_token');
   
    print(token);
    if (token != null) {
      _changePage();
    }
    
  }
  @override
  void initState() {
    print("asdfsdf");
    super.initState();
    checkPreviousSessionAndRedirect();
    loaddata();
    //  print("asuifdhjksadfhljks");
  }
  void checkPreviousSessionAndRedirect() async {
    final LocalStorage  storage = LocalStorage('my_data.json');

    await storage.ready;
    final token = await storage.getItem("jwt_token");
    print(storage);
    print("sjkdfhskjdhf");
    print("checkPreviousSessionAndRedirect");
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

  

  _changePage() {
    Navigator.of(context).pushReplacement(
      // this is route builder without any animation
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => Dashboard(
          index: 0,
          profileindex: 0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff1042aa),
      body: SafeArea(
        child: Expanded(
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
                      children: <Widget>[
                        Image.asset('images/group.png'),
                        Image.asset('images/piczaro.png')
                      ]),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: const Text(
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
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      width: width * 0.80,
                      height: height * 0.07,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Registerpage()),
                            );
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff1042aa),
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          )),
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
