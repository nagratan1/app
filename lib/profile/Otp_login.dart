
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:pinput/pinput.dart';
import 'package:shop_app/profile/profile.dart';


class login_otp extends StatefulWidget {
  const login_otp({super.key});

  @override
  State<login_otp> createState() => login_otpState();
}

class login_otpState extends State<login_otp> {
  
  String ? otpData;
Future<String> Yourotp() async{
  try{
    var response=await http.post(Uri.parse('https://app1.crazzyhub.com/api/verify-login-otp/'),
    headers: {
      'Authorization':'7c2b8693d001c79d4b5ed6ebc387ad6b862989dfjhjjhj'
    },
    body: {
      'mobile_number':'7236818570',
      'mobile_otp':'72647'
    }
    
    );
    var result = json.decode(response.body);
    print(response.body);
    otpData=result['message'];
    return otpData!;

  }
  catch(error){
    print(error);
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
              )
              
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
            Padding(padding: EdgeInsets.only(right: 10),
            child:
            Text("Sign in to complete your shopping",
             style: TextStyle(fontSize: 25,
             fontWeight: FontWeight.bold,
             ),
          ),
            ),
         
                 
              
                SizedBox(height: 50,),
                
                 
                      Pinput(
        
               length: 6,
      
          showCursor: true,
          onCompleted: (otp){
            print('otpData :$otpData');
          },
         
       ),
            // 
            // TextFormField(
           
            
            //  keyboardType: TextInputType.phone,
            //  decoration: InputDecoration(
            //           labelText: 'Enter OTP',
            //           hintText: 'Enter the OTP',
            //           // prefixIcon: Icon(Icons.person),
            //           // border: OutlineInputBorder(),
            //         ),
            //      ),
                 //),
                
      SizedBox(height: 20,),
           Padding(padding: EdgeInsets.only(left: 370),
           
           
           child:
           
          ElevatedButton(onPressed: (){},
          
           child: Text("rese"),
           ),
           ),
          
                
              SizedBox(height: 30,),
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
          Padding(padding: EdgeInsets.only(right:100),
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
            Padding(padding: EdgeInsets.only(left: 30),
           child: Column(
            children: [
               Row(
            children: [
              InkWell(
                onTap: (){
                  Yourotp();
               
                Navigator.push(context, MaterialPageRoute(builder:(context) => DrawerScreen(),));
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