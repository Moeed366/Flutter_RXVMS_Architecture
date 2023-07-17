


import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Screens/GET/completeInventoryManager.dart';


class Universal extends GetxController {
  ///====================================================================Networking==================(open)
  static String baseURL = "https://capitalcity.etradeverse.com/api/";
  static bool isOngoingSuccess = false;
  static bool loading=true;
  static String errorMessage = "";
  static String login_status = "";
  static String register_status = "";
  static bool is_user_valid = false;
  static bool is_user_Registered = false;
  ///====================================================================Networking==================(closed)
  /// Obx(() => Text('Counter value: ${Universal.testvariable}')),     >>to show string
  /// Universal.dropdownValue.value=newValue! ;   >>update string
  /// ===============================================================================================
  Map<dynamic, dynamic> repository = {};
  static DateTime currenttime = DateTime.now();
  static String usertoken = "";
  static String userimage = "";
  static String userid = "";
  static RxString dropdownValue = "Dog".obs;
  static RxInt  testvariable=0.obs ;




///=================================register All Managers of UI========================================
  Universal() {

   //  register(CompleteInventoryManager, CompleteInventoryManager());
    // register(LogOutManager, LogOutManager());
    // register(LoginFormManager, LoginFormManager());
    // register(CompleteInventoryManager, CompleteInventoryManager());
    // register(GetInventoryManager, GetInventoryManager());
    // register(AffilatedDealerManager, AffilatedDealerManager());
    // register(ProfileManager, ProfileManager());
    // register(MyInventoryManager, MyInventoryManager());
    // register(AreaManager, AreaManager());
    // register(DealerProfileManager, DealerProfileManager());
    // register(AgencyManager, AgencyManager());
    //  register(SectorManager, SectorManager());
    // register(ProfileManager, ProfileManager());


     // register managers
  }

  static printWrapped(String text) {
    final pattern = RegExp('.{1,800000}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  // register the manager to this Universal to store in repository
  register(name, object) {
    repository[name] = object;
  }

  // get the required manager from Universal when needed
  fetch(name) {
    return repository[name];
  }

  static Localstorage() async {
    print("-------------Universal  SharedPreferences function---------");
    final prefs = await SharedPreferences.getInstance();
    usertoken = prefs.getString("usertoken")!;
   // username = prefs.getString("username")!;
    userimage = prefs.getString("userimage")!;
    userid = prefs.getString("userid")!;

  }



}
