

//import 'package:backendapi/CategoryManager.dart';
import 'package:flutter/material.dart';

import 'Universal.dart';

class Provider extends InheritedWidget {
   final Universal data;
///
  Provider({Key? key,Widget? child,required this.data}) : super(key: key, child:child!);

  static Universal of(BuildContext context) {

    return (context.dependOnInheritedWidgetOfExactType<Provider>())!.data;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}