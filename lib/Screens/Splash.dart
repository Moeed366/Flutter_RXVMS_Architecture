import 'dart:async';

import 'package:asasa_estate/Screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Bottom_bar.dart';
import 'Screens/Auth/Login/login_screen.dart';
import 'Screens/Dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    userLogin();
  }

  userLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? userToken = preferences.getString('userToken');



      if (userToken == null) {
        Get.offAll(Login());
      } else {
        Get.offAll( Bottom_bar(selectedIndex: 0,));
      }

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(child: Container(height: 150.h,width: 150.w,

            child:// SvgPicture.asset('assets/images/logo2.png',)
        Image.asset("assets/images/splash.png")
        
        )),
      ),
    );
  }
}