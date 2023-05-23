/*
import 'package:er_connnect/widgets/custom_app_bar.dart';
import 'package:er_connnect/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../screens/start_up_screen.dart';
import '../../utils/app_images.dart';
import '../../utils/styles.dart';


class Registered extends StatelessWidget {
   Registered({Key? key,required this.id}) : super(key: key);
int id=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: 10.0.h),
                  Text(
                    'Congratulations',
                    style: Styles.bigHeading
                        .copyWith(fontSize: 38.0.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20.0.h),
                  Text(
                    'You Are',
                    style: Styles.bigHeading
                        .copyWith(fontSize: 38.0.sp,),
                  ),
                  SizedBox(height: 10.0.h),
                  Text(
                    'Registered!',
                    style: Styles.bigHeading
                        .copyWith(fontSize: 38.0.sp,),
                  ),
                  SizedBox(height: 10.0.h),
                  Text(
                    'This is',
                    style: Styles.bigHeading
                        .copyWith(fontSize: 38.0.sp,),
                  ),
                  SizedBox(height: 10.0.h),
                  Text(
                    'Your',
                    style: Styles.bigHeading
                        .copyWith(fontSize: 38.0.sp,),
                  ),
                  SizedBox(height: 10.0.h),
                  Text(
                    'Unique ID',
                    style: Styles.bigHeading
                        .copyWith(fontSize: 38.0.sp,),
                  ),
                  SizedBox(height: 10.0.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Styles.lightGreyButtonColor,
                        minimumSize: Size(300.0.w, 57.0.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0.r),
                        )),
                    onPressed: () {},
                    child: Text(
                      id.toString(),
                      style: Styles.bigHeading
                          .copyWith(color: Colors.white, fontSize: 36.0.sp),
                    ),
                  ),
                  // SizedBox(height:10.0.h),
                  // RichText(
                  //   text: TextSpan(
                  //     children: <TextSpan>[
                  //       TextSpan(text: 'Your free ', style: Styles.bigHeading.copyWith(fontWeight: FontWeight.normal)),
                  //       TextSpan(text: '30 ',style: Styles.bigHeading.copyWith(fontWeight: FontWeight.w500)),
                  //       TextSpan(text: 'days trial',style: Styles.bigHeading.copyWith(fontWeight: FontWeight.normal)),
                  //     ],
                  //   ),
                  // ),
                  // RichText(
                  //   text: TextSpan(
                  //     children: <TextSpan>[
                  //       TextSpan(text: 'ends on ', style: Styles.bigHeading.copyWith(fontWeight: FontWeight.normal)),
                  //       TextSpan(text: '25th Dec 2022 ',style: Styles.bigHeading.copyWith(fontWeight: FontWeight.w500)),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height:10.0.h),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //       backgroundColor: Styles.lightGreyButtonColor,
                  //       minimumSize: Size(300.0.w, 57.0.h),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10.0.r),
                  //       )),
                  //   onPressed: () {},
                  //   child: Text(
                  //     'Renew Payment',
                  //     style: Styles.bigHeading
                  //         .copyWith(color: Colors.white, fontSize: 36.0.sp),
                  //   ),
                  // ),
                  SizedBox(height:20.0.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: Size(200.0.w, 47.0.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0.r),
                        )),
                    onPressed: () {
                      Get.offAll(StartUpScreen());
                    },
                    child: Text(
                      ''
                          'Ok',
                      style: Styles.bigHeading
                          .copyWith(color: Colors.white, fontSize: 36.0.sp),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
