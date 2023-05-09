


import '../../Screens/GET/completeInventoryManager.dart';


class Universal {
  ///====================================================================Networking==================
  static String baseURL = "https://capitalcity.etradeverse.com/api/";
  static bool isOngoingSuccess = false;
  static bool loading=true;
  ///====================================================================Networking==================
  Map<dynamic, dynamic> repository = {};
  static Map<String, String> monthlyPlan = {
    "": "",
    "": "",
  };
  static Map<String, String> freePlan = {
    "": "",
    "": "",
  };
  static Map<String, String> yearlyPlan = {
    "": "",
    "": "",
  };
  static Map<String, String> quartlyPlan = {"": "", "": ""};
  static Map<String, String> categoryCoursesName = {};
  static Map<String, String> categoryCoursesimage = {};
  static Map<String, int> fitnessGoalMap = {};

  static List<int> allCategoryCoursesList = [];

  ///
  static DateTime date_of_birth = DateTime.now();
  static String date_of_birth_string = "";
 
  static int age = 0;
  static String csrf_token_Universal = "";
  static String errorMessage = "";
  static String user_image_path = "";
  static String home_text = "";
  static String home_text_2nd = "";
  static String course_image_path = "";
  static String login_status = "";
  static String register_status = "";
  static String videoURL = "";
  static String MainvideoURL = "";

  static String videoCaption = "";
  static String barcode = "";

  static String fitnesgoal_name = "";
  static String gender = "";
  static String heightin = "";
  static String weighttin = "";
  static String createUserActivityMessage = "";
  static String signInActivityMessage = "";
  static String scheduleQuery = "";
  static int weight = 0;
  static int height = 0;
  static String? userId;
  static int onGoingCoursesLength = 0;
  static int fitnesgoal_id = 0;
  static String freeTrialMessage = "";
  static bool freeTrialEnable = false;
  static bool is_user_valid = false;
  static bool is_user_Registered = false;
  static bool is_Profile_updated = false;
  static bool isColor = false;
 
  static String userName = "";
  static String Sector = "";
  // cart values

  Universal() {
    //login(CourseManager, CourseManager());
     register(CompleteInventoryManager, CompleteInventoryManager());
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
}
