import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'Setting_edit.dart';
import 'package:file_picker/file_picker.dart';
import 'Change_bank_account.dart';
import 'Refer_earn.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'mydrawer.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class Mybalance extends StatefulWidget {
  const Mybalance({
    Key? key,
  }) : super(key: key);

  @override
  State<Mybalance> createState() => _Mybalance();
}

class _Mybalance extends State<Mybalance> {
  int counter = 2;
  String _title = "Wallet";
  final storage = new LocalStorage('my_data');
  String useremail = "test@gmail.com";
  String gender = "Male";
  late Razorpay _razorpay;
  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    setState(() {
      // useremail  = storage.getItem('Usermail');
      // gender  = storage.getItem('usergender');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  bool isLoading = false;
  void openCheckout( String name) async {
    setState(() {
      isLoading = true;
    });

    var options = {
      'key': 'rzp_test_0WWfLPotWIzETC',
      'amount': num.parse(addAmount.toString()) * 100,
      'name': 'Piczaro.',
      'description': name,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9003306701', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }
  void postAbalance(String amount) async {
    Map<String, dynamic> jsonMap_body = {
      "amount":amount
    };
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    setState(() {
      isLoading = true;
    });
    final response = await http.post(
      Uri.parse('${dotenv.env['API_URL']}/api/post_balance/${user_id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: json.encode(jsonMap_body),
    );
    if (response.statusCode == 200) {
      var post = jsonDecode(response.body);
      print(post);
      Fluttertoast.showToast(
            msg: "Successfully Add Your Balance",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 38, 131, 15),
            textColor: Color.fromARGB(255, 255, 255, 255));
      
    }
  }
  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message,
    //     timeInSecForIos: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    // Fluttertoast.showToast(
    //     msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    postAbalance(addAmount.toString());
  }
  int addAmount = 0;
  int balance = 0;
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  
  Future<int> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    final response = await http.get(
      Uri.parse('${dotenv.env['API_URL']}/api/check_balance/${user_id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['data'];
      print(jsonData);
      return jsonData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String strDigits(int n) => n.toString().padLeft(2, '0');

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.10),
        child: AppBar(
          // leading: Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     IconButton(
          //       icon: const Icon(Icons.arrow_back, color: Colors.white),
          //       onPressed: () => Navigator.of(context).pop(),
          //     ),
          //   ],
          // ),
          title: Center(
            child: Text(
              _title,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          actions: <Widget>[
            // Using Stack to show Notification Badge
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Stack(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.notifications,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            counter = 0;
                          });
                        }),
                    Positioned(
                      right: 11,
                      top: 11,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: const Color(0xff1042aa),
        ),
      ),
      body: SingleChildScrollView(
          child: FutureBuilder<int>(
              future:
                  loaddata(), // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.blue,
                    ));
                  default:
                    if (snapshot.hasError) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.blue,
                      ));
                    } else {
                      return Container(
                        width: width,
                        margin: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: const Text(
                                  "Available Amount",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "SFPRO reqular"),
                                ),
                              ),
                              Text(
                                "₹ ${snapshot.data}",
                                style: TextStyle(
                                    fontSize: 30, fontFamily: "SFPRO BOLD"),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Text(
                                        "Add",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "SFPRO reqular"),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          addAmount = 50;
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: addAmount == 50
                                                  ? Color(0xffffa300)
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Text(
                                              "₹ 50",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: "SFPRO reqular",
                                                color: addAmount == 50
                                                    ? Colors.white
                                                    : Colors.black,
                                                backgroundColor: addAmount == 50
                                                    ? Color(0xffffa300)
                                                    : Colors.white,
                                              ),
                                            ),
                                          )),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          addAmount = 100;
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: addAmount == 100
                                                  ? Color(0xffffa300)
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Text(
                                              "₹ 100",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: "SFPRO reqular",
                                                color: addAmount == 100
                                                    ? Colors.white
                                                    : Colors.black,
                                                backgroundColor:
                                                    addAmount == 100
                                                        ? Color(0xffffa300)
                                                        : Colors.white,
                                              ),
                                            ),
                                          )),

                                      // Text(
                                      //   "₹ 100",
                                      //   style: TextStyle(
                                      //       fontSize: 18, fontFamily: "SFPRO reqular"),
                                      // ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          addAmount = 500;
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: addAmount == 500
                                                  ? Color(0xffffa300)
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Text(
                                              "₹ 500",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: "SFPRO reqular",
                                                color: addAmount == 500
                                                    ? Colors.white
                                                    : Colors.black,
                                                backgroundColor:
                                                    addAmount == 500
                                                        ? Color(0xffffa300)
                                                        : Colors.white,
                                              ),
                                            ),
                                          )),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          addAmount = 1000;
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: addAmount == 1000
                                                  ? Color(0xffffa300)
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Text(
                                              "₹ 1000",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: "SFPRO reqular",
                                                color: addAmount == 1000
                                                    ? Colors.white
                                                    : Colors.black,
                                                backgroundColor:
                                                    addAmount == 1000
                                                        ? Color(0xffffa300)
                                                        : Colors.white,
                                              ),
                                            ),
                                          )),
                                      // const Text(
                                      //   "₹ 1000",
                                      //   style: TextStyle(
                                      //       fontSize: 18, fontFamily: "SFPRO reqular"),
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                width: width * 0.80,
                                height: height * 0.07,
                                child: ElevatedButton(
                                    onPressed: () {
                                      openCheckout("Add money");
                                    },
                                    child: const Text(
                                      "Add Money",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color(0xffffa300),
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ))),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Change_bank_account()),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        "Change bank account",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SFPRO reqular",
                                          color: Color(0xffffa300),
                                          decoration: TextDecoration.underline,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Enter amount"),
                                  ],
                                ),
                              ),
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
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                width: width * 0.80,
                                height: height * 0.07,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Transfer Bank Account",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color(0xffffa300),
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ))),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Change_bank_account()),
                                  );
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Recent Transaction ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SFPRO reqular",
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Refer_earn()),
                                  );
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Refer & Earn",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SFPRO reqular",
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      );
                    }
                }
                // return Center(
                //     child: CircularProgressIndicator(
                //   color: Colors.blue,
                // ));
              })),
      drawer: DrawerWidget(),
    );
  }
}
