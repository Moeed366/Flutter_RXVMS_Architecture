/*
import 'dart:convert';


import 'package:dio/dio.dart' as http_dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rxdart/src/subjects/behavior_subject.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../AppLayer/Networking/apis_services.dart';
import '../../../AppLayer/Networking/network_client.dart';
import '../../../AppLayer/Streaming/Overseer.dart';
import '../../../AppLayer/Streaming/appColors.dart';

import 'package:http/http.dart' as http;
import '../../AppLayer/BaseUrl.dart';
import '../../AppLayer/Networking/Exception_Handling.dart';
import '../../screens/panels/Headmaster_panel/H_BottomTabBarWidget.dart';
import '../../screens/panels/student_panel/Student_navigation.dart';
import '../../screens/panels/teacher_panel/Teacher_navigation.dart';
import '../../screens/panels/Parents_panel/Child_Report_screen.dart';
import '../../screens/panels/Director_panel/Institute_report.dart';
import 'Institute_loginModel.dart';
import 'Parent_loginModel.dart';
import 'loginModel.dart';
import 'Teacher_loginModel.dart';

class LoginFormService {
  http_dio.Dio dio = http_dio.Dio();
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));


  Future<bool> loginSubmitForm(final email, final password, final role) async {
    final prefs = await SharedPreferences.getInstance();
    http_dio.Response response;


    try {
      if(role=="Select Role"){
        print("================${role}=====================================================STUDENT");
        response = await apiService.studentloginUser({'email': email.toString(), 'password': password.toString(),'role': 'student',});}
      else{   print("==============${role}=======================================================OTHER ");
        response = await apiService.loginUser({'email': email.toString(), 'password': password.toString(),'role': role.toString(),});}

      print("${response.statusCode}.............................................................................");
      if (response.statusCode == 200) {

        Map<String, dynamic> map = jsonDecode(response.toString());


        if(map['status'] ==true){
          List<Student_LoginModel> S_logInData = [];
          List<Teacher_LoginModel> T_logInData = [];
          List<Parent_LoginModel> P_logInData = [];
          List<Institute_LoginModel> I_logInData = [];
          S_logInData.clear();
          T_logInData.clear();
          P_logInData.clear();
          I_logInData.clear();
          prefs.clear();
print("=====================================${map['role']}=========================================");
String role=map['role'];
          final SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
          if(role=="student"){
            print("#####################_________________________#############################");
            S_logInData.add(Student_LoginModel.fromJson(map));

            _sharedPreferences.setString('userId',"${S_logInData[0].data!.id.toString()}");
            _sharedPreferences.setString("User_Name", "${S_logInData[0].data!.name}");
            _sharedPreferences.setString("role", "${S_logInData[0].role}");
            _sharedPreferences.setString("Instituteid", "${S_logInData[0].data!.instituteId}");
            _sharedPreferences.setString("image", "${S_logInData[0].data!.image}");
            _sharedPreferences.setString("userToken", "${S_logInData[0].accessToken}");
              _sharedPreferences.setString("classid", "${S_logInData[0].data!.classId}");
            Overseer.userName = "${S_logInData[0].data!.name}";
            Overseer.csrf_token_overseer = "${S_logInData[0].accessToken}";
            Overseer.userId = S_logInData[0].data!.id.toString();
            Overseer.profile_image=S_logInData[0].data!.image;
            Get.to(S_BottomTabBarWidget(selectedIndex: 0,));
          }
          else if(role=="Teacher"){
            T_logInData.add(Teacher_LoginModel.fromJson(map));

            _sharedPreferences.setString('userId',"${T_logInData[0].data!.id.toString()}");
            _sharedPreferences.setString("User_Name", "${T_logInData[0].data!.name}");
            _sharedPreferences.setString("role", "${T_logInData[0].role}");
            _sharedPreferences.setString("Instituteid", "${T_logInData[0].data!.instituteId}");
            _sharedPreferences.setString("image", "${T_logInData[0].data!.image}");
            _sharedPreferences.setString("userToken", "${T_logInData[0].accessToken}");
            Overseer.userName = "${T_logInData[0].data!.name}";
            Overseer.csrf_token_overseer = "${T_logInData[0].accessToken}";
            Overseer.userId = T_logInData[0].data!.id.toString();
            Overseer.profile_image=T_logInData[0].data!.image;
            //  _sharedPreferences.setString("classid", "${logInData[0].data!.classId}");
            Get.to(T_BottomTabBarWidget(selectedIndex: 0,));
          }
          else if(role=="director"){
            I_logInData.add(Institute_LoginModel.fromJson(map));

            _sharedPreferences.setString('userId',"${I_logInData[0].data!.id.toString()}");
            _sharedPreferences.setString("User_Name", "${I_logInData[0].data!.name}");
            _sharedPreferences.setString("role", "${I_logInData[0].role}");
            _sharedPreferences.setString("Instituteid", "${I_logInData[0].data!.id}");
            _sharedPreferences.setString("image", "${I_logInData[0].data!.image}");
            _sharedPreferences.setString("userToken", "${I_logInData[0].accessToken}");
            Overseer.userName = "${I_logInData[0].data!.name}";
            Overseer.csrf_token_overseer = "${I_logInData[0].accessToken}";
            Overseer.userId = I_logInData[0].data!.id.toString();
            Overseer.profile_image=I_logInData[0].data!.image;
            //  _sharedPreferences.setString("classid", "${logInData[0].data!.classId}");
            Get.to(Institute_Report_screen());
          }
          else if (role=="headmaster"){
            I_logInData.add(Institute_LoginModel.fromJson(map));

            _sharedPreferences.setString('userId',"${I_logInData[0].data!.id.toString()}");
            _sharedPreferences.setString("User_Name", "${I_logInData[0].data!.name}");
            _sharedPreferences.setString("role", "${I_logInData[0].role}");
            _sharedPreferences.setString("Instituteid", "${I_logInData[0].data!.id}");
            _sharedPreferences.setString("image", "${I_logInData[0].data!.image}");
            _sharedPreferences.setString("userToken", "${I_logInData[0].accessToken}");
            Overseer.userName = "${I_logInData[0].data!.name}";
            Overseer.csrf_token_overseer = "${I_logInData[0].accessToken}";
            Overseer.userId = I_logInData[0].data!.id.toString();
            Overseer.profile_image=I_logInData[0].data!.image;
            //  _sharedPreferences.setString("classid", "${logInData[0].data!.classId}");
            Get.to(H_BottomTabBarWidget());
          }
          else if (role=="parent"){
            P_logInData.add(Parent_LoginModel.fromJson(map));

            _sharedPreferences.setString('userId',"${P_logInData[0].data!.id.toString()}");
            _sharedPreferences.setString("User_Name", "${P_logInData[0].data!.name}");
            _sharedPreferences.setString("role", "${P_logInData[0].role}");
           // _sharedPreferences.setString("Instituteid", "${P_logInData[0].data!.instituteId}");
           // _sharedPreferences.setString("image", "${P_logInData[0].data!.loginUser!.i}");
            _sharedPreferences.setString("userToken", "${P_logInData[0].accessToken}");
            //  _sharedPreferences.setString("classid", "${logInData[0].data!.classId}");
            Overseer.userName = "${P_logInData[0].data!.name}";
            Overseer.csrf_token_overseer = "${P_logInData[0].accessToken}";
            Overseer.userId = P_logInData[0].data!.id.toString();
            Get.to(Child_Report_screen());
          }

          Overseer.errorMessage = 'Success';
          Overseer.login_status = "verified-user";
          Overseer.is_user_valid = true;
          //  print("=======${logInData[0].data!.loginUser!.firstName}================Login ${logInData[0].data!.loginUser!.apiToken} ======================");

          print("======..=================Login 200 responce if ======================");
          return true;
        }

        else {
          Overseer.errorMessage = '${response.toString()}';
          print("====..========Login 200 responce else ==================${response?.statusCode}");

          Overseer.errorMessage = 'User Not Found';
          Overseer.login_status = "User Not Found";
          Overseer.is_user_valid = false;

          return false;
        }

      }

      else{return false;}
    }








    on DioError catch (error){

      print("Please Internet Connection");
      return false;
    }

  }

}



*/
