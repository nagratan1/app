import 'package:flutter/material.dart';

import 'apiaddress.dart';



class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  
  String person='';
  String ?gender;
  String ?city;
  String ?stete;
  String ?address;
   String ?country;
var countrylist=[];
String countryname='';
String countyId='';


var statlist=[];
String statename='';
String StateId='';

var cityList=[];
String cityname='';
String cityId='';

void getState(countyId)async{
    var data= await   getStateList(countyId);
    setState(() {

      statlist=data;
      print('mycountylist   $statlist');
      
    });
}



void  getdata()async{

  var data=await getcounlyList();
  if(data.isNotEmpty){
    setState(() {
      countrylist=data;
      print('mycountylist   $countrylist');
      
    });
  }
  




}

void getcity(StateId)async{

 var data=await getcityList(StateId);
  if(data.isNotEmpty){
    setState(() {
      cityList=data;
      print('mycitylist   $cityList');
    });
  }
}




@override 
void initState(){
  getdata();
  super.initState();
}



  @override
  Widget build(BuildContext context) {

    
    TextEditingController homeController=TextEditingController();
    TextEditingController faltController=TextEditingController();
    TextEditingController streetController=TextEditingController();
    TextEditingController areaController=TextEditingController();
   TextEditingController pinController=TextEditingController();  
  
  TextEditingController mobileController=TextEditingController();
   TextEditingController emailController=TextEditingController();
   TextEditingController countryController=TextEditingController();
   TextEditingController stateController=TextEditingController();
   TextEditingController cityController=TextEditingController();

   
 
      final  _formkey=GlobalKey<FormState>();  
    return Scaffold(
//  drawer: const HomeScreen(),
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.indigo,
        title: Text(' My Address'),
        centerTitle: true,
      
        actions: [
          Icon(Icons.shopify_rounded)

        ],
        leading:
  IconButton(onPressed: (){
//Navigator.push(context, MaterialPageRoute(builder:(context) => DrawerScreen(),));
 }, icon: Icon(Icons.arrow_back)),
      ),
      body: 
    //ListView.separated(itemBuilder: context,{
      Center(child: Padding(padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formkey,
        child:

      
       SingleChildScrollView(
        // scrollDirection: ,
         child: Column(children: [
           TextFormField(
        controller: homeController,
        decoration: InputDecoration(
              suffixIcon: DropdownButton<String>(
          value: address,     
                onChanged: (p) {
                  setState(() {
                    address = p;
                  });
                },
                items: [
 DropdownMenuItem(
  value: 'Home',
  child: Text('Home'),
  ),
DropdownMenuItem(
  value: 'Office',
  child: Text('Office'),
  ),
  DropdownMenuItem(
  value: 'Other',
  child: Text('Other'),
  )



              ],),
                  labelText: 'Choose Address',
                  hintText: 'Select the Address',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
             ),
             SizedBox(height: 20,),
             TextFormField(
         controller: faltController,
        
         //keyboardType: TextInputType.phone,
         decoration: InputDecoration(
                  labelText: 'Flat/House/No,Building,Comapny Name',
                  hintText: 'Enter theFlat/House/No,Building,Comapny Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
             ),
              SizedBox(height: 20,),
       TextFormField(
        controller: streetController,
         decoration: InputDecoration(
                  labelText: 'Street',
                  hintText: 'Enter the Street',
                  //prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
       ),
             
       SizedBox(height: 20,),
       TextFormField(
        controller: areaController,
         decoration: InputDecoration(
                  labelText: 'Area/Landamrk',
                  hintText: 'Enter the Area/Landamrk',
                  //prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
       ),
      
       SizedBox(height: 20,),
       TextFormField(
        controller: pinController,
         decoration: InputDecoration(
                  labelText: 'pin code',
                  hintText: 'Enter the pin code',
                  //prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
       ),
        SizedBox(height: 20,),
       TextFormField(
       controller: mobileController,
       validator: (value){
          if(value==null||value.isEmpty){
                      return 'phone can\'t be empty';
                    }
       else if(value.length<10){
       return 'Phone can\'t be  10 digits';
       }
       },
       keyboardType: TextInputType.phone,
         decoration: InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Enter the Phone',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
       ),
       SizedBox(height: 20,),
       TextFormField(
       controller: emailController,
       validator: (value){
         if(value!.isEmpty){
           return 'Email can\'t be Empty';
       
         }
         else if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)!=true){
           return 'Enter valid Email';
         }
       },
       
         keyboardType: TextInputType.emailAddress,
         
         decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter the Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
         
       ),
       SizedBox(height: 20,),


        Container(

          child: Row(children: [
        countryname==''?    Text('select country'):Text(countryname),
            IconButton(onPressed: (){
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text('country'),

                  content: Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    width: 100,
                    child: ListView.builder(
                      
                      itemCount: countrylist.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                       
                      return  GestureDetector(
                        onTap:(){
                          setState(() {

                            countryname=countrylist[index]['name'];

                            countyId=countrylist[index]['id'].toString();

                            getState(countyId);

                       
  
                            Navigator.pop(context);
                          });
                        } ,

                        child: ListTile(
                          leading: Icon(Icons.flag),
                          title:Text('${countrylist[index]['name']}'),
                          // trailing: ,
                          
                        ),
                      );
                    },)
                  ),
                  
                  // LayoutBuilder(zjfbzdb
                  //   builder: (context, constraints) {
                  //     return    Container(
                  //                         height: constraints.maxHeight * .7, // 70% height
                  //     width: constraints.maxWidth * .9,
                  
                  //   //  height: 600,
                  //   // width:double.infinity,
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     // scrollDirection: Axis.vertical,
                  //     itemCount: countrylist.length,
                  //     itemBuilder: (context, index) {
                  //     return  Text('${countrylist[index]['name']}');
                  //   },)
                  //                 );
                  
                  
                  //   },
                  //   // child: 
                    
                  
                  
                  
                  // ),
              
              
              
                );
              },);



            }, icon: Icon(Icons.arrow_drop_down))
          ],),
        ),
      



             SizedBox(height: 20,),

               Container(

          child: Row(children: [
        statename==''?    Text('select state'):Text(statename),
            IconButton(onPressed: (){
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text('state'),

                  content: Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    width: 100,
                    child: ListView.builder(
                      
                      itemCount: statlist.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                       
                      return  GestureDetector(
                        onTap:(){
                          setState(() {

                            statename=statlist[index]['state'];

                            StateId=statlist[index]['id'].toString();

                            getcity(StateId);

                       
  
                            Navigator.pop(context);
                          });
                        } ,

                        child: ListTile(
                          leading: Icon(Icons.flag),
                          title:Text('${statlist[index]['state']}'),
                          // trailing: ,
                          
                        ),
                      );
                    },)
                  )
                  
                  // LayoutBuilder(zjfbzdb
                  //   builder: (context, constraints) {
                  //     return    Container(
                  //                         height: constraints.maxHeight * .7, // 70% height
                  //     width: constraints.maxWidth * .9,
                  
                  //   //  height: 600,
                  //   // width:double.infinity,
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     // scrollDirection: Axis.vertical,
                  //     itemCount: countrylist.length,
                  //     itemBuilder: (context, index) {
                  //     return  Text('${countrylist[index]['name']}');
                  //   },)
                  //                 );
                  
                  
                  //   },
                  //   // child: 
                    
                  
                  
                  
                  // ),
              
              
              
                );
              },);



            }, icon: Icon(Icons.arrow_drop_down))
          ],),
        ),
        SizedBox(height: 20,),

               Container(

          child: Row(
            
            children: [
            
        cityname==''?    Text('select city'):Text(cityname),
            IconButton(onPressed: (){
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text('city'),

                  content: Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    width: 100,
                    child: ListView.builder(
                      
                      itemCount: cityList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                       
                      return  GestureDetector(
                        onTap:(){
                          setState(() {

                            cityname=cityList[index]['city'];

                            cityId=cityList[index]['id'].toString();

                            getcity(StateId);

                       
  
                            Navigator.pop(context);
                          });
                        } ,

                        child: ListTile(
                          leading: Icon(Icons.flag),
                          title:Text('${cityList[index]['city']}'),
                          // trailing: ,
                          
                        ),
                      );
                    },)
                  )
                  
                  // LayoutBuilder(zjfbzdb
                  //   builder: (context, constraints) {
                  //     return    Container(
                  //                         height: constraints.maxHeight * .7, // 70% height
                  //     width: constraints.maxWidth * .9,
                  
                  //   //  height: 600,
                  //   // width:double.infinity,
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     // scrollDirection: Axis.vertical,
                  //     itemCount: countrylist.length,
                  //     itemBuilder: (context, index) {
                  //     return  Text('${countrylist[index]['name']}');
                  //   },)
                  //                 );
                  
                  
                  //   },
                  //   // child: 
                    
                  
                  
                  
                  // ),
              
              
              
                );
              },);



            }, icon: Icon(Icons.arrow_drop_down))
          ],),
        ),
      


      

      
      
      





       SizedBox(height: 20,),
       ElevatedButton(

        onPressed:()async{


         await   AddAddress(
              homeController.text,faltController.text,streetController.text,areaController.text,pinController.text,
          mobileController.text,emailController.text, countyId,StateId,cityId);

        

       
       
                  
       },
       child: Text('submit ',)),
             ],),
       )
       ),
      ),
      ),
    );
  }
}

