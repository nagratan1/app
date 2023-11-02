
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shop_app/profile/Otp_login.dart';


class login_number extends StatefulWidget {
  const login_number({super.key});

  @override
  State<login_number> createState() => _login_numberState();
}

class _login_numberState extends State<login_number> {
   TextEditingController  otpcontroller  = TextEditingController();
  
String? otp;

Future<String> Otpmessage() async{
try{
  var response=await http.post(Uri.parse('https://app1.crazzyhub.com/api/login/'),
  body: {
   'mobile_number':'7236818570'
  },
  );
var result = json.decode(response.body);
print(response.body);
String otp = result['message'];
otpcontroller.text = otp;
return otp;

}catch(error){
  print(error)
;
rethrow;
}
}
  

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       
      body: SingleChildScrollView(
      //crossAxisAlignment: CrossAxisAlignment.start,
      
      child: 
      Column(
          children: [
            
      
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xffFFEFE5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),

              
              ),
             child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 60),
                //child: Text('CRAZZY HUB',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.black),),
               
               child: Text.rich(
            TextSpan(
              text: 'CRAZZY',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
              children: <InlineSpan>[
                TextSpan(
                  text: 'HUB',
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red),
                )
              ]
            )
          ),
                )
              ],
             ),
          
            ),
            
            SizedBox(height: 30,),
            Padding(padding: EdgeInsets.only(right: 150),
            child:
            Text("Welcome Back",
             style: TextStyle(fontSize: 25,
             fontWeight: FontWeight.bold,
             ),
          ),
            ),
         
                 
            SizedBox(height: 30,),
            Padding(padding: EdgeInsets.only(left: 40),
                child:
                Row(
                  children: [
                    Text(("Sign to complete your shoping"),
                     
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
            ),   
                SizedBox(height: 50,),
                
                 Padding(padding: EdgeInsets.only(left: 20,right: 20),
                    child: TextFormField(
                       controller:otpcontroller,
           
            
             keyboardType: TextInputType.phone,
             decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      hintText: 'Enter the Mobile Number',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                 ),
                 ),
                
      
                
              SizedBox(height: 50,),
              Padding(padding: EdgeInsets.only(),
            
              
               child:Column(children: [
                 Text("by siging in you are conforming that you have accecpted",
              style: TextStyle(fontSize: 15,
              fontWeight: FontWeight.normal,),
              
              ),
               ],
              ),
              ),
              SizedBox(height: 20,),
          Padding(padding: EdgeInsets.only(right: 90),
          child: Column(children: [
            Text("our terms of use and Privacy & Poliocy",
            style: TextStyle(fontSize: 15,
            fontWeight: FontWeight.normal),),
          ],),),
              
              SizedBox(height: 20,),
           Padding(padding: EdgeInsets.only(),
           child: Container(
            //width: MediaQuery.of(context).size.width/.1,
            child: 
              Divider(
                color: Colors.black,
                indent: 20,
                thickness: .5,
              ),
            
           ),
           ),
           SizedBox(height: 20,),
           Padding(padding: EdgeInsets.only(left: 30),
           child: Column(
            children: [
               Row(
            children: [
              InkWell(
                onTap: (){
                  Otpmessage();
                Navigator.push(context, MaterialPageRoute(builder:(context) => login_otp(),));
                },
                child: Container(
                  height: 60,
                  width: 550,
                 
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: Color(0xffFE7C28),),
                  
                  child:
                   Align(
                    alignment: Alignment.center,
                    child: 
                   
                   
                   Text('Continue',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),)),
                ),
              ),
            ],
           ),

            ],
           ),
           ),
          ],
        ),
      
            ),
      
      
      
     );
  }
}