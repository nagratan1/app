import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shop_app/Itemdetails%20.dart';
import 'package:shop_app/api.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


 String  username  = '';
 String passowrd = '';
 String searchQuery = '';

void retriveLoginData()async{
//Map<String, dynamic> loginData = await SaveLoginData.getLoginData();
setState(() {
  // username = loginData['username'];
  // passowrd = loginData['password'];
});
}

//Search logic
TextEditingController _controller = TextEditingController();
  

  Future<List<dynamic>> performSearchItems(String search) async{
    List<dynamic> searchResult = [];

try{
var response = await http.get(Uri.parse('https://dummyjson.com/products/search?q=$search')
);
var result  = json.decode(response.body);
print(response.body);
  List< dynamic> newsearchResult = result['products'] ?? [];
   setState(() {
      searchResult = newsearchResult;
    });

print('tasmiya  ${searchResult} ${newsearchResult}');

return searchResult;

}catch(error){
  print(error);
rethrow;
}
}

var produtlist=[];
void searchItems(String search)async{
var  data =  await performSearchItems(search);
setState(() {
  produtlist = data;
});

}

// final _controller = PageController();
 final PageController _pageController = PageController();
  int _currentPage = 0;

 
 
  List<String>cardList  = [
'https://i.pinimg.com/564x/4f/0b/a8/4f0ba824c5610577cc0918d36c755c51.jpg',


'https://i.pinimg.com/736x/0b/96/c9/0b96c91294907711bc7f6bbcff39867b.jpg',

'https://i.pinimg.com/564x/4b/37/20/4b3720d7d6fa67259042708761c4c0c7.jpg',

 ];

  List<String> categoriesUrl  = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkZ1Yftf-xXWxb9yCePOFUZ4cfyExgh59pWQ&usqp=CAU',
   'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80',
  'https://images.unsplash.com/photo-1598121443852-ff347aff7520?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80'
 'https://images.unsplash.com/photo-1594051843837-46cdc08d0d9f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
  'https://www.forestessentialsindia.com/blog/wp-content/uploads/2021/12/1-1.jpg',
    'https://plus.unsplash.com/premium_photo-1664302476835-aed0d7d5c454?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1516455590571-18256e5bb9ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
'https://images.unsplash.com/photo-1618220179428-22790b461013?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=327&q=80',
'https://images.unsplash.com/photo-1535043934128-cf0b28d52f95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
  'https://www.rehmatboutique.com/wp-content/uploads/2022/08/500_500_productGfx_139433.jpg',
     'https://assets.myntassets.com/fl_progressive/h_960,q_80,w_720/v1/assets/images/1364628/2016/8/31/11472636737718-Roadster-Men-Blue-Regular-Fit-Printed-Casual-Shirt-6121472636737160-1.jpg',
 
  'https://media.istockphoto.com/id/172417586/photo/elegant-black-leather-shoes.jpg?s=612x612&w=0&k=20&c=c_tTljwbu2m0AGxwb27NxCgG0Y2Cv-C4v8q6V36RYbw=',
  'https://5.imimg.com/data5/ANDROID/Default/2022/2/YY/AY/VF/35336981/product-jpeg-500x500.jpg',
  
  'https://5.imimg.com/data5/ANDROID/Default/2022/7/ZK/PI/QH/29603120/product-jpeg-500x500.jpg',
  
  
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-DSCig7AEr-uHrQJiSFDN4jrt-mXoL2R74g&usqp=CAU',
  
  ];
  
  
  void _startAutoSlide() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage <cardList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }
 
 
 @override
 void initState(){
  super.initState();
 _startAutoSlide();
 retriveLoginData();
 setlist();
 setlists();
 searchItems(_controller.text);
 }

@override
void dispose(){
  super.dispose();
}
late List product_list;
 //final String url="https://app1.crazzyhub.com/api/my-address-list/";
// late List data;

// @override
// void initState(){
//   setlist();
//   super.initState();
  

// }

void setlist()async{

var data=  await getproductapi();

if(data!=null){

  setState(() {
    product_list=data;
    print('product_list   ${product_list }');
    
  });
}
}
late List salider;
 //final String url="https://app1.crazzyhub.com/api/my-address-list/";
// late List data;

// @override
// void initState(){
//   setlist();
//   super.initState();
  

// }

void setlists()async{

var data=  await getproductapis();

if(data!=null){

  setState(() {
    salider=data;
    print('salider   ${salider}');
    
  });
}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  
SafeArea(
  child:   SingleChildScrollView(
    child: Column(
          children: [
      SizedBox(height: 0,),

Container(
  height: 140,
  color: Color(0xffFFCEB0),
  
   child: Column(
     children: [
      Padding(padding: EdgeInsets.only(top:20,right: 190),
        
        child: Text.rich(
            TextSpan(
              text: 'CRAZZY',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              children: <InlineSpan>[
                TextSpan(
                  text: 'HUB',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),
                )
              ]
            )
          ),
      ),
  
  
  

    SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.only(left: 10,
        right: 10,
      
        ),
        child: Container(
         height: 50,
          child: TextField(
          controller: _controller,
           onChanged: (search)async {
            //  setState(() {
            //    searchQuery = search;
            //  });
             print(search);
              searchItems(_controller.text);


           },
            decoration: InputDecoration(
          
hintText: 'Search for Product, Brands and More',         
          prefixIcon: Icon(Icons.search,
          
          color: Colors.grey,
          
          ),
          
             hintStyle: TextStyle(fontSize: 13),
          
          fillColor:  Colors.white,
          
          filled: true,
          
          border: OutlineInputBorder(
          
            borderRadius: BorderRadius.circular(5),
          
           borderSide: BorderSide.none
          
           
          
            ),
          
           
          
            ),
          
            ),
        ),
      ),
     
     
     ],
   ),
 ),


           SizedBox(height: 20,)
,           
            FutureBuilder(
    
        
    
          future: Mycategories(),
    
        
    
          builder: (context, snapshot) {
    
        
    
            if (snapshot.connectionState == ConnectionState.waiting) {
             return CircularProgressIndicator();
            } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
            } else {
        
              if
              (snapshot.connectionState==ConnectionState.done){
                 return Container(
                  height: MediaQuery.of(context).size.width*0.2,
                   child: ListView.builder(
                         shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                     itemCount: snapshot.data?.length,
                     itemBuilder: (context, index) {
                       return Column(
                             children: [
                               CircleAvatar(
                              
                                backgroundImage: 
                                NetworkImage(
                                  categoriesUrl[index]
                                  //'https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvcHBpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
                                  
                                  ),
                                 
                                     
                                 
                                                        ),
              
                           Container(
                             alignment: Alignment.center,
                                 margin: EdgeInsets.all(5),
                            //  color: Colors.blueGrey, // You can customize the appearance of the container
                                 child: Text(
                               '${snapshot.data?[index]}', // Display the product name as text
                               textAlign: TextAlign.center,
                               style: TextStyle(
    
        
    
                                 color: Colors.black, // You can customize the text color
    
        
    
                                 fontSize: 12, // You can customize the font size
    
        
    
                                 fontWeight: FontWeight.normal, // You can customize the font weight
    
        
    
                               ),
    
        
    
                             ),
    
        
    
                           ),
    
        
    
                         ],
    
        
    
                       );
    
        
    
                     },
    
        
    
                   ),
    
        
    
                 );
              }
              else{
                return  Text('Sorry');
              }
                                        // final categories = snapshot.data;
       
    
            }
   
          },
        ),
    
     Container(
     height: 260,
     child: PageView.builder(
     physics: NeverScrollableScrollPhysics(),
  reverse: true,
   scrollDirection: Axis.horizontal       ,
             controller: _pageController,
             itemCount: cardList.length,
             itemBuilder: (context, index) {
               return Container(
          height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
               onTap: (){
             
               
               },
                child: Card(
                  shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: Container(
                   height: 300,
                    width: 400,
                    child: ClipRRect(
                     borderRadius: BorderRadius.circular(5),
                      child: Image.network(cardList[index],
                       fit: BoxFit.fitWidth ,
                        // child: Image.network('${product_list[index]['image']}',
                        // fit: BoxFit.fill,
        //),
                      ),
                    ),
                    )),
              ),
            ),
          );}
     
            ),
   ),
  //  SmoothPageIndicator(controller: _pageController, count: 3,
  //  axisDirection: Axis.horizontal,
 
//),
  
     SizedBox(height: 20,), 
     Padding(padding: 
            EdgeInsets.symmetric(horizontal: 15, ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mobiles & Tablets",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
                Text("See All",
                 
                selectionColor:Colors.black54)
                
              ],
            ),
            ),


      SizedBox(height: 20,),
            produtlist.isEmpty?CircularProgressIndicator():
           Container(
            height: 290,
          
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context,index) =>InkWell(
        onTap: 
         ()async{
  // String itemId = product_list[index]['id'].toString() ;  
  //     Map<String, dynamic>?  itemDetail = await  fetchItemsdetails(itemId);
  //   print('itemsDetail: $itemsDetail'); // Add 0 line to check the value of itemsDetail
  Navigator.push(
     context,
   MaterialPageRoute(
    builder: (context) => Itemdetails(
      itemDetail: itemsDetail!,
     ),
  )
     );
       
        }, 
          //Padding(padding:const EdgeInsets.all(5.0),
          
          child: Column(
            children: [
              Container(
                 margin: EdgeInsets.all(1),
                height: 270,
                width: 180,
                
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  spreadRadius: 2,
                )
              ]
            ),
              child: Padding(padding:EdgeInsets.all(12),
              child: Column(
              children: [
                 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                      
                          Text("30% off",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 12,
                  ),),
                 Icon(Icons.favorite, color:Colors.redAccent,),
                    
                  ],
        
            
                ),
                 SizedBox(height: 10,),
            Padding(padding: EdgeInsets.all(1),
            
            child: Image.network('${product_list[index]['image']}',height: 140,width: 140,
             fit: BoxFit.fill,
        ),
        ),
         SizedBox(height:10
        ),
         Padding(padding: EdgeInsets.all(10),
         child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            
            Text('${product_list[index]['variant_name']}..',style: TextStyle(
              
              fontSize: 11,
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.bold,
            ),)
          ],
         ),
        ),
              ],
             
        
                ),
               
         
                 ),),
          
            ],
          ),
          ),  
         
           //),
         itemCount:product_list.length,
           scrollDirection: Axis.horizontal,
        
          ),
          ),
          SizedBox(height: 10,),
 Padding(padding: 
            EdgeInsets.symmetric(horizontal: 15, ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mobiles & Tablets",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
                Text("See All",
                 
                selectionColor:Colors.black54)
                
              ],
            ),
            ),


      SizedBox(height: 20,),
            produtlist.isEmpty?CircularProgressIndicator():
           Container(
            height: 290,
          
          child: ListView.builder(
            shrinkWrap: true,
          
            itemBuilder: (context,index) =>InkWell(
        onTap: 
         ()async{
  String itemId = produtlist[index]['id'].toString() ;  
      Map<String, dynamic>?  itemDetail = await  fetchItemsdetails(itemId);
    print('itemsDetail: $itemsDetail'); // Add 0 line to check the value of itemsDetail
  Navigator.push(
     context,
   MaterialPageRoute(
    builder: (context) => Itemdetails(
      itemDetail: itemsDetail!,
     ),
  )
     );
       
        }, 
          //Padding(padding:const EdgeInsets.all(5.0),
          
          child: Column(
            children: [
              Container(
                 margin: EdgeInsets.all(2),
                height: 270,
                width: 180,
                
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  spreadRadius: 2,
                )
              ]
            ),
              child: Padding(padding:EdgeInsets.all(12),
              child: Column(
              children: [
                 
                Row(
                  
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                      
                          Text("30% off",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 12,
                  ),),
                 Icon(Icons.favorite, color:Colors.redAccent,),
                    
                  ],
        
            
                ),
                 SizedBox(height: 10,),
            Padding(padding: EdgeInsets.all(1),
            
            child: Image.network('${produtlist[index]['thumbnail']}',height: 140,width: 140,
             //fit: BoxFit.fill,
        ),
        ),
         SizedBox(height:10
        ),
         Padding(padding: EdgeInsets.all(10),
         child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            
            Text('${produtlist[index]['title']}..',style: TextStyle(
              
              fontSize: 11,
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.bold,
            ),)
          ],
         ),
        ),
              ],
             
        
                ),
               
         
                 ),),
          
            ],
          ),
          ),  
         
           //),
           itemCount:produtlist.length,
           scrollDirection: Axis.horizontal,
        
          ),
          ),

      ]),
    
    ),
  ),






 

  );
  }
}