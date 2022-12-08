import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'Dashboard.dart';
import 'Setting_edit.dart';
import 'package:file_picker/file_picker.dart';
import 'mydrawer.dart';
import 'Appbar.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Appbar.dart';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Change_bank_account extends StatefulWidget {
  const Change_bank_account({
    Key? key,
  }) : super(key: key);

  @override
  State<Change_bank_account> createState() => _Change_bank_account();
}

class _Change_bank_account extends State<Change_bank_account> {
  int counter = 2;
  String _title = "Bank Details";
  final storage = new LocalStorage('my_data');
  String useremail = "test@gmail.com";
  String gender = "Male";
  bool isLoading = false;

  String dropdownvalue = 'Aadhar card';

  var items = [
    'Aadhar card',
    'Pan card',
  ];
  bool loading = true;
  Future<Map<String, dynamic>> loaddata() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    final response = await http.get(
      Uri.parse('${dotenv.env['API_URL']}/api/get_bank_detail/${user_id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
        //'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjYxMDY0MjkzLCJleHAiOjE2NjEwNjc4OTMsIm5iZiI6MTY2MTA2NDI5MywianRpIjoiNHZ3NXpoSWY4WEFuajJQZyIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.2uRgNx36JrNZzlezxQ7qfkqNsL8ydwxyZPCFUTgDsW',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['data'][0];
      print(jsonData);
      if (jsonData != null) {
        setState(() {
           email = jsonData["email"];
           mobile_number = jsonData["mobile_no"];
           name = jsonData["document_name"];
           document_number = jsonData["document_number"];
           account_number = jsonData["bank_account_number"];
           account_name = jsonData["bank_account_name"];
           branch_name = jsonData["branch_name"];
           IFSC_code = jsonData["ifsc_code"];
        });
      }
    } else {}
    setState(() {
      loading = false;
    });
    return jsonDecode(response.body)['data'][0];
  }

  late Future<Map<String, dynamic>> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = loaddata();
  }
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(
                index: 0,
                profileindex: 0,
              ),
            ),
          );
        }
        break;
      case 1:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(
                index: 1,
                profileindex: 0,
              ),
            ),
          );
        }
        break;
      case 2:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(
                index: 2,
                profileindex: 0,
              ),
            ),
          );
        }
        break;
      case 3:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(
                index: 3,
                profileindex: 0,
              ),
            ),
          );
          // _scaffoldKey.currentState!.openDrawer();
        }
        break;
    }
  }
  
  Future<http.Response?> createAlbum() async {
    final storage = LocalStorage('my_data');
    final token = await storage.getItem('jwt_token');
    final user_id = await storage.getItem('user_id');
    Map<String, dynamic> jsonMap_body = {
      "mobile_no": mobile_number,
      "email": email,
      "document_type": dropdownvalue.toString(),
      "document_name": dropdownvalue.toString(),
      "document_number": document_number,
      "bank_account_number": account_number,
      "bank_account_name": account_name,
      "ifsc_code": IFSC_code,
      "branch_name": branch_name
    };
    print(jsonMap_body);
    setState(() {
      isLoading = true;
    });
    final response = await http.post(
      Uri.parse('${dotenv.env['API_URL']}/api/create_bank_detail/${user_id}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: json.encode(jsonMap_body),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['message'];
      print(jsonData);
      if (jsonDecode(response.body)['success']) {
        Fluttertoast.showToast(
            msg: "Bank details updated",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 59, 146, 1),
            textColor: Color.fromARGB(255, 255, 255, 255));
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  String email = "";
  String mobile_number = "";
  String name = "";
  String document_number = "";
  String account_number = "";
  String account_name = "";
  String branch_name = "";
  String IFSC_code = "";
  final formGlobalKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String strDigits(int n) => n.toString().padLeft(2, '0');

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.08),
          child: CustomAppBar(title: _title)),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
          child: Form(
            key: formGlobalKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Got Verified",
                          style: TextStyle(
                              fontSize: 20, fontFamily: "SFPRO reqular"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College",
                      style:
                          TextStyle(fontSize: 16, fontFamily: "SFPRO reqular"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Mobile Number"),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: TextFormField(
                      
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontFamily: 'SFPRO regular'),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff979197), width: 1.5),
                        ),
                        hintText: 'Enter your mobile number',
                        hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'SFPRO reqular',
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      controller: TextEditingController(
                                        text: "${mobile_number.toString()}"),
                      validator: (val) {
                        if (val != '') {
                          setState(() {
                            mobile_number = val!;
                          });
                        }

                        return val!.isEmpty
                            ? 'please provide mobile number'
                            : null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Email"),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontFamily: 'SFPRO regular'),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff979197), width: 1.5),
                        ),
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'SFPRO reqular',
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      controller: TextEditingController(
                                        text: "${email.toString()}"),
                      validator: (val) {
                        if (val != '') {
                          setState(() {
                            email = val!;
                          });
                        }

                        return val!.isEmpty ? 'please provide email' : null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Document Verified",
                          style: TextStyle(
                              fontSize: 20, fontFamily: "SFPRO reqular"),
                        ),
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        //   decoration: BoxDecoration(
                        //       color: Colors.green,
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(20))),
                        //   child: Icon(Icons.check, color:  Color.fromARGB(255, 0, 0, 0)),
                        // )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Select Document"),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: DropdownButton(
                      // Initial Value
                      value: dropdownvalue,
                      alignment: Alignment.center,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onChanged: (val) {
                        setState(() {
                          dropdownvalue = val.toString();
                        });
                      },
                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: SizedBox(
                            width: width * 0.73,
                            child: Text(
                              items,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      // onChanged: (String? newValue) {
                      //   setState(() {
                      //     dropdownvalue = newValue!;
                      //   });
                      // },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Name"),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontFamily: 'SFPRO regular'),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff979197), width: 1.5),
                        ),
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'SFPRO reqular',
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      controller: TextEditingController(
                                        text: "${name.toString()}"),
                      validator: (val) {
                        if (val != '') {
                          setState(() {
                            name = val!;
                          });
                        }

                        return val!.isEmpty ? 'please provide name' : null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Document Number"),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontFamily: 'SFPRO regular'),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff979197), width: 1.5),
                        ),
                        hintText: 'Enter selected document number',
                        hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'SFPRO reqular',
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      controller: TextEditingController(
                                        text: "${document_number.toString()}"),
                      validator: (val) {
                        if (val != '') {
                          setState(() {
                            document_number = val!;
                          });
                        }

                        return val!.isEmpty
                            ? 'please provide document number'
                            : null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Bank Account Details",
                          style: TextStyle(
                              fontSize: 20, fontFamily: "SFPRO reqular"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Account Number"),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontFamily: 'SFPRO regular'),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff979197), width: 1.5),
                        ),
                        hintText: 'Enter your account number',
                        hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'SFPRO reqular',
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      controller: TextEditingController(
                                        text: "${account_number.toString()}"),
                      validator: (val) {
                        if (val != '') {
                          setState(() {
                            account_number = val!;
                          });
                        }

                        return val!.isEmpty
                            ? 'please provide account number'
                            : null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Account Name"),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontFamily: 'SFPRO regular'),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff979197), width: 1.5),
                        ),
                        hintText: 'Enter your account name',
                        hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'SFPRO reqular',
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                       controller: TextEditingController(
                                        text: "${account_name.toString()}"),
                      validator: (val) {
                        if (val != '') {
                          setState(() {
                            account_name = val!;
                          });
                        }

                        return val!.isEmpty
                            ? 'please provide account name'
                            : null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("IFSC Code"),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontFamily: 'SFPRO regular'),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff979197), width: 1.5),
                        ),
                        hintText: 'Enter Ifsc code',
                        hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'SFPRO reqular',
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      controller: TextEditingController(
                                        text: "${IFSC_code.toString()}"),
                      validator: (val) {
                        if (val != '') {
                          setState(() {
                            IFSC_code = val!;
                          });
                        }

                        return val!.isEmpty ? 'please provide IFSC code' : null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Branch Name"),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontFamily: 'SFPRO regular'),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff979197), width: 1.5),
                        ),
                        hintText: 'Enter your branch name',
                        hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'SFPRO reqular',
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                       controller: TextEditingController(
                                        text: "${branch_name.toString()}"),
                      validator: (val) {
                        if (val != '') {
                          setState(() {
                            branch_name = val!;
                          });
                        }

                        return val!.isEmpty
                            ? 'please provide branch name'
                            : null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: width * 0.60,
                    height: height * 0.07,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formGlobalKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();

                            createAlbum();
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
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ],
                              )
                            : const Text(
                                "Save",
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
                ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.star),
            label: 'My Match',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.rss),
            label: 'Feed',
            backgroundColor: Colors.purple,
          ),
          // BottomNavigationBarItem(
          //   icon: FaIcon(FontAwesomeIcons.boxesStacked),
          //   label: 'Others',
          //   backgroundColor: Colors.pink,
          // ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: 'Profile',
            backgroundColor: Colors.pink,
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        showUnselectedLabels: true,
        iconSize: 30,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(child: DrawerWidget()),
    );
  }
}
