import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../AppLayer/BaseUrl.dart';
import '../../AppLayer/Networking/apis_services.dart';
import '../../AppLayer/Networking/network_client.dart';

import '../../AppLayer/Streaming/Universal.dart';
import '../../AppLayer/Streaming/appColors.dart';
import 'completeInventoryModel.dart';
import 'package:http/http.dart' as http;

class CompleteInventoryService {

  static Future<List<CompleteInventroyModel>> browse() async {
    final prefs = await SharedPreferences.getInstance();
    String? userToken;
    print("complete inventory======================================================  ");
    if (prefs.getString("userToken") != null) {
      userToken = prefs.getString("userToken");
    }
    http.Response response = await http.get(
        Uri.parse("${baseurl}api/inventory/all"),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Accept': 'application/json',
           'Authorization':"Bearer ${userToken}"
        });


  //  String content = response.body;
   // Universal.printWrapped("-------------------${content}");
    Map<String, dynamic> map = jsonDecode(response.body);
  /*  Get.snackbar(
      "${response.body}",
      "=====",
      dismissDirection: DismissDirection.horizontal,
      isDismissible: true,
      backgroundColor: MyAppColors.orangcolors,
      duration: Duration(seconds: 5),
    );*/
    print("====================================${response.body}");
    List<CompleteInventroyModel> collection = List.empty(growable: true);
    collection.clear();

     collection.add(CompleteInventroyModel.fromJson(map));



   // final parsed = json.decode(content).cast<Map<String, dynamic>>();
   // return parsed.map<Fruit>((json) => Fruit.fromMap(json)).toList();
    return collection;
  }







/*
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<CompleteInventroyModel> list = [];
  Future<List<CompleteInventroyModel>> browse() async {

    final response = await apiService.getCompleteInventoryData();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      list.clear();
      print("APi Response===============${response.data}");
      list.add(CompleteInventroyModel.fromJson(map));
      print("list===================${list}");
      /// print Response Api
      print("adii${response.toString()}");
    } else {}

    return list;
  }*/
}
