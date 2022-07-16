import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'Setting_edit.dart';
import 'package:file_picker/file_picker.dart';
class Change_bank_account extends StatefulWidget {
  
  const Change_bank_account({Key? key, }) : super(key: key);
  
  @override
  
   

  
  State<Change_bank_account> createState() => _Change_bank_account();
}

class _Change_bank_account extends State<Change_bank_account> {
   int counter = 2;
   String _title =  "Bank Details";
    final storage = new LocalStorage('my_data');
    String useremail = "test@gmail.com";
    String gender = "Male";
     @override
  void initState() {
    setState(() {
        // useremail  = storage.getItem('Usermail');
        // gender  = storage.getItem('usergender');
    });
  }
  String dropdownvalue = 'Item 1';
    var items = [   
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
   Widget build(BuildContext context) {
   
    double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    String strDigits(int n) => n.toString().padLeft(2, '0');
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
       appBar: PreferredSize(
            preferredSize:  Size.fromHeight(height * 0.10),
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
              title: Container(
                margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(_title,style: TextStyle(
                          fontSize: 20,
                        ),
                    ),
                    
                  ],
                ),
              ),
              actions: <Widget>[
          // Using Stack to show Notification Badge
           Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Container(
                 margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                 child: Stack(
                  children: <Widget>[
                     IconButton(icon: Icon(Icons.notifications,size: 30,), onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    }),
                     Positioned(
                      right: 11,
                      top: 11,
                      child:  Container(
                        padding: const EdgeInsets.all(2),
                        decoration:  BoxDecoration(
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
             ],
           ),
        ],
              centerTitle: true,
              toolbarHeight:100,
              backgroundColor: const Color(0xff1042aa), 
            ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width : width,
          margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.center,
            children : [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Got Verified",
                        style: TextStyle( 
                            fontSize: 20,
                            fontFamily: "SFPRO reqular"
                        ),
                      ),
                    ],
                  ),
                ), 
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College",
                    style: TextStyle( 
                        fontSize: 16,
                        fontFamily: "SFPRO reqular"
                    ),
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
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Document Verified",
                        style: TextStyle( 
                            fontSize: 20,
                            fontFamily: "SFPRO reqular"
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Icon(
                           Icons.check,
                           color: Colors.white
                           
                        ),
                      )
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
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Bank Account Details",
                        style: TextStyle( 
                            fontSize: 20,
                            fontFamily: "SFPRO reqular"
                        ),
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
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: width * 0.30,
                    height: height * 0.07,
                    child: ElevatedButton(
                      onPressed: (){
                        
                      }, 
                      child: const Text("Save",style: TextStyle(
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
                  
            ]
          ),
        ),
      ),
      drawer: Drawer(  
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
          color: Color(0xff1042aa),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.money,color: Colors.white,),
                    Text(' My Balance',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.share_rounded,color: Colors.white,),
                    Text(' Refer & Earn',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.grade_outlined,color: Colors.white,),
                    Text(' My Level',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.gps_fixed,color: Colors.white,),
                    Text(' Find my Friends',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              InkWell(
                onTap: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>  const Settings()),
                    // );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child : 
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const[
                      
                      Icon(Icons.settings,color: Colors.white,),
                      Text(' My Settings',style: TextStyle(
                        color: Colors.white,
                          fontSize: 18,
                          fontFamily: "SFPRO regular",
                        ),
                      ),
                    ],
                  )
                ),
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.help_center,color: Colors.white,),
                    Text(' Help Desk',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.account_box_outlined,color: Colors.white,),
                    Text(' About App',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.money_outlined,color: Colors.white,),
                    Text(' Terms & condition',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child : 
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const[
                    
                    Icon(Icons.logout_outlined,color: Colors.white,),
                    Text(' Logout',style: TextStyle(
                      color: Colors.white,
                        fontSize: 18,
                        fontFamily: "SFPRO regular",
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Divider(
                  
                  color: Colors.grey
                ),
              ),
            ]
          ),
        ),
      ), 
    );
   }
}