import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (BuildContext context, int index){
        return Container(
          child: Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
       
         decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter the Name',
                  //prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
       ),
              ],
            ),
          ),
        );
      }
      )
     );
  }
}