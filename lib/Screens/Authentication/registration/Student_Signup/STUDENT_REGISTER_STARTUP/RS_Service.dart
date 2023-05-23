/*




import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../AppLayer/BaseUrl.dart';
import '../../../../AppLayer/Streaming/Overseer.dart';
import '../../../../AppLayer/Streaming/appColors.dart';
import '../student_registration.dart';
import 'RSModel.dart';


class RS_Service{

  Future<bool> AddInstitute( instituteid
      ) async {

    final prefs = await SharedPreferences.getInstance();
    String? userToken;
    String? userid;

    print("============%%%%%%%%%%==============${instituteid},");

    if (prefs.getString("userToken") != null) {
      userToken = prefs.getString("userToken");
      userid=prefs.getString("userId");
    }
    var headers = {

      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      "Content-Type": "application/json",
      'Authorization': "Bearer ${userToken}",
      'Content-Type': 'application/json; charset=UTF-8',
    };
   // var request = http.MultipartRequest('GET', Uri.parse('${baseurl}api/institute/${instituteid}/class'));
    var request = http.Request('GET', Uri.parse('${baseurl}api/institute/${instituteid}/class'));


    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var geer = await http.Response.fromStream(response);
      Map<String, dynamic> map = jsonDecode(geer.body);
      List<dynamic> list = [];
      list.add(map);

      if(list[0]['status']==true){
        Overseer.loading=false;
        print("===========200===list[0]['status']==true======${Overseer.loading}");
        Get.snackbar(
            "Sucessfully Granted",
            "NOW YOU CAN REGISTER",
            dismissDirection: DismissDirection.horizontal,
            isDismissible: true,
            backgroundColor: MyAppColors.yellowcolor,
            duration: Duration(seconds: 3),
            icon: Icon(  Icons.check_circle_outline,
                color: Colors.green)
        );
      //  var id=list[0]['data']['id'];
      //  Get.offAll(Registered(id: id,));
        // Get.to(Bottom_bar(selectedIndex: 0,));

        Map<String, dynamic> map = jsonDecode(geer.body);
        List<RS_Model> collection = List.empty(growable: true);
        collection.clear();
        collection.add(RS_Model.fromJson(map));
        Overseer.Institute_classesall.clear();
       // List<String> list=[];
        Overseer.Institute_code=collection[0].data!.instituteCode.toString();
        for(int i=0;i<collection[0].data!.classes!.length;i++){
          Overseer.Institute_classesall.add(collection[0].data!.classes![i]);

        }
     // Set<String> uniqueValues = list.toSet();
// List<String> uniqueList = uniqueValues.toList();
      //  Overseer.insid=uniqueValues.toList();
     print(".................................${ Overseer.Institute_classesall}");

Get.to(StudentRegistration());


      }
      if(list[0]['status']==false){
        Overseer.loading=false;
        print("==================services======${Overseer.loading}");
        Get.snackbar(
            "Error",
            "${list[0]['message']}",
            dismissDirection: DismissDirection.horizontal,
            isDismissible: true,
            backgroundColor: MyAppColors.yellowcolor,
            duration: Duration(seconds: 3),
            icon: Icon(  Icons.error_outline,
                color: Colors.red)
        );




        // Get.to(Bottom_bar(selectedIndex: 0,));
      }


      print("==============${geer.body}");
      return true;//AddInventoryModel.fromJson(jsonDecode(geer.body));

    } else {
      Overseer.loading=false;
      Overseer.errorMessage='';
      Overseer.errorMessage = 'ERROR';
      Get.snackbar(
        "Network Error",
        "${Overseer.errorMessage}",
        dismissDirection: DismissDirection.horizontal,
        isDismissible: true,
        backgroundColor: MyAppColors.orangcolors,
        duration: Duration(seconds: 2),
      );
      //throw Exception('Failed to create album.');
      return false;
    }
  }



}
*/
