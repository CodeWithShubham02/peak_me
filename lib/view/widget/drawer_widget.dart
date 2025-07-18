import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project2/view/received_lead_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_constant.dart';
import '../auth/login.dart';

class AdminDrawerWidget extends StatefulWidget {
  const AdminDrawerWidget({super.key});

  @override
  State<AdminDrawerWidget> createState() => _AdminDrawerWidgetState();
}

class _AdminDrawerWidgetState extends State<AdminDrawerWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: Get.height/8.5),
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0))
        ),
        child: Wrap(
          runSpacing: 1,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Shubham Gupta"),
                leading: CircleAvatar(
                  child: Text("S",style: TextStyle(color: Colors.white),),
                ),

              ),
            ),
            Divider(
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.5,
              color: AppConstant.appTextColor,
            ),
          ListTile(
                onTap: (){
                  Get.to(()=>ReceivedLeadScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Received Lead"),
                leading: Icon(Icons.dashboard),

              ),

             ListTile(
                onTap: (){
                 // Get.to(()=>LeadScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Self Lead Alloter"),
                leading: Icon(Icons.home),

              ),

             ListTile(
                onTap: (){
                  //Get.to(()=>AllUsersScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Received Lead"),
                leading: Icon(Icons.person),

              ),
            ListTile(
              onTap: (){
                //Get.to(()=>AllUsersScreen());
              },
              titleAlignment: ListTileTitleAlignment.center,
              title: Text("Received Lead"),
              leading: Icon(Icons.person),
            ),
            ListTile(
              onTap: (){
                //Get.to(()=>AllUsersScreen());
              },
              titleAlignment: ListTileTitleAlignment.center,
              title: Text("Received Lead"),
              leading: Icon(Icons.person),

            ),
            ListTile(
              onTap: (){
                //Get.to(()=>AllUsersScreen());
              },
              titleAlignment: ListTileTitleAlignment.center,
              title: Text("Received Lead"),
              leading: Icon(Icons.person),

            ),
            ListTile(
              onTap: (){
                //Get.to(()=>AllUsersScreen());
              },
              titleAlignment: ListTileTitleAlignment.center,
              title: Text("Received Lead"),
              leading: Icon(Icons.person),

            ),
            ListTile(
              onTap: (){
                //Get.to(()=>AllUsersScreen());
              },
              titleAlignment: ListTileTitleAlignment.center,
              title: Text("Received Lead"),
              leading: Icon(Icons.person),

            ),
            ListTile(
              onTap: ()async {



              },
              titleAlignment: ListTileTitleAlignment.center,
              title: Text("Logout"),
              leading: Icon(Icons.person),

            ),

          ],
        ),
        backgroundColor:Colors.white,
        width: 275,

      ),
    );
  }
}