/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../DataLink/Streaming/Provider.dart';
import 'loginManager.dart';

class Login extends StatefulWidget {
   Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey=GlobalKey<FormState>();
  String sizetype = "Select Role";
  var email='';

  var password='';

  final emailcontroller=TextEditingController();

  final passwordcontroller=TextEditingController();
  final iidcontroller=TextEditingController();

  bool _passwordVisible=true;
bool role=false;
  @override
  void dispose(){
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginFormManager manager = Provider.of(context).fetch(LoginFormManager);
    return SafeArea(
      child: Scaffold(
       appBar: AppBar(automaticallyImplyLeading: false,
flexibleSpace:  PreferredSize(
           child: Container(color: Colors.grey.shade300,
             // margin: EdgeInsets.only(left: 10,right: 10,top: 10),
             child: Padding(
               padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Image.asset(AppImages.logo, width: 50.0.w, height: 50.0.h),
                   Text(
                     "LOGIN",
                     style: Styles.heading.copyWith(
                         color: appgold ,fontWeight: FontWeight.w700),
                   ),
                   SizedBox()

                 ],
               ),
             ),
           ),







           preferredSize: Size(60, 70),
         ),
       ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [



                Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 48.h),
                  child: StreamBuilder<String>(
                      stream: manager.email$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: emailcontroller,
                          autofocus: false,
                          onChanged: (value){
                            manager.inEmail.add(value);
                          },
                          style: TextStyle(
                              color: Colors.black
                          ),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0.r),
                              borderSide:
                              BorderSide(color: Color(0xFF9FA5C0), width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0.r),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            // hintText: '@ xyz@gmail.com',
                            labelText: 'Email Address',
                            //fillColor: Colors.black,
                            border: OutlineInputBorder(),
                            errorText: snapshot.error == null
                                ? ""
                                : snapshot.error.toString(),
                            errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),



                          ),

                        );
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
                  child: StreamBuilder<String>(

                      stream: manager.password$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          style: TextStyle(
                              color: Colors.black
                          ),
                          controller: passwordcontroller,
                          autofocus: false,
                          obscureText: _passwordVisible,
                          onChanged: (value){
                            manager.inPassword.add(value);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                            errorText: snapshot.error == null
                                ? ""
                                : snapshot.error.toString(),
                            labelStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0.r),
                              borderSide: BorderSide(
                                color:Colors.black,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0.r),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                            //  fillColor: Colors.black,
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Icon(
// Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
// Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            // hintText: '@ xyz@gmail.com',
                            labelText: 'Password',
                          ),

                        );
                      }
                  ),
                ),
 Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
                  child: StreamBuilder<String>(

                      stream: manager.iid$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          style: TextStyle(
                              color: Colors.black
                          ),
                          controller: iidcontroller,
                          autofocus: false,
                          // obscureText: _passwordVisible,
                          onChanged: (value){
                            manager.iniid.add(value);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                            errorText: snapshot.error == null
                                ? ""
                                : snapshot.error.toString(),
                            labelStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0.r),
                              borderSide: BorderSide(
                                color:Colors.black,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0.r),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                            //  fillColor: Colors.black,
                            filled: true,

                            // hintText: '@ xyz@gmail.com',
                            labelText: 'Institute Id',
                          ),

                        );
                      }
                  ),
                ),






                SizedBox(
                  width: 140.w,
                  height: 80.h,
                  child: FittedBox(
                    fit: BoxFit.contain,

                    child: GFToggle(enabledTrackColor: appgold,
                      onChanged: (val){

                        if(role==false){
                          sizetype='Select Role';
                        }
                        role=!role;
                        print(sizetype);
                        setState(() {

                        });
                      },
                      value: false,
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  !role?Text("I'm Student",style: Styles.text.copyWith(
                      color: appgold ,fontWeight: FontWeight.w500),):Text("I'm Not Student",style: Styles.text.copyWith(
                      color: appgold ,fontWeight: FontWeight.w500),),
                ],),



                SizedBox(
                  height: 30.h,
                ),

Row(mainAxisAlignment: MainAxisAlignment.center,
  children: [

  role?Container(
    decoration: BoxDecoration(
      border: Border.all(width: 1),
      borderRadius: BorderRadius.circular(
            10.r), //border corner radius
    ),
    height: 30.h,
    width: 150.w,
    child: DropdownButtonHideUnderline(
      child:  Theme(
          data: Theme.of(context).copyWith(
            canvasColor: appgold,
          ),
          child: StreamBuilder<String>(

          stream: manager.role$,
          builder: (context, snapshot) {

          return DropdownButton<String>(borderRadius: BorderRadius.circular(22),
            value: sizetype,
            icon:
            const Icon(Icons.keyboard_arrow_down),
            isExpanded: true,
            iconSize: 30,
            elevation: 10,
            style:
            const TextStyle(color: appgrey,fontWeight: FontWeight.w700,fontSize: 20),
            onChanged: (String? newValue) {

              setState(() {
                sizetype = newValue!;
              });
              manager.inrole.add(sizetype);
            },
            items: <String>[
              'Select Role','director','headmaster','teacher','parent',

            ].map<DropdownMenuItem<String>>(
                    (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: 9.w),
                      child: Text(
                        value,
                        style:  TextStyle(
                            fontSize: 12.sp,color: Colors.black,
                            letterSpacing: 0.9,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  );
                }).toList(),
          );
          }
          ),
      ),
    ),
  ):SizedBox(),
],),


                SizedBox(
                  height: 20.h,
                ),
                StreamBuilder<Object>(
                    stream: manager.isLoginFormValid$,

                    builder: (context, snapshot) {
                      return Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 50.w),
                        child: SubmitButton(buttonName: 'Login',  onPressed: () {

                          manager.inrole.add(sizetype);
                          print("_____________________________________________________${sizetype}");
                          Get.snackbar(
                            "Submitting",
                            "Verifying User Details",
                            dismissDirection:
                            DismissDirection.horizontal,
                            isDismissible: true,
                            backgroundColor: MyAppColors.yellowcolor,
                            duration: Duration(seconds: 1),
                          );

                          if(snapshot.hasData){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                print("===snapshort data===${snapshot.hasData}");
                                return  Center(
                                  child: CircularProgressIndicator(
                                    color: progresscolor,
                                  ),

                                );
                              },
                              barrierDismissible: true,
                            );
                            manager.isLoginFormSubmit$.listen((event) async{
                              if(Overseer.is_user_valid==true) {
                                Get.snackbar(
                                  "Congratulation",
                                  "${Overseer.errorMessage}",
                                  dismissDirection:
                                  DismissDirection.horizontal,
                                  isDismissible: true,
                                  backgroundColor: MyAppColors.yellowcolor,
                                  duration: Duration(seconds: 1),
                                  icon: const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green),
                                );

                              }

                            });
                          }else{
                            Navigator.of(context).pop();
                            Get.snackbar(
                              "Error",
                              "Snap short has not data",
                              dismissDirection:
                              DismissDirection.horizontal,
                              isDismissible: true,
                              backgroundColor: MyAppColors.yellowcolor,
                              duration: Duration(seconds: 2),
                              icon: const Icon(Icons.error_outline,
                                  color: Colors.red),
                            );
                          }



                        },),
                      );
                    }
                ),
                SizedBox(
                  height: 40.h,
                ),

                // Padding(
                //   padding: EdgeInsets.only(top: 28.h),
                //   child: Center(
                //     child: InkWell(onTap: (){Get.to(Forget_Password());},
                //       child: Text(
                //         'Forgot Password?',
                //         style: TextStyle(
                //             decoration: TextDecoration.underline,
                //             color: AppColors().TextColorBlack,
                //             fontSize: 12.sp,
                //             fontWeight: FontWeight.w400),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 40.h,),
                // SizedBox(height: 100.h,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         'Don’t have an account?',
                //         style: TextStyle(
                //             color: AppColors().TextColorBlack,
                //             fontSize: 13.sp,
                //             fontWeight: FontWeight.w400),
                //       ),
                //       TextButton(
                //         onPressed: () {Get.to(Sign_Up());},
                //         child: Text(
                //           'Sign up',
                //           style: TextStyle(fontFamily: 'SpaceGrotesk-Medium',
                //               decoration: TextDecoration.underline,
                //               color: AppColors().TextColorBlack,
                //               fontSize: 14.sp,
                //               fontWeight: FontWeight.w500),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // SizedBox(height: 20.h,)
              ],
            ),
          ),
        ),

 body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 10.0.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomAppBar(text: 'Login',),
                    SizedBox(height:20.0.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      child: Column(
                        children: [
                          CustomTextField(text: 'Email', image: AppImages.emailIcon, keyboardType: TextInputType.emailAddress,hint: 'Enter email',),
                          SizedBox(height:10.0.h),
                          CustomTextField(text: 'Password',keyboardType: TextInputType.visiblePassword, icon: IconButton(onPressed: () {  }, icon: Icon(Icons.visibility_off_outlined),),hiddenText: true,image: AppImages.passwordIcon, hint: 'Enter password',),
                          SizedBox(height:10.0.h),
                          CustomTextField(text: 'Institute ID', image: AppImages.instituteNameIcon, hint: 'Enter institute id', ),
                          SizedBox(height:20.0.h),
                          SubmitButton(buttonName: 'As Student',onPressed: (){

                            Get.to(S_BottomTabBarWidget());
                            },),
                          SizedBox(height: 20.h,),
                          SubmitButton(buttonName: 'As Teacher',onPressed: (){
                            Get.to(T_BottomTabBarWidget());
                            },),
                          SizedBox(height: 20.h,),
                          SubmitButton(buttonName: 'As Director',onPressed: (){
                            Get.to(Institute_Report_screen());
                          },),
                          SizedBox(height: 20.h,),
                          SubmitButton(buttonName: 'As HeadMaster',onPressed: (){
                            Get.to(H_BottomTabBarWidget());
                          },),
                          SizedBox(height: 20.h,),
                          SubmitButton(buttonName: 'As Parents',onPressed: (){
                            Get.to(Child_Report_screen());
                          },)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

      ),
    );
  }
}
*/
