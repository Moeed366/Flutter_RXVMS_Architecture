import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture_rxvms/Utils/app_theme.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:provider/provider.dart';


import '../main.dart';





///===============================================================================
///
///
///
///



class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MyController>(
        builder: (controller) {
          return Column(
            children: [
              Text(controller.myValue.toString()),
              ElevatedButton(
                onPressed: () {
                  controller.increment();
                  // Update the widget
                  Get.find<MyController>().update();
                },
                child: Text('Increment'),
              ),


              MyWidget1()
            ],
          );
        },
      ),
    );
  }
}

class MyController extends GetxController {
  var myValue = 1.obs;

  void increment() {
    myValue++;
  }
}



class MyWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      builder: (controller) {
        return Text(controller.myValue.toString());
      },
    );
  }
}





class TestingScreen extends StatelessWidget {
  const TestingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        centerTitle: true,

      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 100,left: 20,right: 20),
        child: Column(
          children: [
            Text("Testing App",style: TextStyle(color: Colors.black,fontSize: 16
                ,fontWeight: FontWeight.w600),),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                 Provider.of<ThemeModel>(context, listen: false).toggleTheme();

              },
              child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text("Button",style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                color:Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(backgroundColor:Colors.brown,radius: 15,child: const Icon(Icons.add,color: Colors.white,),),
                  SizedBox(height: 10),
                  Text("Add Story",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 10),)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}





class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Center(
        child: Consumer<ThemeModel>(
          builder: (context, theme, child) => Column(
            children: [
              Text(
                  'Hello, world!',
                  style: subtitle1(context).copyWith(fontSize: 30)
              ),
              Text(
                  'Hello, world!',
                  style: headline1(context)
              ),
              Text(
                  'Hello, world!',
                  style: headline2(context)
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ThemeModel>(context, listen: false).toggleTheme();
        },
        child: Icon(Icons.toggle_on),
      ),
    );
  }
}









