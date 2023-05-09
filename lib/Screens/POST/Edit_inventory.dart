import 'package:asasa_estate/Bottom_bar.dart';
import 'package:asasa_estate/Screens/Profile/Profile_screen.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../AppLayer/Streaming/appColors.dart';
import '../../Widgets/Popup_labels.dart';
import '../../utils/appcolor.dart';
import '../../utils/appimages.dart';
import '../My_Inventory/My_Inventory_Model.dart';
import 'EditInventoryService.dart';



class Edit_inventory extends StatefulWidget {
  String propertyid;
  Data dataList;


   Edit_inventory({Key? key,required this.dataList,required this.propertyid}) : super(key: key);

  @override
  State<Edit_inventory> createState() => _Edit_inventoryState();
}

class _Edit_inventoryState extends State<Edit_inventory> {
 ///=====================================================================================================================
  int rentsale_radio = 1;
  String rentsale_string = "Sale";
  String dropdownValue = 'Select Phase';
  String Area = "DHA";
  String soldavailable_string="pending";
  String Selectphase = '1';
  String direct_itemcount = "Direct Client";
  int Areaidradio = 1;
  int statusitem = 1;
  String StatusofitemString = "Plot";
  bool flatdetailstextfield = false;
  bool streettextfield = true;
  String propertynumber = "Plot";
  String plottype = "residential";
  String pfshnumber = "";
  String streetnumber = "";
  String Sector = "";
  String size = "";
  String sizetype = "marla";
  int orientationradio = 1;
  String orientation = "North";
  String categorycheck = "";
  List multipleSelected = [];
  String category = "";
  String floornumber = "";
  String blocknumber = "";
  String bedroom = "";
  String buildingname = "";
  TextEditingController extraland = TextEditingController();
  List categorylist = [
    {
      "id": 0,
      "value": false,
      "title": "Corner",
    },
    {
      "id": 1,
      "value": false,
      "title": "General",
    },
    {
      "id": 2,
      "value": false,
      "title": "Avenue",
    },
    {
      "id": 3,
      "value": false,
      "title": "Boulevard",
    },
    {
      "id": 4,
      "value": false,
      "title": "Park",
    },

  ];
  String Extraland = "No Any extra information.";
  bool itemtextfield = false;
  bool plotdropdown = true;
  bool others = false;
  bool phasedropdown = true;
  String priceconverter = '0';
  String price = '0';
  String companyname = "";
  String username = "";
  String usercontact = "";
  String agency = "";
  int area_id = 1;
  List<String> p = [];

  TextEditingController pricecontroller = TextEditingController();
  String regex = r'[^\p{Alphabetic}\p{Mark}\p{Decimal_Number}\p{Connector_Punctuation}\p{Join_Control}\s]+';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _contactTextController = TextEditingController();
  //======radio list view==================
  List<int> check_list = [];
  int groupValue = 0;
  List phases_id = [];
bool initialcall=true;
  ///====================================================================================================================
  TextEditingController _pfshnumber = TextEditingController();
  TextEditingController _Sector = TextEditingController();
  TextEditingController _streetnumber = TextEditingController();
  TextEditingController _floornumber = TextEditingController();
  TextEditingController  _blocknumber= TextEditingController();
  TextEditingController _buildingname = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _Extraland = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _usercontact = TextEditingController();
  TextEditingController _size = TextEditingController();
  Update_Inventory_Service updateservice=Update_Inventory_Service();
  late MyInventoryModel myinventory = MyInventoryModel(success: true, data: [],);
  late int Tremcondition_radio = 1;
  @override
  void initState() {
    pricecontroller.text=widget.dataList.price.toString();
    extraland.text=widget.dataList.extraLand.toString();
    _contactTextController.text=widget.dataList.user!.name.toString();

    rentsale_string = widget.dataList.property.toString();
    propertynumber= widget.dataList.itemStatus.toString();
    Area=widget.dataList.area!.id.toString();
    Selectphase=widget.dataList.areaPhaseId.toString();
    pfshnumber=widget.dataList.plotNumber.toString();
    streetnumber=widget.dataList.streetNumber.toString();
    Sector=widget.dataList.sector.toString();
    floornumber = widget.dataList.floorNo.toString();
    blocknumber = widget.dataList.blockNo.toString();
    buildingname = widget.dataList.buildingName.toString();
    size=widget.dataList.size.toString();
    sizetype=widget.dataList.sizeUnit.toString();
    price=widget.dataList.price.toString();
    orientation=widget.dataList.orientation.toString();
    category=widget.dataList.category.toString().replaceAll('[','').replaceAll(']','').replaceAll(', ',',').replaceAll(' ','').replaceAll('"','');
    Extraland=widget.dataList.extraLand.toString();
    direct_itemcount=widget.dataList.itemCondition.toString();
    username=widget.dataList.user!.name.toString();
    usercontact=widget.dataList.user!.phone.toString();
    bedroom=widget.dataList.bedroom.toString();
    agency=widget.dataList.agencyName.toString();
    soldavailable_string=widget.dataList.purchaseStatus.toString();
print(",,,,,,,,,,,,,,widget.dataList.category.toString(),,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,${widget.dataList.category.toString().replaceAll('[','').replaceAll(']','').replaceAll(', ',',').replaceAll(' ','').replaceAll('"','')}");
    if(widget.dataList.itemStatus=='flat'){

      flatdetailstextfield=true;

    }
    else{
      flatdetailstextfield=false;

    }

    if(widget.dataList.itemStatus=='flat'||widget.dataList.itemStatus=='shop'){

      streettextfield=false;

    }
    else{
      streettextfield=true;

    }
    print(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,${widget.dataList.floorNo}");

    if (widget.dataList.purchaseStatus == 'pending') {
      Tremcondition_radio = 1;

    }
    else {
      Tremcondition_radio = 2;

    }
    print(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,rent sale,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,${widget.dataList.property}");
    if (widget.dataList.property == 'rent') {
      rentsale_radio = 0;

    }
    else {
      rentsale_radio = 1;

    }

    priceconverter = k_m_b_generator(int.parse(
        widget.dataList.price.toString().replaceAll(
            RegExp(regex, unicode: true), '')));

    if (int.parse(widget.dataList.price.toString().replaceAll(
        RegExp(regex, unicode: true), '')) ==
        0) {
      priceconverter = '0';
    }

    setState(() {});




    super.initState();
  }
 @override
  Widget build(BuildContext context) {
   if(initialcall==true) {


   }






   initialcall=false;



    return Scaffold(backgroundColor: Colors.grey.shade200,
      appBar: AppBar(elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: () {Get.back();  },),
        title: Center(
          child: Padding(
            padding:  EdgeInsets.only(top: 10.w),
            child: SizedBox(height: 90.h,width: 90.w,
                child: Image.asset('assets/images/logo.png',)),
          ),
        ),
        actions: [CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xffc01515),
          child: CircleAvatar(
            radius: 18,
            child:
            ClipOval(
              child: FadeInImage(
                image:NetworkImage("${widget.dataList.user!.imageUrl}"),
                placeholder: const AssetImage("assets/images/dummy.png"),
                imageErrorBuilder:(context, error, stackTrace) {
                  return Image.asset('assets/images/dummy.png',
                      fit: BoxFit.fitWidth
                  );
                },
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
          SizedBox(width: 15.w,)

        ],

        backgroundColor:Colors.white,
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Center(
                  child: Text(
                    'Update Inventory',
                    style: TextStyle(
                        color: AppColors().TextColorBlack,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  // height: 350.h,
                  // width: 329.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 329.w,
                        height: 100.h,
                        // color: AppColors().white,
                        decoration: BoxDecoration(
                            color: AppColors().white,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.only(left: 20.w, top: 5.h),
                                child: Text(
                                  'Property',
                                  style: TextStyle(
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                    child: RadioListTile(
                                        title: Text('Rent'),
                                        value: 0,
                                        groupValue: rentsale_radio,
                                        activeColor: Colors.black,
                                        onChanged: (val) {
                                          setState(() {
                                            rentsale_radio = val!;

                                            rentsale_string = "Rent";
                                            print(rentsale_string);
                                          });
                                        }),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                    child: RadioListTile(
                                      title: Text('Sale'),
                                      value: 1,
                                      groupValue: rentsale_radio,
                                      activeColor: Colors.black,
                                      onChanged: (val) {
                                        setState(() {
                                          rentsale_radio = val!;
                                          rentsale_string = "Sale";
                                          print(rentsale_string);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 329.w,
                        height: 100.h,
                        // color: AppColors().white,
                        decoration: BoxDecoration(
                            color: AppColors().white,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.only(left: 20.w, top: 5.h),
                                child: Text(
                                  'Property Status',
                                  style: TextStyle(
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 30.h,
                                    child: RadioListTile(
                                        title: Text('Available'),
                                        value: 1,
                                        groupValue: Tremcondition_radio,
                                        activeColor: Colors.black,
                                        onChanged: (val) {
                                          print(val);
                                          Tremcondition_radio = val!;
                                          soldavailable_string="pending";
                                          setState(() {});
                                        }),
                                  ),
                                  SizedBox(height: 30.h,
                                    child: RadioListTile(
                                        title: Text('Sold'),
                                        value: 2,
                                        groupValue: Tremcondition_radio,
                                        activeColor: Colors.black,
                                        onChanged: (val) {
                                          print(val);
                                          soldavailable_string="sold";
                                          Tremcondition_radio = val!;

                                          setState(() {});
                                        }),
                                  ),
                                ],
                              )
                            ]),
                      ),
/*
                      SizedBox(height: 10),
                      Container(
                        height: 88.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors().white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.only(left: 20.w, top: 5.h),
                                child: Text(
                                  "${Area} Phase",
                                  style: TextStyle(
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(width: 1),
                                borderRadius:
                                BorderRadius.circular(10
                                    .r), //border corner radius
                              ),

                                margin:  EdgeInsets.only(
                                    left: 40.w, top: 10.h),
                                width: 150.w,
                                height: 40.h,

                                child: Padding(
                                  padding:
                                  EdgeInsets.only(left: 10.w),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Text(Selectphase),
                                    underline: Container(),
                                    focusColor: Colors.grey.shade100,
                                    borderRadius:
                                    BorderRadius.circular(10.r),

                                    // value: dropdownValue,
                                    items: phases_id.map<
                                        DropdownMenuItem<String>>(
                                            (dynamic value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                            ),
                                          );
                                        }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        Selectphase = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ]),
                      ),*/
                      /*SizedBox(height: 10),
                      Container(
                        height: 170.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors().white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.only(left: 20.w, top: 5.h),
                                child: Text(
                                  'Status of item',
                                  style: TextStyle(
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Stack(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 30.h,
                                        child: RadioListTile(
                                            dense: true,
                                            title: Text('Plot',style: TextStyle(fontSize: 16.sp),),
                                            value: 1,
                                            groupValue: statusitem,
                                            activeColor: Colors.black,
                                            onChanged: (val) {
                                              statusitem = val!;
                                              streettextfield = true;
                                              propertynumber = "Plot";

                                              plotdropdown = true;
                                              setState(() {});
                                              print("Radio $val");
                                            }),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                        child: RadioListTile(
                                            title: Text('Flat'),
                                            value: 2,
                                            groupValue: statusitem,
                                            activeColor: Colors.black,
                                            onChanged: (val) {
                                              statusitem = val!;
                                              streettextfield = false;
                                              plotdropdown = false;
                                              propertynumber = "Flat";
                                              setState(() {});
                                              print("Radio $val");
                                            }),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                        child: RadioListTile(
                                            title: Text('Shop'),
                                            value: 3,
                                            groupValue: statusitem,
                                            activeColor: Colors.black,
                                            onChanged: (val) {
                                              setState(() {
                                                statusitem = val!;
                                                streettextfield = true;
                                                propertynumber = "Shop";
                                                plotdropdown = false;
                                              });
                                              print("Radio $val");
                                            }),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                        child: RadioListTile(
                                            title: Text('House'),
                                            value: 4,
                                            groupValue: statusitem,
                                            activeColor: Colors.black,
                                            onChanged: (val) {
                                              print("Radio $val");

                                              setState(() {
                                                statusitem = val!;
                                                propertynumber = "House";
                                                streettextfield = true;
                                                plotdropdown = false;
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    right: 20.w,
                                    child: plotdropdown
                                        ? Container(
                                      margin:
                                      EdgeInsets.only(top: 5.h),
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius:
                                        BorderRadius.circular(10
                                            .r), //border corner radius
                                      ),
                                      width: 130.w,
                                      height: 30.h,
                                      child:
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: plottype,
                                          icon: const Icon(Icons
                                              .keyboard_arrow_down),
                                          isExpanded: true,
                                          iconSize: 30,
                                          elevation: 10,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          onChanged:
                                              (String? newValue) {
                                            setState(() {
                                              plottype = newValue!;
                                            });
                                          },
                                          items: <String>[
                                            'residential',
                                            'commercial',
                                            'others'
                                          ].map<
                                              DropdownMenuItem<
                                                  String>>(
                                                  (String value) {
                                                return DropdownMenuItem<
                                                    String>(
                                                  value: value,
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsets
                                                        .only(
                                                        left: 9.w),
                                                    child: Text(
                                                      value,
                                                      style:  TextStyle(
                                                          fontSize: 12.sp,
                                                          letterSpacing:
                                                          0.9,
                                                          fontWeight:
                                                          FontWeight
                                                              .w300),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                        ),
                                      ),
                                    )
                                        : Container(),
                                  ),
                                ],
                              )
                            ]),
                      )*/
                    ],
                  ),
                ),

                //////////////////////////////////////////////////////////////////////////////////===
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 97.h,
                  decoration: BoxDecoration(
                      color: AppColors().white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: const Color(0xfff998f8f), width: 0.1)),
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("${propertynumber} Number",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 19.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Spacer()
                          ],
                        ),
                        TextFormField(
                          controller:TextEditingController(text: pfshnumber),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter ${propertynumber} Number';
                            }
                            return null;
                          },
                          // keyboardType: TextInputType.number,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          onChanged: (val) {
                            pfshnumber = val;
                          },
                          // controller: this._emailController,
                          decoration: new InputDecoration(
                            //  hintText: "Enter your Contact",
                            //labelText: "Email",
                            labelStyle: new TextStyle(
                              color: const Color(0xFF424242),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                streettextfield? SizedBox(height: 10):SizedBox(),
                streettextfield? Container(
                    width: double.infinity,
                    height: 97.h,
                    decoration: BoxDecoration(
                        color: AppColors().white,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: const Color(0xfff998f8f), width: 0.1)),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.w, right: 10.w, top: 5.h),
                        child: Column(children: [
                          Row(
                            children: [
                              Text("Street Number",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500),),
                              Spacer()
                            ],
                          ),
                          TextFormField(controller:TextEditingController(text: streetnumber),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                print("................................Please enter Street Number");
                                return 'Please enter Street Number';
                              }
                              return null;
                            },
                            autofillHints: <String>[AutofillHints.fullStreetAddress],
                            onChanged: (va) {
                              streetnumber = va;
                            },
                            // controller: this._emailController,
                            decoration: new InputDecoration(
                              //  hintText: "Enter your Contact",
                              //labelText: "Email",
                              labelStyle: new TextStyle(
                                color: const Color(0xFF424242),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ]))):SizedBox(),
//=================================================================================================================
                flatdetailstextfield? SizedBox(height: 10):SizedBox(),
                flatdetailstextfield? Container(
                    width: double.infinity,
                    height: 97.h,
                    decoration: BoxDecoration(
                        color: AppColors().white,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: const Color(0xfff998f8f), width: 0.1)),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.w, right: 10.w, top: 5.h),
                        child: Column(children: [
                          Row(
                            children: [
                              Text("Floor Number",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500),),
                              Spacer()
                            ],
                          ),
                          TextFormField(controller:TextEditingController(text: floornumber),
                            validator: (value) {
                              if (value == null || value.isEmpty) {

                                return 'Please enter Floor Number';

                              }
                              return null;
                            },
                            autofillHints: <String>[AutofillHints.fullStreetAddress],
                            onChanged: (va) {
                              floornumber = va;
                            },
                            // controller: this._emailController,
                            decoration: new InputDecoration(
                              //  hintText: "Enter your Contact",
                              //labelText: "Email",
                              labelStyle: new TextStyle(
                                color: const Color(0xFF424242),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ]))):SizedBox(),
                flatdetailstextfield? SizedBox(height: 10):SizedBox(),
                flatdetailstextfield? Container(
                    width: double.infinity,
                    height: 97.h,
                    decoration: BoxDecoration(
                        color: AppColors().white,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: const Color(0xfff998f8f), width: 0.1)),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.w, right: 10.w, top: 5.h),
                        child: Column(children: [
                          Row(
                            children: [
                              Text("Block Number",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500),),
                              Spacer()
                            ],
                          ),
                          TextFormField(controller:TextEditingController(text: blocknumber),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Block Number';
                              }
                              return null;
                            },
                            autofillHints: <String>[AutofillHints.fullStreetAddress],
                            onChanged: (va) {
                              blocknumber = va;
                            },
                            // controller: this._emailController,
                            decoration: new InputDecoration(
                              //  hintText: "Enter your Contact",
                              //labelText: "Email",
                              labelStyle: new TextStyle(
                                color: const Color(0xFF424242),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ]))):SizedBox(),
                flatdetailstextfield? SizedBox(height: 10):SizedBox(),
                flatdetailstextfield? Container(
                    width: double.infinity,
                    height: 97.h,
                    decoration: BoxDecoration(
                        color: AppColors().white,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: const Color(0xfff998f8f), width: 0.1)),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.w, right: 10.w, top: 5.h),
                        child: Column(children: [
                          Row(
                            children: [
                              Text("Building Name",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500),),
                              Spacer()
                            ],
                          ),
                          TextFormField(controller:TextEditingController(text: buildingname),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                print("................................Please enter Building Name");
                                return 'Please enter Building Name';
                              }
                              return null;
                            },
                            autofillHints: <String>[AutofillHints.fullStreetAddress],
                            onChanged: (va) {
                              buildingname = va;
                            },
                            // controller: this._emailController,
                            decoration: new InputDecoration(
                              //  hintText: "Enter your Contact",
                              //labelText: "Email",
                              labelStyle: new TextStyle(
                                color: const Color(0xFF424242),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ]))):SizedBox(),
                /////////////////////////////////////////////////////////////
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 97.h,
                  decoration: BoxDecoration(
                      color: AppColors().white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: const Color(0xfff998f8f), width: 0.1)),
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Sector",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 19.sp,
                                  fontWeight: FontWeight.w500),),
                            Spacer()
                          ],
                        ),
                        TextFormField(controller:TextEditingController(text: Sector),
                          autofillHints: <String>[AutofillHints.fullStreetAddress],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Sector Number';
                            }
                            return null;
                          },
                          textCapitalization: TextCapitalization.characters,
                          onChanged: (val) {
                            Sector = val;
                          },
                          // controller: this._emailController,
                          decoration: new InputDecoration(
                            //  hintText: "Enter your Contact",
                            //labelText: "Email",
                            labelStyle: new TextStyle(
                              color: const Color(0xFF424242),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /////////////////////////////////////////////////////////////
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 97.h,
                  decoration: BoxDecoration(
                      color: AppColors().white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: const Color(0xfff998f8f), width: 0.1)),
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Size (Marla)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 19.sp,
                                  fontWeight: FontWeight.w500),),
                            Spacer()
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 50.h,
                              width: 217.w,
                              child: TextFormField(controller:TextEditingController(text: size),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Property Size';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (va) {
                                  size = va;
                                },
                                // controller: this._emailController,
                                decoration: new InputDecoration(
                                  //  hintText: "Enter your Contact",
                                  //labelText: "Email",
                                  labelStyle: new TextStyle(
                                    color: const Color(0xFF424242),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(
                                    10.r), //border corner radius
                              ),
                              height: 30.h,
                              width: 90.w,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: sizetype,
                                  icon:
                                  const Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  iconSize: 30,
                                  elevation: 10,
                                  style:
                                  const TextStyle(color: Colors.black),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      sizetype = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'marla',
                                    'kanal','sqft'

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
                                                  fontSize: 12.sp,
                                                  letterSpacing: 0.9,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ///////////////////////////////////////////////////////////////////
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 115.h,
                  decoration: BoxDecoration(
                      color: AppColors().white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: const Color(0xfff998f8f), width: 0.1)),
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Price/Demand",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 19.sp,
                                  fontWeight: FontWeight.w500),),
                            Spacer()
                          ],
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Property Price';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            ThousandsFormatter(),
                          ],

                          onChanged: (va) {
                            price = va;

                            priceconverter = k_m_b_generator(int.parse(
                                va.replaceAll(
                                    RegExp(regex, unicode: true), '')));

                            if (int.parse(va.replaceAll(
                                RegExp(regex, unicode: true), '')) ==
                                0) {
                              priceconverter = '0';
                            }
                            setState(() {
                            });
                          },
                          controller: pricecontroller,
                          decoration: InputDecoration(
                            hintText: 'Enter a message',
                            suffixIcon: IconButton(
                              onPressed: () {
                                priceconverter = '0';
                                pricecontroller.clear();
                                setState(() {});
                              },
                              icon: Icon(Icons.clear),
                            ),
                          ),

                          keyboardType: TextInputType.number,
                          // Only numbers can be entered
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Text(
                              '$priceconverter',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 20.w,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ///////////////////////////////////////////////////////////////////
              /*  SizedBox(height: 10),
                Container(
                  height: 190.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors().white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 20.w, top: 5.h),
                          child: Text(
                            'Orientation',
                            style: TextStyle(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 30.h,
                              child: RadioListTile(
                                  title: Text('North Face'),
                                  value: 1,
                                  groupValue: orientationradio,
                                  activeColor: Colors.black,
                                  onChanged: (val) {
                                    setState(() {
                                      orientationradio = val!;
                                      orientation = 'North';
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: RadioListTile(
                                  title: Text('South Face'),
                                  value: 2,
                                  groupValue: orientationradio,
                                  activeColor: Colors.black,
                                  onChanged: (val) {
                                    setState(() {
                                      orientationradio = val!;
                                      orientation = 'South';
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: RadioListTile(
                                  title: Text('East Face'),
                                  value: 3,
                                  groupValue: orientationradio,
                                  activeColor: Colors.black,
                                  onChanged: (val) {
                                    setState(() {
                                      orientationradio = val!;
                                      orientation = 'East';
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: RadioListTile(
                                  title: Text('West Face'),
                                  value: 4,
                                  groupValue: orientationradio,
                                  activeColor: Colors.black,
                                  onChanged: (val) {
                                    setState(() {
                                      orientationradio = val!;
                                      orientation = 'West';
                                    });
                                  }),
                            ),

                          ],
                        )
                      ]),
                ),
                SizedBox(height: 10),
                Container(
                  height: 210.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors().white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 20.w, top: 5.h),
                          child: Text(
                            'Category',
                            style: TextStyle(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Column(
                          children: List.generate(
                            categorylist.length,
                                (index) => SizedBox(
                              height: 33.h,
                              child: CheckboxListTile(
                                controlAffinity:
                                ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                title: Text(
                                  categorylist[index]["title"],
                                  style:  TextStyle(
                                    fontSize: 16.0.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                value: categorylist[index]["value"],
                                onChanged: (value) {
                                  setState(() {
                                    categorylist[index]["value"] = value;
                                    if (multipleSelected
                                        .contains(categorylist[index])) {
                                      multipleSelected
                                          .remove(categorylist[index]);
                                    } else {
                                      multipleSelected.add(
                                          categorylist[index]["title"]);
                                    }
                                  });
                                  print('>>>>${multipleSelected}');
                                },
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),*/
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 87.h,
                  decoration: BoxDecoration(
                      color: AppColors().white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: const Color(0xfff998f8f), width: 0.1)),
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Extra Land (If Any)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 19.sp,
                                  fontWeight: FontWeight.w500),),
                            Spacer()
                          ],
                        ),
                        TextField(
                          onChanged: (val) {
                            Extraland = val;
                          },
                          controller: extraland,
                          // controller: this._emailController,
                          decoration: new InputDecoration(
                            hintText: "Mention extra Land (If Any)",
                            //labelText: "Email",
                            labelStyle: new TextStyle(
                              color: const Color(0xFF424242),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              /*  SizedBox(height: 10),
                Container(
                  height: 190.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors().white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 20.w, top: 5.h),
                          child: Text(
                            'Item Condition',
                            style: TextStyle(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 30.h,
                              child: RadioListTile(
                                  title: Text('Direct Client'),
                                  value: 1,
                                  groupValue: Tremcondition_radio,
                                  activeColor: Colors.black,
                                  onChanged: (val) {
                                    itemtextfield = false;
                                    Tremcondition_radio = val!;
                                    direct_itemcount = "Direct Client";
                                    setState(() {});
                                  }),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: RadioListTile(
                                  title: Text('Direct Dealer'),
                                  value: 2,
                                  groupValue: Tremcondition_radio,
                                  activeColor: Colors.black,
                                  onChanged: (val) {
                                    Tremcondition_radio = val!;
                                    itemtextfield = true;
                                    direct_itemcount = "Direct Dealer";
                                    setState(() {});
                                  }),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: RadioListTile(
                                  title: Text('One Down Dealer'),
                                  value: 4,
                                  groupValue: Tremcondition_radio,
                                  activeColor: Colors.black,
                                  onChanged: (val) {
                                    Tremcondition_radio = val!;
                                    itemtextfield = true;
                                    direct_itemcount = "One Down Dealer";
                                    setState(() {});
                                  }),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: RadioListTile(
                                  title: Text('Other Dealers'),
                                  value: 5,
                                  groupValue: Tremcondition_radio,
                                  activeColor: Colors.black,
                                  onChanged: (val) {
                                    Tremcondition_radio = val!;
                                    itemtextfield = true;
                                    direct_itemcount = 'Other';
                                    setState(() {});
                                  }),
                            ),
                          ],
                        ),
                      ]),
                ),*/
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 97.h,
                  decoration: BoxDecoration(
                      color: AppColors().white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: const Color(0xfff998f8f), width: 0.1)),
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("${direct_itemcount} Name",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,fontSize: 19.sp,
                                  fontWeight: FontWeight.w500),),
                            Spacer()
                          ],
                        ),
                        TextFormField(controller:TextEditingController(text: username),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter ${direct_itemcount} Name';
                            }
                            return null;
                          },
                          autofillHints: <String>[AutofillHints.name],
                          onChanged: (val) {
                            username = val;
                          },
                          // controller: this._emailController,
                          decoration: new InputDecoration(

                            //labelText: "Email",
                            labelStyle: new TextStyle(
                              color: const Color(0xFF424242),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 122.h,
                  decoration: BoxDecoration(
                      color: AppColors().white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: const Color(0xfff998f8f), width: 0.1)),
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("${direct_itemcount} Mobile",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 19.sp,
                                  fontWeight: FontWeight.w500),),
                            Spacer()
                          ],
                        ),
                        TextField(
                          controller: _contactTextController,

                          onChanged: (val) {
                            usercontact
                            = val;
                          }, autofillHints: <String>[AutofillHints.telephoneNumber],
                          // controller: this._emailController,
                          decoration: new InputDecoration(suffix: IconButton(onPressed:() async {
                            await _requestPermission();
                            final Contact? contact = await ContactsService.openDeviceContactPicker();
                            if (contact != null) {
                              print("......................${contact.phones?.first.value}${contact.androidAccountTypeRaw} ${contact.displayName}");
                              _contactTextController.text = '${contact.phones?.first.value}';
                              usercontact='${contact.phones?.first.value}';

                            }
                          }, icon: Icon(Icons.contact_phone,color: Colors.black,),),
                            //  hintText: "Enter your Contact",
                            //labelText: "Email",
                            labelStyle: new TextStyle(
                              color: const Color(0xFF424242),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),



                SizedBox(
                  height: 20.h,
                ),

                GestureDetector(
                    onTap: () {
                      print("================resppppp======");
                      if (_formKey.currentState!.validate()) {

                        print("============%%%%%%%%%%==============${ username} @${agency},@ ${direct_itemcount},@ ${Sector}, @${Sector}, @${streetnumber}, @${Contact},@${category.toString()} ,@ ${sizetype},@${Selectphase} ,@${plottype} ,@ ${propertynumber.toLowerCase()},@${soldavailable_string} ,@ ${price}, @${size},@${Extraland} ,@ ${pfshnumber},@${area_id},@${rentsale_string},@${ floornumber},@${buildingname},@${blocknumber}");



                          print("================resppppp======");
                          setState((){
                            apiCall=true;
                            if(apiCall==true){
                              indicator(context);
                            }
                          });
                          _callWeatherApi();














                        // getApiData();

                        print("=======================");
                      }
                      else{ Get.snackbar(
                        "Error",
                        "Fill All Fields",
                        dismissDirection: DismissDirection.horizontal,
                        isDismissible: true,
                        backgroundColor: MyAppColors.yellowcolor,
                        duration: Duration(seconds: 2),
                        icon: Icon(Icons.error_outline, color: Colors.red),
                      );}
                      // enterInventoryFormService.NewInventorySubmitForm( username, aname, direct_itemcount, orientation, Sector, streetnumber, Contact, categorycheck, sizetype, Selectphase, Area, plottype, propertytypeString, "Pending", priceconverter, size, Extraland, pfshnumber);
                      //   enterInventoryFormService.NewInventorySubmitForm(client_name, agency_name, item_condition, orientation, sector, street_number, client_mobile, category, size_unit, area_phase_id, area_id, plot_type, property_type, status, price, size, extras, plot_number)
                    },
                    child: Container(
                      height: 49.h,
                      decoration: BoxDecoration(
                        color: AppColors().btngradient,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13.sp,
                              color: AppColors().white,
                            ),
                          )),
                    )),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      )




    );
  }



///================================================================================================================

  Future<void> _requestPermission() async {
    final permissionStatus = await Permission.contacts.request();
    if (permissionStatus != PermissionStatus.granted) {
      throw Exception('Permission not granted');
    }
  }
  String k_m_b_generator(num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(2)} Thousand";
    } else if (num > 99999 && num < 9999999) {
      return "${(num / 100000).toStringAsFixed(2)} Lakh";
    }
    else if (num > 9999999 && num < 999999999) {
      return "${(num / 10000000).toStringAsFixed(2)} Crore";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(2)} Arab";
    } else {
      return num.toString();
    }
  }
  bool apiCall = false;
  Future<void> _callWeatherApi() async {
    var api =  await   updateservice.UpdateInventory(
      widget.dataList.id!,
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
        bedroom);
    print("========***********====${api}");
    if(api==true) {
      apiCall= false;
      setState(() {});
      Get.offAll(Bottom_bar(selectedIndex: 0));
    } else {
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
          child: GlowingProgressIndicator(
              child: SvgPicture.asset('assets/images/logo2.svg',height: 100.h,width: 100.w,color: Colors.red,)
          ),
        );
      },
    );
  }




}
