import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List>getprofileap()async{
  try{
final response = await http.get(
  Uri.parse('https://app1.crazzyhub.com/api/product-list/'),
  headers: {
    'Token':'afceab888e69ecd14051d7ccb130ddddc6c79ea3'
  }
);
final  data = json.decode(response.body) ;
print(response.body);

var product_list=[];
product_list=data['data']['product_list'];
print('mylist   ${product_list}');
return product_list;


  }catch(error){
    print(error);
 throw Exception();
  }

}