
import 'package:flutter/material.dart';
import 'package:shop_app/api.dart';
import 'package:shop_app/profile/Address/Add_Address_Form.dart';



class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
 

late List profile_data;
 //final String url="https://app1.crazzyhub.com/api/my-address-list/";
// late List data;

@override
void initState(){
  setlist();
  super.initState();
  

}

void setlist()async{

var data=  await getprofileapi();

if(data!=null){

  setState(() {
    profile_data=data;
    print('profile_data   ${profile_data }');
    print('first_name  ${profile_data[0]['first_name']}   ${profile_data[0]['email']}');
  });
}
}





//  Future<String> getJsonData()async{
//      var data=[];
   
   
//   var response =await  http.get(Uri.parse('https://app1.crazzyhub.com/api/my-profile/'),
  
   
//     headers:{
//       'token':'afceab888e69ecd14051d7ccb130ddddc6c79ea3'
//     }
//   );
//   print(response.body);  

//   setState(() {
//     var convertDataToJson = json.decode(response.body);
//   // print('${data}');
//   //     data=data['data']['profile_data'];
//       //print('productluists   ${profile_data}');

//     data = convertDataToJson['data']['profile_data'];
    
//   });
//  return  "profile_data";
// }



   final List drawerMenuListname = const [
    {
      "leading": Icon(
        Icons.location_on_outlined,
        color: Colors.black,
      ),
      "title": "My Address",
      "trailing": Icon(
        Icons.chevron_right,color: Colors.black,
      ),
      "action_id": 1,
    },
    {
      "leading": Icon(
        Icons.edit_calendar_outlined,
      color: Colors.black,
      ),
      "title": "Edit Profile",
      "trailing": Icon(Icons.chevron_right,color: Colors.black,),
      "action_id": 2,
    },
    {
      "leading": Icon(
        Icons.compass_calibration_sharp,
        color: Colors.black,
      
      ),
      "title": "My Coupons",
      "trailing": Icon(Icons.chevron_right,color: Colors.black,),
      "action_id": 3,
    },
    {
      "leading": Icon(
        Icons.history,
        color: Colors.black,
      ),
      "title": "Order History",
      "trailing": Icon(Icons.chevron_right,color: Colors.black,),
      "action_id": 4,
    },
    {
      "leading": Icon(
        Icons.exit_to_app,
       color: Colors.black,
      ),
      "title": "Log Out",
      "trailing": Icon(Icons.chevron_right,color: Colors.black,),
      "action_id": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: SafeArea(
      
      child: SizedBox(
        width: 900,
        child: Drawer(
          child: ListView(
            
            children: [
           

               ListTile(
                onTap: (){
                  setlist();
                },
                leading: CircleAvatar(
                   child: Image.network('${profile_data[0]['profile_picture']}',height: 40,width: 40,
                   fit: BoxFit.fill,
        ),
                ),
                title: Text(
                  "   ${profile_data[0]['first_name']}",
                  
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              subtitle: Text(' ${profile_data[0]['email']}'),
                
              ),
              const SizedBox(
                height: 30,
              ),
              ...drawerMenuListname.map((sideMenuData) {
                return ListTile(
                  leading: sideMenuData['leading'],
                  title: Text(
                    sideMenuData['title'],
                  ),
                  trailing: sideMenuData['trailing'],
                  onTap: () {
                    Navigator.pop(context);
                    if (sideMenuData['action_id'] == 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => form(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 4) {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const SettingScreen(),
                      //   ),
                      // );
                    }
                    
                  },
                );
              }).toList(),
            ],
      
          ),
        ),
      ),
    )
     );
     
  }
}
//}

 

