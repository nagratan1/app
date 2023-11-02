import 'dart:async';

// import 'package:api_new_projects/cartFile/cartDisplay.dart';
// import 'package:api_new_projects/display/api/Apifile.dart';
// import 'package:api_new_projects/pages/homepage.dart';
// import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:shop_app/api.dart';
import 'package:shop_app/home.dart';

class Itemdetails extends StatefulWidget {
    final Map<String, dynamic>? itemDetail;
  const Itemdetails({super.key, this.itemDetail});

  @override
  State<Itemdetails> createState() => _ItemdetailsState();
}

class _ItemdetailsState extends State<Itemdetails> {

  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlider();
  }

  

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }


  void _startAutoSlider() {
    const duration = Duration(seconds: 3); // Set the interval for auto-sliding
    _timer = Timer.periodic(duration, (Timer timer) {
      if (_currentPage < widget.itemDetail!.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SingleChildScrollView(

  child: Column(

  children: [

  SizedBox(height: 40,),

  Row(children: [

 IconButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage(),));
 }, icon: Icon(Icons.arrow_back)),
  CircleAvatar(

  radius: 15,

  backgroundImage: NetworkImage('https://backend.insideiim.com/wp-content/uploads/2015/08/Flipkart-logo-insideiim.png'),)

  ,SizedBox(width: 140,),

  Icon(Icons.search,

  color: Colors.black,

  ),

  SizedBox(width: 30,),

  

  Icon(Icons.shopping_cart_outlined,

  color: Colors.black,

  ),

  SizedBox(width: 40,),

  Text('Login',

  style: TextStyle(color: Colors.black),

  )

  ],),
Divider(thickness: 1,),
  SizedBox(height: 20,),

  Container(
    height: 450,
    child: PageView.builder(
     controller: _pageController,
     itemCount: itemsDetail!.length,
     itemBuilder: (context, index) {
            return 
       Container(
          height: 320,
          width: 360,
        child: Card(
     
          child: Image.network('${widget.itemDetail?['images'][0]}',
            fit: BoxFit.fill,
          ),
    
      ));
    }),
  ),

  // Text('${itemDetail?['title']}'),

  SizedBox(height: 10,),
  Text('${widget.itemDetail?['description']}',
  style: TextStyle(fontSize: 20,

  fontWeight: FontWeight.normal

  ),

  ),

  SizedBox(height: 5,),

  Align(

   alignment: Alignment.centerLeft,

  child:   Text('#Just here',

  

  style: TextStyle(fontWeight: FontWeight.bold),

  

  ),

  )

  

  ],),



),
 floatingActionButton: Stack(
        children: [
          // Positioned widget for "Add to Cart" button
          Positioned(
            top:760,
            left:190,
            child: SizedBox(
             width: 230,
             height: 90,
              child: FloatingActionButton.extended(
               backgroundColor: Colors.deepOrange,
                onPressed: () {
                  // Add to Cart button action
                },
                label: Align(
                alignment: Alignment.center,
                  child: Text('Buy now',
                  style: TextStyle(color: Colors.white),
                  ),
                ),
                icon: Icon(Icons.shopping_cart),
              ),
            ),
          ),
          // Positioned widget for "Buy Now" button
          Positioned(
            top: 760,
            left: 20,
child:  SizedBox(
 height: 90,
  width: 220,
  child:   InkWell(
    onTap: (){
    },

    child: FloatingActionButton.extended(
                      onPressed: () {
    
                    // Add to Cart button action
          // Navigator.push(context, MaterialPageRoute(
          //   builder:(context) => ShoppingDisplay()));

                  },
    
                  label: Text('Add to cart'),
    
                  icon: Icon(Icons.shopping_cart),
    
                // shape: RoundedRectangleBorder(
    
                //       borderRadius: BorderRadius.circular(25), // Set the desired border radius
    
                //     ),
    
               
    
                ),
  ),
),

    )]));
  }
}