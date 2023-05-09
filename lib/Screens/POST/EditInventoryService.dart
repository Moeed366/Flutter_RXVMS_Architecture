import 'dart:convert';


import 'package:dio/dio.dart' as http_dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../DataLink/DIO_Networking/apis_services.dart';
import '../../DataLink/DIO_Networking/network_client.dart';
import '../../DataLink/Streaming/Universal.dart';
import '../../DataLink/Streaming/appColors.dart';






class Update_Inventory_Service {
  http_dio.Dio dio = http_dio.Dio();
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<void> logInData = [];

  Future<bool> UpdateInventory(id,
  soldavailable_string,
  username,
  direct_itemcount,
  orientation,
  Sector,
  streetnumber,
  usercontact,
      category,
  sizetype,
  Selectphase,
  plottype,
  rentsale_string,
  price,
  size,
  Extraland,
  pfshnumber,
  propertynumber,
  area_id,
  floornumber,
  blocknumber,
  buildingname,
  agency,
  bedroom) async {



    final prefs = await SharedPreferences.getInstance();

    String? userToken;
    String? userId;

    print("getting data train data  ");
    if (prefs.getString("userToken") != null) {
      userToken = prefs.getString("userToken");
      userId = prefs.getString("userId");
    }
    final response;
    try {
      response = await apiService.updateinventory(id,
          {  'user_id':  userId.toString(),
            'property':  rentsale_string.toLowerCase().toString(),
            'agency_name': agency.toString(),
            'item_condition': direct_itemcount.toString(),
            'orientation': orientation.toString(),
            'sector': Sector.toString(),
            'street_number': streetnumber.toString(),
            'reference_mobile': usercontact.toString(),
            'size_unit': sizetype.toLowerCase().toString(),
            'area_phase_id': Selectphase.toString(),
            'area_id': area_id.toString(),
            'plot_type': plottype.toLowerCase().toString(),
            'item_status': propertynumber.toLowerCase().toString(),
            'price':price.replaceAll(',','').toString(),
            'size': size.toString(),
            'extra_land': Extraland.toString(),
            'plot_number':  pfshnumber.toString(),
            'reference_name': username.toLowerCase().toString(),
            'purchase_status': soldavailable_string.toString(),
            'category':category.toString(),
            'flat_no': pfshnumber.toString(),
            'floor_no': floornumber.toString(),
            'building_name': buildingname.toString(),
            'block_no':  blocknumber.toString(),
          });
      if (response.statusCode == 200) {

        Map<String, dynamic> map = jsonDecode(response.toString());

        if(map['success'] !=false){
          print("########################## ${response.statusCode} #####################################");
          Get.back();

          Universal.errorMessage = 'Success';
          Get.snackbar(
            "Successfully",
            backgroundColor:
            Colors.yellowAccent,
            "Inventory Updated",
            icon: const Icon(
                Icons.check_circle_outline,
                color: Colors.green),
            snackPosition: SnackPosition.TOP,
          );
           //Get.offAll(() => intro_screen());
          return true;
        }
        else {
          Get.snackbar(
            "Unable To Update",
            "Check Internet Connection",
            dismissDirection: DismissDirection.horizontal,
            isDismissible: true,
            backgroundColor: MyAppColors.yellowcolor,
            duration: Duration(seconds: 2),
            icon: Icon(Icons.error_outline, color: Colors.red),
          );
          Universal.errorMessage = '${response.toString()}';
          print("============Login 200 responce else ==================${response?.statusCode}");
          Universal.errorMessage = '';
          Universal.login_status = "";
          Universal.is_user_valid = false;

          return false;
        }

      }
      else{return false;}
    }
    catch (error) {

      String content = error.toString();
      print("===========${content}exception else error =======${error.toString()}==========");
      Universal.errorMessage = error.toString();
      Get.snackbar(
        "Network Error",
        "${Universal.errorMessage}",
        dismissDirection: DismissDirection.horizontal,
        isDismissible: true,
        backgroundColor: MyAppColors.orangcolors,
        duration: Duration(seconds: 2),
      );
      print("Please Internet Connection");
      return false;
    }



























    on http_dio.DioError catch (exception) {
      String content = exception.response.toString();
      if(exception.response?.statusCode == 404){
        Universal.errorMessage = '${exception.response?.statusCode}';
        print("============content==================${exception.response?.statusCode}");
        Get.snackbar(
          "User Not Found",
          " please check",
          dismissDirection: DismissDirection.horizontal,
          isDismissible: true,
          backgroundColor: MyAppColors.yellowcolor,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.error_outline, color: Colors.red),
        );
        Universal.errorMessage = 'User Not Found';
        Universal.login_status = "User Not Found";
        Universal.is_user_valid = false;
      }else{
        print("===========exception else error =======${content}==========");

      }
      return false;
      // throw Exception(exception.message);
      // throw RemoteException(dioError: exception);
    }





    //  catch (error) {
    //
    // String content = error.toString();
    //    print("===========${content}exception else error =======${error.toString()}==========");
    //    Universal.errorMessage = error.toString();
    //    Get.snackbar(
    //      "Error",
    //      "${Universal.errorMessage}",
    //      dismissDirection: DismissDirection.horizontal,
    //      isDismissible: true,
    //      backgroundColor: MyAppColors.orangcolors,
    //      duration: Duration(seconds: 2),
    //    );
    //    print("NoSuchMethodError caught Error  ${NoSuchMethodError}");
    //    return false;
    //  }
  }
}
