import 'package:asasa_estate/AppLayer/Streaming/Observer.dart';
import 'package:asasa_estate/AppLayer/Streaming/Provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:rxdart/rxdart.dart';
import '../../AppLayer/Streaming/appColors.dart';
import '../../Widgets/AppBar.dart';
import '../../Widgets/Drawer.dart';
import '../Affilated_dealers/Affilated_dealerModel.dart';
import '../New_Inventory/Area/AreaModel.dart';
import 'completeInventoryManager.dart';
import 'completeInventoryModel.dart';
import 'completeInventoryModel.dart' as modeldata;

class Complete_inventory extends StatefulWidget {
  Complete_inventory({Key? key}) : super(key: key);

  @override
  State<Complete_inventory> createState() => _Complete_inventoryState();
}

class _Complete_inventoryState extends State<Complete_inventory> {
  int dhacounter = 0;
  int bhariacunter = 0;
  int cdacounter = 0;
  int gulbrgcounter = 0;

  String area_dv = 'All';
  String? sector_dv ;
  String phase_dv = 'All';
  String size_dv = 'All';
  List<modeldata.Data> showlist = List.empty(growable: true) ;
  List<modeldata.Data> copylist = List.empty(growable: true) ;
  //final List<int> shades = [100, 200, 300, 400, 500, 600, 700, 800, 900];
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  bool call=true;
  bool AreafilterData=false;
  bool PhasefilterData=false;
  bool SectorfilterData=false;
  bool SizefilterData=false;
  String filtererror="";
  List sector_id = [];
  // @override
  // void initState() {
  //   print("======init=================");
  //   super.initState();
  // }
  final TextEditingController phaseController = TextEditingController();
  final TextEditingController SizeController = TextEditingController();
  final TextEditingController AreaController = TextEditingController();
  final TextEditingController SectorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CompleteInventoryManager completeInventoryManager =
    Provider.of(context).fetch(CompleteInventoryManager);
    //showlist==[];


    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: Customappbar()),
      drawer: Drawer_d(),
      // This will help manage the SliverAppBar and ListView
      body: Observer<List<CompleteInventroyModel>>(
        stream:call? completeInventoryManager.mainList:Stream.empty(),
        onSuccess: (context, snapshot) {
          List<CompleteInventroyModel> screendata1 =List.from(snapshot) ;

          List<modeldata.Data> screendata0 = screendata1[0].data!;



          List<modeldata.Data> screendata = List.empty(growable: true) ;





          for (int i = 0; i < screendata0.length; i++) {
if (screendata0[i].purchaseStatus !="sold") {
              screendata.add(screendata0[i]);
            }
          }

          call=false;
          if(AreafilterData == true && PhasefilterData == true&&SectorfilterData == true &&SizefilterData == true){
            print(
                "============area! phase! size sector!====================");

            if(phase_dv=="All"&&sector_dv=="All"&&size_dv=="All"&&area_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";










            }
            else {

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for (int i = 0; i < screendata.length; i++) {
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {
                if (showlist[i].area! != null) {
                  if (showlist[i].area!.name!.contains(area_dv) &&
                      showlist[i].areaPhaseId
!.contains(phase_dv) &&
                      showlist[i].sector==sector_dv! &&
                      showlist[i].size==size_dv.replaceAll(' ', '').replaceAll('Marla', '').replaceAll('Kanal', '')&&
                      showlist[i].sizeUnit==size_dv.replaceAll(' ', '').replaceAll(RegExp('[0-9]'),'').toLowerCase()


                  ) {
                    makingData.add(showlist[i]);
                  }
                }
              }


              filtererror = "";
              showlist.clear();
              showlist = makingData;
              for (int i = 0; i < showlist.length; i++) {
                print(".AAAALLLLL..${i}");
              }
            }
          }
          else if(AreafilterData == true && PhasefilterData == true&&SectorfilterData == true ){
            print(
                "============area! phase! sector! =====================");
            if(phase_dv=="All"&&sector_dv=="All"&&area_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";










            }
            else {

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for (int i = 0; i < screendata.length; i++) {
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {
                if (showlist[i].area! != null) {
                  if (showlist[i].area!.name!.contains(area_dv) &&
                      showlist[i].areaPhaseId
!.contains(phase_dv) &&
                      showlist[i].sector==sector_dv!
                  ) {
                    makingData.add(showlist[i]);
                  }
                }
              }


              filtererror = "";
              showlist.clear();
              showlist = makingData;
              for (int i = 0; i < showlist.length; i++) {
                print(".AAAALLLLL..${i}");
              }
            }
          }
          else if(AreafilterData == true && PhasefilterData == true&&SizefilterData == true){
            print(
                "============area! phase! size =====================");
            if(phase_dv=="All"&&size_dv=="All"&&area_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";
            }
            else {


              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for (int i = 0; i < screendata.length; i++) {
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {
                if (showlist[i].area! != null) {
                  if (showlist[i].area!.name!.contains(area_dv) &&
                      showlist[i].areaPhaseId
!.contains(phase_dv) &&
                      // showlist[i].sector==sector_dv! &&
                      showlist[i].size==size_dv.replaceAll(' ', '').replaceAll('Marla', '').replaceAll('Kanal', '')&&
                      showlist[i].sizeUnit==size_dv.replaceAll(' ', '').replaceAll(RegExp('[0-9]'),'').toLowerCase()
                  ) {
                    makingData.add(showlist[i]);
                  }
                }
              }


              filtererror = "";
              showlist.clear();
              showlist = makingData;

            }
          }
          else if( PhasefilterData == true&&SectorfilterData == true &&SizefilterData == true){
            print(
                "============sector! phase! size =====================");
            if(phase_dv=="All"&&sector_dv=="All"&&size_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";










            }
            else {


              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for (int i = 0; i < screendata.length; i++) {
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {
                if (showlist[i].area! != null) {
                  if (//showlist[i].area!.name!.contains(area_dv) &&
                  showlist[i].areaPhaseId
==phase_dv&&
                      showlist[i].sector==sector_dv! &&
                      showlist[i].size==size_dv.replaceAll(' ', '').replaceAll('Marla', '').replaceAll('Kanal', '')&&
                      showlist[i].sizeUnit==size_dv.replaceAll(' ', '').replaceAll(RegExp('[0-9]'),'').toLowerCase()
                  ) {
                    makingData.add(showlist[i]);
                  }
                }
              }


              filtererror = "";
              showlist.clear();
              showlist = makingData;
              for (int i = 0; i < showlist.length; i++) {
                print(".AAAALLLLL..${i}");
              }
            }
          }
          //=============================================================================================================
          else if(AreafilterData == true && PhasefilterData == true){
            print(
                "============area! phase!  =====================");
            if(phase_dv=="All"&&area_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";










            }
            else {

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for (int i = 0; i < screendata.length; i++) {
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {
                if (showlist[i].area! != null) {
                  if (showlist[i].area!.name!.contains(area_dv) &&
                      showlist[i].areaPhaseId
==phase_dv
                  ) {makingData.add(showlist[i]);
                  }
                }
              }


              filtererror = "";
              showlist.clear();
              showlist = makingData;
              for (int i = 0; i < showlist.length; i++) {
                print(".AAAALLLLL..${i}");
              }
            }
          }
          else if(AreafilterData == true &&SectorfilterData == true ){
            print(
                "============area! sector! =====================");
            if(sector_dv=="All"&&area_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";










            }
            else {

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for (int i = 0; i < screendata.length; i++) {
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {
                if (showlist[i].area! != null) {
                  if (showlist[i].area!.name!.contains(area_dv) &&
                      // showlist[i].phase!.title!.contains(phase_dv) &&
                      showlist[i].sector==sector_dv! ) {
                    makingData.add(showlist[i]);
                  }
                }
              }


              filtererror = "";
              showlist.clear();
              showlist = makingData;
              for (int i = 0; i < showlist.length; i++) {
                print(".AAAALLLLL..${i}");
              }
            }
          }
          else if(AreafilterData == true &&SizefilterData == true){
            print(
                "============area!  size =====================");
            if(size_dv=="All"&&area_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";










            }
            else {

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for (int i = 0; i < screendata.length; i++) {
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {
                if (showlist[i].area! != null) {
                  if (showlist[i].area!.name!.contains(area_dv) &&
                      showlist[i].size==size_dv.replaceAll(' ', '').replaceAll('Marla', '').replaceAll('Kanal', '')&&
                      showlist[i].sizeUnit==size_dv.replaceAll(' ', '').replaceAll(RegExp('[0-9]'),'').toLowerCase()
                  ) {
                    makingData.add(showlist[i]);
                  }
                }
              }


              filtererror = "";
              showlist.clear();
              showlist = makingData;
              for (int i = 0; i < showlist.length; i++) {
                print(".AAAALLLLL..${i}");
              }
            }
          }
          else if( PhasefilterData == true&&SectorfilterData == true ){
            print(
                "============ phase! sector! =====================");
            if(phase_dv=="All"&&sector_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";










            }
            else {

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for (int i = 0; i < screendata.length; i++) {
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {
                if (showlist[i].area! != null) {
                  if (
                  showlist[i].sector==sector_dv!) {
                    makingData.add(showlist[i]);
                  }
                }
              }


              filtererror = "";
              showlist.clear();
              showlist = makingData;
              for (int i = 0; i < showlist.length; i++) {
                print(".AAAALLLLL..${i}");
              }
            }
          }
          else if(PhasefilterData == true&&SizefilterData == true){
            print(
                "============ phase! size =====================");
            if(phase_dv=="All"&&size_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";










            }
            else {
              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for (int i = 0; i < screendata.length; i++) {
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {
                if (showlist[i].area! != null) {
                  if (//showlist[i].area!.name!.contains(area_dv) &&
                  showlist[i].areaPhaseId
 ==phase_dv &&
                      //showlist[i].sector==sector_dv! &&
                      showlist[i].size==size_dv.replaceAll(' ', '').replaceAll('Marla', '').replaceAll('Kanal', '')&&
                      showlist[i].sizeUnit==size_dv.replaceAll(' ', '').replaceAll(RegExp('[0-9]'),'').toLowerCase()
                  ) {
                    makingData.add(showlist[i]);
                  }
                }
              }


              filtererror = "";
              showlist.clear();
              showlist = makingData;
              for (int i = 0; i < showlist.length; i++) {
                print(".AAAALLLLL..${i}");
              }
            }
          }
          else if(SectorfilterData == true &&SizefilterData == true){
            print(
                "============sector! size =====================");
            if(sector_dv=="All"&&size_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";










            }
            else {

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for (int i = 0; i < screendata.length; i++) {
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {
                if (showlist[i].area! != null) {
                  if (//showlist[i].area!.name!.contains(area_dv) &&
                  //showlist[i].phase!.title!.contains(phase_dv) &&
                  showlist[i].sector==sector_dv! &&
                      showlist[i].size==size_dv.replaceAll(' ', '').replaceAll('Marla', '').replaceAll('Kanal', '')&&
                      showlist[i].sizeUnit==size_dv.replaceAll(' ', '').replaceAll(RegExp('[0-9]'),'').toLowerCase()) {
                    makingData.add(showlist[i]);
                  }
                }
              }


              filtererror = "";
              showlist.clear();
              showlist = makingData;
              for (int i = 0; i < showlist.length; i++) {
                print(".AAAALLLLL..${i}");
              }
            }
          }

          //==============================================================================

          //===============================================================================

          //=========================================================================================================
          else if(AreafilterData == true){

            print(
                "============area!  =====================");
            if(area_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";










            }

            else {
              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for (int i = 0; i < screendata.length; i++) {
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {
                if (showlist[i].area! != null) {
                  if (showlist[i].area!.name!.contains(area_dv)) {
                    makingData.add(showlist[i]);
                  }
                }
              }
              filtererror = "";
              showlist.clear();
              showlist = makingData;
              for (int i = 0; i < showlist.length; i++) {
                print("...${i}");
              }
            }
          }
          else if(PhasefilterData == true){
            print(
                "============ phase!  =====================");
            if(phase_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";










            }
            else{
              print("=======Phase condition ==========inside if condition======================");
              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {

                if(showlist[i].area!!=null) {
                  if (showlist[i].areaPhaseId
==phase_dv) {
                    makingData.add(showlist[i]);
                  }
                }
              }
              filtererror="";
              showlist.clear();
              showlist =makingData;
              for (int i = 0; i < showlist.length; i++) {

                print("...${i}");}
            }


          }
          else if(SectorfilterData == true){
            print(
                "============ sector! =====================");
            if(sector_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";










            }
            else{
              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {

                if(showlist[i].area!!=null) {
                  if (showlist[i].sector==sector_dv!) {
                    makingData.add(showlist[i]);
                  }
                }
              }
              filtererror="";
              showlist.clear();
              showlist =makingData;
              for (int i = 0; i < showlist.length; i++) {

                print("...${i}");
              }


            }}
          else if(SizefilterData == true){
            print(
                "============  size =====================");
            if(size_dv=="All"){

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for(int i=0;i<screendata.length;i++){
                showlist.add(screendata[i]);
              }

              filtererror="";

            }
            else {
              print(
                  "======Size filter===========inside if condition======================");

              List<modeldata.Data> makingData = List.empty(growable: true);
              showlist.clear();
              for (int i = 0; i < screendata.length; i++) {
                showlist.add(screendata[i]);
              }
              for (int i = 0; i < showlist.length; i++) {
                if (showlist[i].area! != null) {
                  if (showlist[i].size==size_dv.replaceAll(' ', '').replaceAll('Marla', '').replaceAll('Kanal', '')&&
                      showlist[i].sizeUnit==size_dv.replaceAll(' ', '').replaceAll(RegExp('[0-9]'),'').toLowerCase()) {
                    makingData.add(showlist[i]);
                  }
                }
              }
              filtererror = "";
              showlist.clear();
              showlist = makingData;
              for (int i = 0; i < showlist.length; i++) {
                print("SIZE ))))..${i}");
              }
            }
          }
          if(AreafilterData == false && PhasefilterData == false&&SectorfilterData == false &&SizefilterData == false){
            showlist.clear();
            for(int i=0;i<screendata.length;i++){
              showlist.add(screendata[i]);
            } }




          //==============================================================================================================
          //==============================================================================================================
          //==============================================================================================================
          //==============================================================================================================
          //==============================================================================================================
          //==============================================================================================================
          //==============================================================================================================
          //==============================================================================================================
          //==============================================================================================================
          //==============================================================================================================
          //==============================================================================================================
          //==============================================================================================================
          return NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              dhacounter = 0;
              cdacounter = 0;
              bhariacunter = 0;
              gulbrgcounter = 0;
              sector_id.clear();
              sector_id.add("All");
              for (int i = 0; i < screendata.length; i++) {

                bool found = false;
                if(area_dv==screendata[i].area!.name){
                  print("=arean name ${area_dv}==%%%%%%%%%%%%${screendata[i].area?.name}");
                  for (int k = 0; k < sector_id.length; k++) {
                    if (sector_id[k] == screendata[i].sector) {
                      found = true;
                      break;
                    }
                  }
                  if (!found) {
                    sector_id.add(screendata[i].sector);
                  }
                }
                else if(area_dv=="All"){ print("=else all ==${area_dv}%%%%%%%%%%%%${screendata[i].area!.name}");
                for (int k = 0; k < sector_id.length; k++) {
                  if (sector_id[k] == screendata[i].sector) {
                    found = true;
                    break;
                  }
                }
                if (!found) {
                  sector_id.add(screendata[i].sector);
                }}

     ///=============================================================================================


                if (screendata[i].area!?.name!.toString() == "DHA") {
                  dhacounter = dhacounter + 1;
                } else if (screendata[i].area!?.name!.toString() ==
                    "CDA") {
                  cdacounter = cdacounter + 1;
                } else if (screendata[i].area!?.name!.toString() ==
                    "Bahria") {
                  bhariacunter = bhariacunter + 1;
                } else if (screendata[i].area!?.name!.toString() ==
                    "Gulberg") {
                  gulbrgcounter = gulbrgcounter + 1;
                }
              }
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        Container(
                          height: 130.h,
                          color: Colors.grey.shade300,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Text("Complete Inventory",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 24.sp)),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 45.h,
                                      width: 75.w,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.2), //color of shadow
                                              spreadRadius: 1, //spread radius
                                              blurRadius: 7, // blur radius
                                              offset: Offset(0,
                                                  5), // changes position of shadow
                                              //first paramerter of offset is left-right
                                              //second parameter is top to down
                                            ),
                                            //you can set more BoxShadow() here
                                          ],
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                          BorderRadius.circular(7),
                                          border: Border.all(
                                              color: const Color(0xfff998f8f),
                                              width: 0.4)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text("${dhacounter}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey,
                                                    fontSize: 15.sp)),
                                            Text("DHA",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14.sp,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 45.h,
                                      width: 75.w,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.2), //color of shadow
                                              spreadRadius: 1, //spread radius
                                              blurRadius: 7, // blur radius
                                              offset: Offset(0,
                                                  5), // changes position of shadow
                                              //first paramerter of offset is left-right
                                              //second parameter is top to down
                                            ),
                                            //you can set more BoxShadow() here
                                          ],
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                          BorderRadius.circular(7),
                                          border: Border.all(
                                              color: const Color(0xfff998f8f),
                                              width: 0.4)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text("${bhariacunter}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey,
                                                    fontSize: 15.sp)),
                                            Text("Bahria",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14.sp,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 45.h,
                                      width: 75.w,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.2), //color of shadow
                                              spreadRadius: 1, //spread radius
                                              blurRadius: 7, // blur radius
                                              offset: Offset(0,
                                                  5), // changes position of shadow
                                              //first paramerter of offset is left-right
                                              //second parameter is top to down
                                            ),
                                            //you can set more BoxShadow() here
                                          ],
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                          BorderRadius.circular(7),
                                          border: Border.all(
                                              color: const Color(0xfff998f8f),
                                              width: 0.4)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text("${cdacounter}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey,
                                                    fontSize: 15.sp)),
                                            Text("CDA",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14.sp,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 45.h,
                                      width: 75.w,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.2), //color of shadow
                                              spreadRadius: 1, //spread radius
                                              blurRadius: 7, // blur radius
                                              offset: Offset(0,
                                                  5), // changes position of shadow
                                              //first paramerter of offset is left-right
                                              //second parameter is top to down
                                            ),
                                            //you can set more BoxShadow() here
                                          ],
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                          BorderRadius.circular(7),
                                          border: Border.all(
                                              color: const Color(0xfff998f8f),
                                              width: 0.4)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text("${gulbrgcounter}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey,
                                                    fontSize: 15.sp)),
                                            Text("Gulberg",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14.sp,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*Material(
                      elevation: 2.0,

                      child: TextFormField(
                        obscureText: false,
                        autofocus: false,
                        decoration: InputDecoration(
                            suffixIcon:Icon(Icons.filter_alt_sharp),
                            hintText: 'Search',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(5.0),
                                borderSide: BorderSide(color: Colors.white, width: 3.0))
                        ),
                      ),
                    ),*/
                        Padding(
                          padding: EdgeInsets.symmetric(
                               vertical: 10.h),
                          child: Container(width: double.maxFinite,height: 70.h,
                            child: SingleChildScrollView(scrollDirection:Axis.horizontal ,
                              child: Row(

                                children: [
                                  Container(
                                    width: 120.w,
                                    height: 52.h,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'Area',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(3.0),
                                        ),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2<String>(


                                          searchController: AreaController,

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
                                              controller: AreaController,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding: const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 8,
                                                ),
                                                hintText: 'Search...',
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
                                          //This to clear the search value when you close the menu
                                          onMenuStateChange: (isOpen) {
                                            if (!isOpen) {
                                              AreaController.clear();
                                            }
                                          },





                                          //buttonElevation: 2,
                                          itemHeight: 40.h,
                                          itemPadding:  EdgeInsets.only(left: 14.w, right: 14.w),
                                          dropdownMaxHeight: 200.h,
                                          //dropdownWidth: 200,
                                          dropdownElevation: 8,
                                          scrollbarRadius:  Radius.circular(40.r),
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          offset: const Offset(0, 0),
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          value: area_dv,

                                          icon: const Icon(Icons.arrow_drop_down),
                                          isExpanded: true,
                                          iconSize: 30,
                                          style: const TextStyle(color: Colors.black),
                                          onChanged: (String? newValue) {
                                            if(newValue=="All"){  AreafilterData = false;}else{  AreafilterData = true;}

                                            area_dv = newValue!;
                                            print("vvvvvvvvvvvvvv${newValue}");


                                            sector_dv = 'All';
                                            phase_dv = 'All';
                                            size_dv = 'All';
                                            PhasefilterData=false;
                                            SectorfilterData=false;
                                            SizefilterData=false;
                                            setState(() {});

                                            // showlist.clear();

                                            //showlist= List.from(screendata.where((data) =>(data.data.map((e) => e.area!.name!).contains("DHA"))) .toList());

                                            print(
                                                "fffffffffffffffffffff${showlist}");

                                            //

                                            // //  users.users = _users;

                                            //showlist=data[index].data[index].area!.name!.where((element) => element.contains(newValue)).toList();
                                            //showlist[index].data[index].area!.name!.toString(),
                                            //  showlist=  showlist.where((map)=>map.data.contains(["Area"])).toList();

                                            // for(int i=0;i<data.length;i++){
                                            //   showlist=data[i].data[i].area!.name!.contains(newValue);//.where((map)=>map["name!"].contains(newValue)).toList();
                                            // }
                                            //showlist.clear();
                                            //showlist=List.from(screendata.where((data) =>(data.data.map((e) => e.area!.name!).contains('DHA'))));
                                          },
                                          items: <String>[
                                            'All',
                                            'DHA',
                                            'Bahria',
                                            'CDA',
                                            'Gulberg'


                                          ].map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(

                                              value: value,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 9),
                                                child: Text(
                                                  value,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      letterSpacing: 0.9,
                                                      fontWeight: FontWeight.w300),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),

                                    ),
                                  ),
                                  Container(
                                    width: 120.w,
                                    height: 52.h,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'Phase',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(3.0),
                                        ),
                                      ),
                                      child:
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2<String>(

                                          searchController: phaseController,

                                          searchInnerWidget: Container(
                                            height: 50,
                                            padding: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 4,
                                              right: 8,
                                              left: 8,
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter.digitsOnly
                                              ],
                                              expands: true,
                                              maxLines: null,
                                              controller: phaseController,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding: const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 8,
                                                ),
                                                hintText: 'Search...',
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
                                          //This to clear the search value when you close the menu
                                          onMenuStateChange: (isOpen) {
                                            if (!isOpen) {
                                              phaseController.clear();
                                            }
                                          },

                                          //buttonElevation: 2,
                                          itemHeight: 40.h,
                                          itemPadding:  EdgeInsets.only(left: 14.w, right: 14.w),
                                          dropdownMaxHeight: 200.h,
                                          //dropdownWidth: 200,
                                          dropdownElevation: 8,
                                          scrollbarRadius:  Radius.circular(40.r),
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          offset: const Offset(0, 0),
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          value: phase_dv,

                                          icon: const Icon(Icons.arrow_drop_down),
                                          isExpanded: true,
                                          iconSize: 30,

                                          style: const TextStyle(color: Colors.black),
                                          onChanged: (String? newValue) {
                                            // filtererror="Please select Sector & Size";
                                            phase_dv = newValue!;
                                            print("=====phase! id           ${phase_dv}");
                                            if(   newValue == 'All' ){
                                              PhasefilterData=false;
                                            }
                                            else{PhasefilterData=true;}

                                            setState(() {

                                            });

                                          },
                                          items: <String>[
                                            'All',
                                            '1',
                                            '2',
                                            '3',
                                            '4',
                                            '5',
                                            '6',
                                            '7',
                                            '8','9','10','11','12',
                                               ].map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(

                                              value: value,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 9),
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
                                  ),
                                  Container(
                                    width: 165.w,
                                    height: 52.h,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'Sector',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(3.0),
                                        ),
                                      ),
                                      child:DropdownButtonHideUnderline(
                                        child: DropdownButton2<String>(

                                          hint: Text("All"),
                                          searchController: SectorController,

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
                                              controller: SectorController,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding: const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 8,
                                                ),
                                                hintText: 'Search...',
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
                                          //This to clear the search value when you close the menu
                                          onMenuStateChange: (isOpen) {
                                            if (!isOpen) {
                                              SectorController.clear();
                                            }
                                          },





                                          //buttonElevation: 2,
                                          itemHeight: 40.h,
                                          itemPadding:  EdgeInsets.only(left: 14.w, right: 14.w),
                                          dropdownMaxHeight: 200.h,
                                          //dropdownWidth: 200,
                                          dropdownElevation: 8,
                                          scrollbarRadius:  Radius.circular(40.r),
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          offset: const Offset(0, 0),
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          value: sector_dv,

                                          icon: const Icon(Icons.arrow_drop_down),
                                          isExpanded: true,
                                          iconSize: 30,
                                          style: const TextStyle(color: Colors.black),
                                          onChanged: (String? newValue) {
                                            // filtererror="Please select Phase & Size";
                                            sector_dv = newValue!;
                                            if(newValue=="All"){
                                              SectorfilterData=false;
                                            }else{SectorfilterData=true;}


                                            //  SectorfilterData=true;
                                            setState(() {

                                            });

                                          },
                                          items: sector_id.map<
                                              DropdownMenuItem<String>>(
                                                  (dynamic value) {
                                            return DropdownMenuItem<String>(

                                              value: value,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 9),
                                                child: Text(
                                                  value,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      letterSpacing: 0.9,
                                                      fontWeight: FontWeight.w300),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),


                                    ),
                                  ),
                                  Container(
                                    width: 140.w,
                                    height: 52.h,
                                    child: InputDecorator(
                                      expands: true,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'Size',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(3.0),
                                        ),
                                      ),
                                      child:
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2<String>(


                                          searchController: SizeController,

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
                                              controller: SizeController,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding: const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 8,
                                                ),
                                                hintText: 'Search...',
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
                                          //This to clear the search value when you close the menu
                                          onMenuStateChange: (isOpen) {
                                            if (!isOpen) {
                                              SizeController.clear();
                                            }
                                          },





                                          //buttonElevation: 2,
                                          itemHeight: 40.h,
                                          itemPadding:  EdgeInsets.only(left: 14.w, right: 14.w),
                                          dropdownMaxHeight: 200.h,
                                          //dropdownWidth: 200,
                                          dropdownElevation: 8,
                                          scrollbarRadius:  Radius.circular(40.r),
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          offset: const Offset(0, 0),
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          value: size_dv,

                                          icon: const Icon(Icons.arrow_drop_down),
                                          isExpanded: true,
                                          iconSize: 30,
                                          style: const TextStyle(color: Colors.black),
                                          onChanged: (String? newValue) {
                                            //  filtererror="Please select Phase & Sector";
                                            size_dv = newValue!;
                                            if(newValue=="All"){ SizefilterData=false;}else{ SizefilterData=true;}

                                            setState(() {

                                            });
                                          },
                                          items: <String>[
                                            'All',
                                            '1 Marla',
                                            '2 Marla',
                                            '2.5 Marla',
                                            '3 Marla',
                                            '3.5 Marla',
                                            '4 Marla',
                                            '5 Marla',
                                            '6 Marla',
                                            '7 Marla',
                                            '8 Marla',
                                            '9 Marla',

                                            '10 Marla',
                                            '11 Marla',
                                            '12 Marla',
                                            '13 Marla',
                                            '14 Marla',
                                            '15 Marla',
                                            '16 Marla',
                                            '17 Marla',
                                            '18 Marla',
                                            '19 Marla',
                                            '20 Marla',
                                            '1 Kanal',
                                            '2 Kanal',
                                            '3 Kanal',
                                            '4 Kanal',
                                            '5 Kanal',
                                            '6 Kanal',
                                            '7 Kanal',
                                            '8 Kanal',
                                            '9 Kanal',
                                            '10 kanal',
                                            '11 Kanal',
                                            '12 Kanal',
                                            '13 Kanal',
                                            '14 Kanal',

                                            '15 kanal',
                                            '20 kanal',
                                            '500 Sqft',
                                            '1000 Sqft',
                                            '1500 Sqft',
                                            '2000 Sqft',
                                            '2500 Sqft',
                                            '3000 Sqft',
                                            '3500 Sqft',
                                            '4000 Sqft',
                                            '4500 Sqft',
                                            '5000 Sqft',
                                            '5500 Sqft',
                                            '6000 Sqft',
                                            '6500 Sqft',
                                            '7000 Sqft',
                                            '7500 Sqft',
                                            '8000 Sqft',
                                            '8500 Sqft',
                                            '9000 Sqft',
                                            '9500 Sqft',
                                            '10000 Sqft',
                                            '10500 Sqft',
                                            '11000 Sqft',
                                            '11500 Sqft',
                                            '12000 Sqft',
                                            '12500 Sqft',
                                            '13000 Sqft',
                                            '13500 Sqft',
                                            '14000 Sqft',
                                            '14500 Sqft',
                                            '15000 Sqft',
                                            '15500 Sqft',
                                            '16000 Sqft',
                                            '16500 Sqft',


                                          ].map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(

                                              value: value,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 9),
                                                child: Text(
                                                  value,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      letterSpacing: 0.9,
                                                      fontWeight: FontWeight.w300),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),







                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 20.w,),

                            Spacer(),
                            Container(color:  Color(0xffE50606),
                              child:AreafilterData||PhasefilterData||SectorfilterData||SectorfilterData? GestureDetector(onTap: (){
                                AreafilterData=false;
                                PhasefilterData=false;
                                SectorfilterData=false;
                                SizefilterData=false;
                                call=true;
                                area_dv = 'All';
                                sector_dv = 'All';
                                phase_dv = 'All';
                                size_dv = 'All';
                                setState(() {

                                });
                              },
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 4.w,horizontal: 8.h),
                                  child: Text("Clear Filter",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.sp,fontWeight: FontWeight.w800)),
                                ),
                              ):SizedBox(),
                            ),
                            SizedBox(width: 15.w,)
                          ],
                        )
                      ],
                    ),
                  ),
                  // title!: const Text('Title'),
                  floating: true,
                  pinned: true,
                  backgroundColor: Colors.grey.shade100,
                  expandedHeight: 247.0.h,
                  forceElevated: innerBoxIsScrolled,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(0.0),
                    child: AppBar(
                      automaticallyImplyLeading: false,
                      toolbarHeight: 00.0,
                      backgroundColor: Color(0xff0538ad),
                    ),
                  ),
                ),
              ];
            },
            body: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {

                if (showlist.isNotEmpty) {
                  return Scrollbar(
                    controller: _vertical,
                    thumbVisibility: true,
                    trackVisibility: true,
                    child: Scrollbar(
                      controller: _horizontal,
                      thumbVisibility: true,
                      trackVisibility: true,
                      notificationPredicate: (notif) => notif.depth == 1,
                      child: SingleChildScrollView(
                        controller: _vertical,
                        child: SingleChildScrollView(
                          controller: _horizontal,
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            border: TableBorder.all(
                                width: 0.5, color: Colors.black),
                            dataRowHeight: 30.h,
                            columnSpacing: 20.w,
                            headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xff0538ad)),
                            columns: const <DataColumn>[
                              DataColumn(
                                  label: Text('No',
                                      style: TextStyle(color: Colors.white))),
                              DataColumn(
                                  label: Text('Area',
                                      style: TextStyle(color: Colors.white))),
                              DataColumn(
                                  label: Text('Sector',
                                      style: TextStyle(color: Colors.white))),
                              DataColumn(
                                  label: Text('Phase',
                                      style: TextStyle(color: Colors.white))),
                              DataColumn(
                                  label: Text('Status',
                                      style: TextStyle(color: Colors.white))),
                              DataColumn(
                                  label: Text('SN/HN',
                                      style: TextStyle(color: Colors.white))),
                              DataColumn(
                                  label: Text('Size',
                                      style: TextStyle(color: Colors.white))),
                              DataColumn(
                                  label: Text('Property Status',
                                      style: TextStyle(color: Colors.white))),




                              DataColumn(
                                  label: Text('Demand',
                                      style: TextStyle(color: Colors.white))),
                              DataColumn(label: Text('Add By',style: TextStyle(   color:Colors.white))),
                              DataColumn(label: Text('Dealer',style: TextStyle(   color:Colors.white))),
                            ],
                            rows: [
                              //
                              // ListView.builder(
                              // itemCount: data.length,
                              //
                              // itemBuilder: (BuildContext, index){
                              //   CompleteInventroyModel modelData = data[index];
                              //   return Text(modelData.data[index].agencyName.toString());
                              // });

                              for (int i = 0; i < showlist.length; i++)
                              // CompleteInventroyModel modelData = data[index];
                              // for (var shade in shades)

                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text(
                                            '${i+1}',
                                            style: TextStyle()))),
                                    DataCell(Center(
                                        child: Text(
                                            showlist[i]
                                                .area!
                                                .name!
                                                .toString(),
                                            style: TextStyle()))),
                                    DataCell(Center(
                                        child: Text(
                                            showlist[i]
                                                .sector!
                                                .toString(),
                                            style: TextStyle()))),
                                    DataCell(Center(
                                        child: Text(
                                            showlist[i]
                                                .areaPhaseId
                                                .toString(),
                                            style: TextStyle()))),
                                    DataCell(Center(
                                        child: Text(
                                            showlist[i]
                                                .purchaseStatus
                                                .toString(),
                                            style: TextStyle()))),
                                    DataCell(Center(
                                        child: Text(
                                            showlist[i]
                                                .plotNumber
                                                .toString(),
                                            style: TextStyle()))),
                                    DataCell(Center(
                                        child: Text(
                                            "${showlist[i].size.toString()} ${showlist[i].sizeUnit.toString()}",
                                            style: TextStyle()))),
                                    DataCell(Center(
                                        child: Text(
                                            showlist[i]
                                                .property
                                                .toString(),
                                            style: TextStyle()))),
                                    DataCell(Center(
                                        child: Text(
                                            showlist[i]
                                                .price
                                                .toString(),
                                            style: TextStyle()))),
                                    DataCell( Center(child: Text(showlist[i].user!.name!.toString(),style: TextStyle(   )))),
                                    DataCell( Center(child: Text(showlist[i].itemCondition!.replaceAll('_', ' ').toString(),style: TextStyle(   )))),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Container(
                      height: 300.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline, color: Colors.red),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            "Not Found",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          );

//             DataTable(
//             border:
//             TableBorder.all(width: 0.5, color: Colors.black),
//             dataRowHeight: 30.h,
//             columnSpacing: 20.w,
//             headingRowColor: MaterialStateColor.resolveWith(
//                     (states) => Color(0xff0538ad)),
//             columns: const <DataColumn>[
//               DataColumn(
//                   label: Text('Area',
//                       style: TextStyle(color: Colors.white))),
//               DataColumn(
//                   label: Text('Sector',
//                       style: TextStyle(color: Colors.white))),
//               DataColumn(
//                   label: Text('Phase',
//                       style: TextStyle(color: Colors.white))),
//               DataColumn(
//                   label: Text('Status',
//                       style: TextStyle(color: Colors.white))),
//               DataColumn(
//                   label: Text('SN/HN',
//                       style: TextStyle(color: Colors.white))),
//               DataColumn(
//                   label: Text('Size',
//                       style: TextStyle(color: Colors.white))),
//               DataColumn(
//                   label: Text('Demand',
//                       style: TextStyle(color: Colors.white))),
//             ],
//             rows: [
//               for (int i = 0; i < data.length; i++)
// // for (var shade in shades)
//                 DataRow(
//                   cells: [
//                     DataCell(Center(
//                         child: Text(modelData.name!.toString()))),
//                     DataCell(Center(
//                         child: Text(
//                             modelData.agencyName.toString()))),
//                     DataCell(Center(
//                         child: Text(modelData.id.toString()))),
//                     DataCell(Center(
//                         child: Text(
//                             modelData.agencyName.toString()))),
//                     DataCell(Center(
//                         child: Text(
//                             modelData.agencyName.toString()))),
//                     DataCell(Center(
//                         child: Text(
//                             modelData.agencyName.toString()))),
//                     DataCell(Center(
//                         child: Text(
//                             modelData.agencyName.toString()))),
//                   ],
//                 ),
//             ],
//           );
        },
        onWaiting: (context) {
          return  Center(
            //   child: CircularProgressIndicator(
            //   color: Colors.white,
            // ),
            child: GlowingProgressIndicator(
                child: SvgPicture.asset('assets/images/logo2.svg',height: 100.h,width: 100.w,color: Colors.red,)
            ),
          );
        },
        onError: (context, error) {
          return Center(
            child: Container(
              width: 255.w,
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "Check your internet connection",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ///
// onWaiting: (context) {
// return const Center(
// child: CircularProgressIndicator(),
// );
// },
// onError: (context, error) {
// return const Center(
// child: Text("Check your internet connection"),
// );
// },
//
// /