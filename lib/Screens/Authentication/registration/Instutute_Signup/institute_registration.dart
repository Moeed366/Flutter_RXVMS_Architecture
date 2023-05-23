/*
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';


import '../../../AppLayer/Streaming/appColors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/appcolor.dart';
import '../../../utils/styles.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_textfield_with_label_and_icon.dart';
import '../../../widgets/submit_button.dart';
import '../registered.dart';
import 'Institute_register_services.dart';

class InstituteRegistration extends StatefulWidget {
  InstituteRegistration({Key? key}) : super(key: key);

  @override
  State<InstituteRegistration> createState() => _InstituteRegistrationState();
}

class _InstituteRegistrationState extends State<InstituteRegistration> {
  InstituteRegisterService _instituteRegisterService =InstituteRegisterService();
  bool _passwordVisible = true;
  String instituteName = "";

  String name = "";

  String email = "";

  String password = "";

  String mobileNo = "";

  String country = "";

  String address = "";

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
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
                          "INSTITUTE REGISTRATION",
                          style: Styles.heading.copyWith(
                              color: appgold ,fontWeight: FontWeight.w700),
                        ),
                        SizedBox()

                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h,),
                      Center(
                        child: Container( decoration: new BoxDecoration(color: appgrey, borderRadius:BorderRadius.circular(100)),
                          alignment: Alignment.center,
                          height: 100,width: 100,
                          child: Stack(
                            children: <Widget>[
                              imgFile == null?
                              Align( alignment: Alignment.center,
                                  child: Icon(Icons.person,size: 60,color: Colors.white,)):
                              Align(         alignment: Alignment.center,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100.0),child: Image.file(imgFile!, ))),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(onPressed: () {
                                    showOptionsDialog(context);
                                  }, icon: Icon(Icons.camera_alt,color: Colors.red,size: 30,),)
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                        child: Column(
                          children: [
                            CustomTextField(
                              text: 'Institute Name',
                              image: AppImages.instituteNameIcon,
                              hint: 'Enter institute name',
                              validate: "Enter Institute Name",
                              onChanged: (value) {
                                setState(() {
                                  instituteName = value;
                                });
                              },
                            ),
                            // SizedBox(height: 10.0.h),
                            // CustomTextField(
                            //   text: 'Contact Name',
                            //   image: AppImages.contactNameIcon,
                            //   hint: 'Enter name',
                            //   validate: "Enter Name",
                            //   onChanged: (value) {
                            //     setState(() {
                            //       name = value;
                            //     });
                            //   },
                            // ),
                            SizedBox(height: 10.0.h),
                             CustomTextField(
                            text: 'Email',
                            image: AppImages.emailIcon,
                            keyboardType: TextInputType.emailAddress,
                            hint: 'Enter email',
                            validate: "Enter Email",
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                          ),
                          SizedBox(height: 10.0.h),
                            CustomTextField(
                              text: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              icon: IconButton(
                                icon: Icon(
// Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
// Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              hiddenText: _passwordVisible,
                              image: AppImages.passwordIcon,
                              hint: 'Enter password',
                              validate: "Enter Password",
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                            ),
                            SizedBox(height: 10.0.h),
                            CustomTextField(
                              text: 'Mobile Number',
                              keyboardType: TextInputType.number,
                              image: AppImages.mobileNumberIcon,
                              hint: 'Enter phone',
                              validate: "Enter Phone",
                              onChanged: (value) {
                                setState(() {
                                  mobileNo = value;
                                });
                              },
                            ),
                            SizedBox(height: 10.0.h),
                            CustomTextField(
                              text: 'Country',
                              image: AppImages.countryIcon,
                              hint: 'Enter country',
                              validate: "Enter Country",
                              onChanged: (value) {
                                setState(() {
                                  country = value;
                                });
                              },
                            ),
                            SizedBox(height: 10.0.h),
                            CustomTextField(
                              text: 'Address',
                              image: AppImages.addressIcon,
                              hint: 'Enter address',
                              validate: "Enter Address",
                              onChanged: (value) {
                                setState(() {
                                  address = value;
                                });
                              },
                            ),
                            SizedBox(height: 20.0.h),

                           SubmitButton(
                              buttonName: 'Register',
                              onPressed: () {
                                 print("================resppppp======");
                              if (_formkey.currentState!.validate()) {
                                if(imgFile_compressed!=null){
                                print("================resppppp======");
                                  setState((){
                                    apiCall=true;
                                    if(apiCall==true){
                                      indicator(context);
                                    }
                                  });
                                  _callWeatherApi();}

                                else{    Get.snackbar(
                                    "Error",
                                    "Fill All Fields",
                                    dismissDirection: DismissDirection.horizontal,
                                    isDismissible: true,
                                    backgroundColor: MyAppColors.yellowcolor,
                                    duration: Duration(seconds: 3),
                                    icon: Icon(  Icons.error_outline,
                                        color: Colors.red)
                                );}
                              }
                              // enterInventoryFormService.NewInventorySubmitForm( username, aname, direct_itemcount, orientation, Sector, streetnumber, Contact, categorycheck, sizetype, Selectphase, Area, plottype, propertytypeString, "Pending", priceconverter, size, Extraland, pfshnumber);
                              //   enterInventoryFormService.NewI
                              },
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool apiCall = false;
  Future<void> _callWeatherApi() async {
    var api =  await _instituteRegisterService.AddInstitute(
        instituteName,email, password, mobileNo,country,address,imgFile_compressed);

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



  File? imgFile;
  File? imgFile_compressed;
  final imgPicker = ImagePicker();
  FilePickerResult? result;
  PlatformFile? filepicked;
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
  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Options",style: TextStyle(color: Colors.black),),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Capture Image From Camera",style: TextStyle(color: Colors.black),),
                    onTap: () {
                      openCamera();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("Take Image From Gallery",style: TextStyle(color: Colors.black),),
                    onTap: () {
                      openGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  void openCamera() async {
    var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    Navigator.of(context).pop();
    setState(() {

      imgFile = File(imgCamera!.path);
    });
    await  compress();


  }
  void openGallery() async {
    var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
    Navigator.of(context).pop();
    setState(() {
      imgFile = File(imgGallery!.path);


    });
    await  compress();



  }


  Future<void> compress() async {

    var result = await FlutterImageCompress.compressAndGetFile(
      imgFile!.absolute.path,
      imgFile!.path + 'compressed.jpg',
      quality: 66,
    );
    setState(() {
      imgFile_compressed = result;
      print("==========================${imgFile_compressed?.lengthSync()}");
    });
  }
}
*/
