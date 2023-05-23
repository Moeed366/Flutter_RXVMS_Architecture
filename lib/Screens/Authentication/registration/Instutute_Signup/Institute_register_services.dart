/*




import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../AppLayer/BaseUrl.dart';
import '../../../AppLayer/Streaming/Overseer.dart';
import '../../../AppLayer/Streaming/appColors.dart';
import '../registered.dart';
class InstituteRegisterService{
   
  Future<bool> AddInstitute( instituteName,email, password, mobileNo,country,address,imgFile_compressed
      ) async {

    final prefs = await SharedPreferences.getInstance();
    String? userToken;
    String? userid;

    print("============%%%%%%%%%%==============${instituteName} ${email}, ${password}, ${mobileNo}, ${country},${address},");

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
    var request = http.MultipartRequest('POST', Uri.parse('${baseurl}api/RegisterInstitute'));
    request.fields.addAll({
   'name': instituteName.toString(),
  'phoneNumber': mobileNo.toString(),
  'password': password.toString(),
  'country': country.toString(),
  'address': address.toString(),
  'email': email.toString()
    });
    final multipartFile = http.MultipartFile(
      'image',
      imgFile_compressed.readAsBytes().asStream(),
      imgFile_compressed.lengthSync(),
      filename: imgFile_compressed.path.split('/').last,
    );
    request.files.add(multipartFile);
    

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var geer = await http.Response.fromStream(response);
      Map<String, dynamic> map = jsonDecode(geer.body);
      List<dynamic> list = [];
      list.add(map);

      if(list[0]['status']==true){
        Overseer.loading=false;
        print("==================services======${Overseer.loading}");
        Get.snackbar(
            "Sucessfully",
            "Institute Registered",
            dismissDirection: DismissDirection.horizontal,
            isDismissible: true,
            backgroundColor: MyAppColors.yellowcolor,
            duration: Duration(seconds: 3),
            icon: Icon(  Icons.check_circle_outline,
                color: Colors.green)
        );
        var id=list[0]['data']['institute_code'];
        Get.offAll(Registered(id: id,));
       // Get.to(Bottom_bar(selectedIndex: 0,));
      }
      else if(list[0]['status']==false){
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
      else {
        Overseer.loading=false;
        Get.snackbar(
          "Error",
          "Some Thing Went Wrong",
          dismissDirection: DismissDirection.horizontal,
          isDismissible: true,
          backgroundColor: MyAppColors.yellowcolor,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.error_outline, color: Colors.red),
        );
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
