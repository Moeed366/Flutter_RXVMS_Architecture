/*
import 'package:er_connnect/Authentication==/registration/Student_Signup/student_signup_services.dart';
import 'package:er_connnect/widgets/custom_app_bar.dart';
import 'package:er_connnect/widgets/custom_textfield_with_label_and_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/app_images.dart';
import '../../../../utils/appcolor.dart';
import '../../../../utils/styles.dart';
import '../../../../widgets/submit_button.dart';
import 'RS_Service.dart';


class RSScreen extends StatefulWidget {
  RSScreen({Key? key}) : super(key: key);

  @override
  State<RSScreen> createState() => _RSScreenState();
}

class _RSScreenState extends State<RSScreen> {
  bool _passwordVisible = true;


  String instituteid = "";

  final _formkey = GlobalKey<FormState>();
  RS_Service _studentRegisterService =RS_Service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(color: Colors.grey.shade300,
                  // margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(AppImages.logo, width: 50.0.w, height: 50.0.h),
                        Text(
                          "STUDENT REGISTRATION",
                          style: Styles.heading.copyWith(
                              color: appgold ,fontWeight: FontWeight.w700),
                        ),
                        SizedBox()

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [

                      SizedBox(height: 20.0.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                        child: Column(
                          children: [
                            SizedBox(height: 30.0.h),
                            Text(
                              "ENTER YOUR INSTITUTE ID",
                              style: Styles.heading.copyWith(
                                  color: appgold ,fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 30.0.h),
                            CustomTextField(
                              text: 'Institute ID',
                              image: AppImages.instituteNameIcon,
                              hint: 'Enter institute id',
                              validate: "Enter Institude Id",
                              onChanged: (value) {
                                setState(() {
                                  instituteid = value;
                                });
                              },
                            ),
                            SizedBox(height: 20.0.h),
                            SubmitButton(
                              buttonName: 'NEXT',
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {

                                  setState((){
                                    apiCall=true;
                                    if(apiCall==true){
                                      indicator(context);
                                    }
                                  });
                                  _callWeatherApi();
                                } else {}
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
  bool apiCall = false;
  Future<void> _callWeatherApi() async {
    var api =  await _studentRegisterService.AddInstitute(
      instituteid);

    if(api==true) {
      print("========if**====${api}");
      apiCall= false;
      setState(() {});
      print("========if**====${api}");

    } else {
      print("=======else*====${api}");
      apiCall=false;
      setState(() {});
    }
  }

  Future<void> indicator(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return  Center(
          //   child: CircularProgressIndicator(
          //   color: Colors.white,
          // ),
          child: CircularProgressIndicator(
            color: progresscolor,
          ),
        );
      },
    );
  }
}
*/
