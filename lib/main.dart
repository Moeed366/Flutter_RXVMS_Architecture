

import 'dart:io';


import 'package:flutter/material.dart';

import 'package:flutter_architecture_rxvms/DataLink/Streaming/Provider.dart' as pro;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'DataLink/Streaming/Universal.dart';
import 'Screens/test.dart';
import 'Utils/app_theme.dart';


Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  MyController myController = MyController();

  // Bind your controller to GetX
  Get.put<MyController>(myController);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return  pro.Provider(
          data: Universal(),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
          //  theme: Provider.of<ThemeModel>(context).themeData,                 //when need themeing
            theme: ThemeData(
              primarySwatch: Colors.red,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),

            ),
            home:  MyWidget(),
          ),
        );
      },
    );
  }
}
//SharedPreferences prefs = await SharedPreferences.getInstance();

//bool CheckValue = prefs.containsKey('value');


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
class ThemeModel extends ChangeNotifier {
  bool isDarkMode = false;

  bool get isDarkMode1 => isDarkMode;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  ThemeData get themeData =>
      isDarkMode ? AppTheme.light() : AppTheme.dark();


 /// Provider.of<ThemeModel>(context, listen: false).toggleTheme();            >>use this to update theme

}







/*
import 'package:flutter/material.dart';
import 'package:flutter_architecture_rxvms/DataLink/Streaming/Universal.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final myController = Get.put(MyController());
  final myController1 = Get.put(Universal());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            Obx(() => Text('universal value: ${myController.counter.value}')),
            Obx(() => Text('Counter value: ${Universal.testvariable}')),
            OutlinedButton(
              child: Text('Increment'),
              onPressed: () {
                Universal.testvariable+1;
                print(                Universal.testvariable
                );
                myController.incrementCounter();
              },
            ),

            zzz(),
            Obx(() => Text('universal value: ${Universal.dropdownValue.toString()}')),
    Obx(() =>
    DropdownButton<String>(
    // Step 3.
    value: Universal.dropdownValue.toString(),
    // Step 4.
    items: <String>['Dog', 'Cat', 'Tiger', 'Lion']
        .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(
    value,
    style: TextStyle(fontSize: 30),
    ),
    );
    }).toList(),
    // Step 5.
    onChanged: (String? newValue) {
      Universal.dropdownValue.value=newValue! ;
    },
    ), )



          ],
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  var counter = 0.obs;

  void incrementCounter() {
    counter.value++;
  }
}

class zzz extends StatelessWidget {
  const zzz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Obx(() => Text('Counter value: ${Universal.testvariable}'));
  }
}
*/
