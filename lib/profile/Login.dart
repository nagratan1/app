
import 'package:flutter/material.dart';
import 'package:shop_app/profile/mobile_number_login.dart';



class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     //backgroundColor: Color(0xFFD4ECF7),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffFBEDE3),
        child:Center(
        child:Container(
          width: 300,
            height: 220,
            // color: Colors.blueGrey,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              
            ),
            padding: EdgeInsets.all(35),
           
          child: Column(
            children: [
            
             Text("You Need to Login First",
           style: TextStyle(fontSize: 20,
           fontWeight: FontWeight.bold,
           
           color: Colors.black),
           
           ),
           Padding(padding: EdgeInsets.only(top: 40,left: 30),
           child: Column(
            children: [
               Row(
            children: [
              InkWell(
                onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) => login_number(),));
                },
                child: Container(
                  height: 60,
                  width: 150,
                 
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: Color(0xffFE7C28),),
                  
                  child:
                   Align(
                    alignment: Alignment.center,
                    child: 
                   
                   
                   Text('Login >>>',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),)),
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
       
       
      ),
    
      ),
      
    );
  }

  
}