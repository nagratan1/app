import 'dart:convert';

//import 'package:api_new_projects/cartFile/cartDetailspage.dart';
import 'package:http/http.dart' as http;

 
Map<String, dynamic>? itemsDetail ;

Future<Map<String,dynamic>> fetchItemsdetails(String itemId)async{
  try{
final response = await http.get(
  Uri.parse('https://dummyjson.com/products/$itemId'),
);
final data  = json.decode(response.body) ;
print(response.body);
itemsDetail = data;
  }catch(error){
    print(error);
  }
return  itemsDetail!;
}

Map<String, dynamic> ?cart ;
Future<Map<String, dynamic>> Mycart()async{
  try{
final response = await http.post(Uri.parse('https://dummyjson.com/carts/add'),
body: {
'userId':1,
'products':[
  {
    'id':1,
    'quantity':1,

  },
{
  'id':50,
  'quantity':2,
}

]

}
);
var result  = json.decode(response.body) as Map<String, dynamic>;
print(response.body);
print('tashu $result');
  cart = result;
  print('ashu $cart');
  return cart!;
  }catch(error){
    print(error);
  rethrow;
  }
}

Map<String, dynamic> ?cartDetails;
 Future<Map<String,dynamic>>getcarttails(String cartId)async{
  try{
final response = await http.get(
  Uri.parse('https://dummyjson.com/products/1'),
);
final  cartResult = json.decode(response.body) ;
print(response.body);
cartDetails = cartResult;
return cartDetails!;
  }catch(error){
    print(error);
 rethrow;
  }

}


 
 List<dynamic> categories = [];
Future<List<dynamic>> Mycategories()async{
  var response = await http.get(Uri.parse('https://dummyjson.com/products/categories'),
  );
 var result = json.decode(response.body);
print(response.body
);

print('@@@@@@    result  $result');


categories = result;
print('@@@@@@     $categories');

return categories;
  // 
  
 

}






Future<List<dynamic>> fetchItems()async{
  var itemList=[];

  try{
final response = await http.get(
  Uri.parse('https://dummyjson.com/products'),
);
final data  = json.decode(response.body) ;
print(response.body);

final items = data['products'];
  itemList = items;
print('###  itemList    ${itemList}');
return  itemList;

  }catch(error){

    print(error);
    throw Exception();
  }

}

// Map<String, dynamic>? addItems ;




Future<List<dynamic>> addTocart()async{
  var itemList=[];

  try{
final response = await http.post(
  Uri.parse('https://dummyjson.com/carts/add'),
  body: json.encode(
    {
      'user'
    }

  )
);



final data  = json.decode(response.body) ;
print(response.body);

final items = data['products'];



  itemList = items;

print('###  itemList    ${itemList}');
return  itemList;

  }catch(error){

    print(error);
    throw Exception();
  }

}
List<Map<String, dynamic>> ?Allcarts ;
Future<List<dynamic>> getAllcarts()async{
  try{
final response = await http.get(
  Uri.parse('https://dummyjson.com/carts'),
   );


final  cartdata = json.decode(response.body) ;
print(response.body);
final  Allcarts = cartdata['carts'][0]['products'];

print('Hello tashu ${Allcarts}');

return  Allcarts ;

  }catch(error){

    print(error);
    throw Exception();
  }

}


Map<String, dynamic>? singlecart;
Future<Map<String,dynamic>>getcartDetails()async{
  try{
final response = await http.get(
  Uri.parse('https://dummyjson.com/carts/1'),
);
final  cartDetailsResult = json.decode(response.body) ;
print(response.body);
singlecart = cartDetailsResult['products'];
return singlecart!;
  }catch(error){
    print(error);
 rethrow;
  }

}






Future<List>getprofileapi()async{
  try{
final response = await http.get(
  Uri.parse('https://app1.crazzyhub.com/api/my-profile/'),
  headers: {
    'Token':'afceab888e69ecd14051d7ccb130ddddc6c79ea3'
  }
);
final  data = json.decode(response.body) ;
print(response.body);

var profilelist=[];
profilelist=data['data']['profile_data'];
print('mylist   ${profilelist}');
return profilelist;


  }catch(error){
    print(error);
 throw Exception();
  }

}
Future<List>getproductapi()async{
  try{
final response = await http.get(
  Uri.parse('https://app1.crazzyhub.com/api/product-list/'),
  headers: {
    'Token':'afceab888e69ecd14051d7ccb130ddddc6c79ea3'
  }
);
final  data = json.decode(response.body) ;
print(response.body);

var profilelist=[];
profilelist=data['data']['product_list'];
print('mylist   ${profilelist}');
return profilelist;


  }catch(error){
    print(error);
 throw Exception();
  }

}
Future<List>getproductapis()async{
  try{
final response = await http.get(
  Uri.parse('https://app1.crazzyhub.com/api/banner-list/'),
  headers: {
    'Token':'0bb9d54d7a7b5716b97e8702e990586cc2e61bee'
  }
);
final  data = json.decode(response.body) ;
print(response.body);

var profilelist=[];
profilelist=data['data']['banner_all_data'];
print('mylist   ${profilelist}');
return profilelist;


  }catch(error){
    print(error);
 throw Exception();
  }

}