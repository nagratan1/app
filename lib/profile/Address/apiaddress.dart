// ignore_for_file: unused_element

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
  
Future<List> getcounlyList()async{

  try{
    var response=await   http.get(Uri.parse('https://b1.bhaaraterp.com/leads/api/lead-country-list-api/'),
    headers: {
      'token':'6fba84eba684a66dfd52213a34327e14dfffb322'
    });

   print('${response.statusCode}  ${response.body}')
   ;
   var data=json.decode(response.body);
   var countrylist=data['serializer_data'];
   print('countrylist  $countrylist');
   return countrylist;


  }catch(e){
    throw Exception();


  }
}


Future<List> getStateList(country_id)async{

  try{
    var statelist=[];
    var response=await   http.get(Uri.parse('https://b1.bhaaraterp.com/leads/api/lead-state-list-api/?country_id=$country_id'),
    headers: {
      'token':'6fba84eba684a66dfd52213a34327e14dfffb322'
    });

   print('${response.statusCode}  ${response.body}')
   ;
   var data=json.decode(response.body);
    statelist=data['data'];
   print('statelist  $statelist');
   return statelist;


  }catch(e){
    throw Exception();


  }
}


Future<List> getcityList( String  state_id)async{

  try{
    var citylist=[];
    var response=await   http.get(Uri.parse('https://b1.bhaaraterp.com/leads/api/lead-city-list-api/?state_id=$state_id'),
    headers: {
      'token':'6fba84eba684a66dfd52213a34327e14dfffb322'
    });

   print('${response.statusCode}  ${response.body}')
   ;
   var data=json.decode(response.body);
    citylist=data['data'];
   print('citylist  $citylist');
   return citylist;


  }catch(e){
    throw Exception();


  }
}

Future<void>AddAddress(address_type,mobile_number,
address,street_address,pincode,email,area,city_id,
state_id,country_id)async{
  try{
var response= await   http.post(Uri.parse('https://app1.crazzyhub.com/api/add-new-address/'),

headers:{
  'token':'afceab888e69ecd14051d7ccb130ddddc6c79ea3'
},
body: {
'address_type':address_type,
'mobile_number':mobile_number,
'address':address,
'street_address':street_address,
'pincode':pincode,
'email':email,
'area':area,
'city_id':city_id,
'state_id':state_id,
'country_id':country_id,
}
);
print('${response.statusCode}  ${response.body}');

if
(response.statusCode==200){
  var data=json.decode(response.body);
  print('${data}');
  var my_address_list=data['data']['my_address_list'];
  Fluttertoast.showToast(msg: '${data['status']}');
  




}





  }
  catch(e){
     Fluttertoast.showToast(msg: '$e');
    throw Exception();

  }



}

