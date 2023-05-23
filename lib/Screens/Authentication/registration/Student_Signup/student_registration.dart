/*
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:er_connnect/AppLayer/Streaming/Overseer.dart';
import 'package:er_connnect/Authentication==/registration/Student_Signup/student_signup_services.dart';
import 'package:er_connnect/widgets/custom_app_bar.dart';
import 'package:er_connnect/widgets/custom_textfield_with_label_and_icon.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../../AppLayer/Streaming/appColors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/appcolor.dart';
import '../../../utils/styles.dart';
import '../../../widgets/submit_button.dart';
import '../registered.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'STUDENT_REGISTER_STARTUP/RSMODEL.dart'as modeldata;

class StudentRegistration extends StatefulWidget {
  StudentRegistration({Key? key}) : super(key: key);

  @override
  State<StudentRegistration> createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {




  List<modeldata.Data> showlist = List.empty(growable: true) ;

  String? selectedItem;//= Overseer.insid[0].toString();
  final TextEditingController textEditingController = TextEditingController();

  bool _passwordVisible = true;
  String name = "";

  String email = "";

  String password = "";

  String mobileNo = "";

  String instituteId = "";
  String classid = "";
  final _formkey = GlobalKey<FormState>();
   StudentRegisterService _studentRegisterService =StudentRegisterService();
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
                        
                       

               







                        CustomTextField(
                          text: 'Student Name',
                          image: AppImages.instituteNameIcon,
                          hint: 'Enter student name',
                          validate: "Enter Name",
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                        ),
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
                          validator:(value){
                            if(value!.isEmpty||value!.length <8) {

                              return "Password should be greter then 7 Characters";
                            }

                          },
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
                          hint: 'Enter 11 digit phone number',
                          validate: "Enter 11 digit phone number",
                            phonenumber:true,
                          validator:(value){
                            if(value!.isEmpty||value!.length <11) {

                                    return "Enter 11 digit phone number";
                            }

                          },


                          onChanged: (value) {

                            setState(() {
                              mobileNo = value;
                            });
                          },
                        ),
                        SizedBox(height: 10.0.h),



                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 7.0.w),
                              child: Row(
                                children: [
                                  Icon(Icons.class_),
                                  SizedBox(width: 7.0.w),
                                  Text(
                                    "Select Class",
                                    style: Styles.heading.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0.h),
                            Container( width: double.infinity,height: 60.h,
                              decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 3,),
                                borderRadius: BorderRadius.circular(10)
                            ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 40.w),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isDense: false,
                                    isExpanded: true,
                                    hint: Text(
                                      'Select class',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: Overseer.Institute_classesall
                                        .map((item) {


                                      return DropdownMenuItem(


                                        onTap: (){
                                        classid=item.id.toString();
                                      },
                                      value: item.id.toString(),
                                      child: Text(
                                        item.name!,
                                        style: const TextStyle(
                                          fontSize: 14,color: Colors.black
                                        ),
                                      ),
                                    );}
)
                                        .toSet() .toList(),
                                    value: selectedItem,
                                    onChanged: (value) {
                                      setState(() {
                                        print("........................................${classid}");
                                        selectedItem = value as String;

                                        print(".......................selectedItem.................${selectedItem}");
                                      });
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      height: 40,
                                      width: 200,
                                    ),
                                    dropdownStyleData: const DropdownStyleData(
                                      maxHeight: 200,
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                    ),
                                   */
/* dropdownSearchData: DropdownSearchData(
                                      searchController: textEditingController,
                                      searchInnerWidgetHeight: 50,
                                      searchInnerWidget: Container(
                                        height: 50,
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                          bottom: 4,
                                          right: 8,
                                          left: 8,
                                        ),
                                        child: TextFormField(
                                          expands: true,
                                          maxLines: null,
                                          controller: textEditingController,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 8,
                                            ),
                                            hintText: 'Search for an item...',
                                            hintStyle: const TextStyle(fontSize: 12),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                      searchMatchFn: (item, searchValue) {
                                        return (item.value.toString().contains(searchValue));
                                      },
                                    ),*//*

                                    //This to clear the search value when you close the menu
                                   */
/* onMenuStateChange: (isOpen) {
                                      if (!isOpen) {
                                        textEditingController.clear();
                                      }
                                    },*//*

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),








*/
/*

                        SizedBox(height: 10.0.h),
                        CustomTextField(
                          text: 'Institute ID',
                          image: AppImages.instituteNameIcon,
                          hint: 'Enter institute id',
                          validate: "Enter Institude Id",
                          onChanged: (value) {
                            setState(() {
                              instituteId = value;
                            });
                          },
                        ),*//*

                        SizedBox(height: 20.0.h),
                        SubmitButton(
                          buttonName: 'Register',
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              print("================${imgFile_compressed}======");
                              if(selectedItem!=null&&imgFile_compressed!=null){


                                setState((){
                                  apiCall=true;
                                  if(apiCall==true){
                                    indicator(context);
                                  }
                                });
                                _callWeatherApi();
                              }
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
     var api =  await _studentRegisterService.AddStudent(
       name,email, password, mobileNo,Overseer.Institute_code,selectedItem,imgFile_compressed);

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
