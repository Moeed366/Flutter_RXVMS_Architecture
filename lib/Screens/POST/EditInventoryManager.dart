//
// import 'package:asasa_estate/Screens/Auth/Myvalidation.dart';
// import 'package:flutter/material.dart';
// import 'package:rxdart/rxdart.dart';
// import 'dart:async';
//
// import '../../../AppLayer/Universal.dart';

//
// class UserManager with MyValidation {
//   final _email = BehaviorSubject<String>();
//   final _password = BehaviorSubject<String>();
//   final _auth = BehaviorSubject<String>();
//
//   Stream<String> get email$ => _email.stream.transform(validateEmail);
//
//   Sink<String> get inEmail => _email.sink;
//
//   Stream<String> get password$ => _password.stream.transform(passwordLength);
//
//   Sink<String> get inPassword => _password.sink;
//
//   Stream<bool> get isFormSubmit$ async* {
//     CombineLatestStream([email$, password$], (values) => true);
//
//     if (_email.value != null && _password.value != null) {
//       String query = "email=${_email.value}&password=${_password.value}";
//
//       yield await UserService.browse(query);
//     }
//   }
//
//   Stream<bool> get isFormValid$ =>
//       CombineLatestStream([email$, password$], (values) => true);
//
//   Stream<String> get login_status$ async* {
//     yield await Universal.login_status;
//   }
//
//   Stream<bool> get isValidCustomer$ async* {
//
//     String query = "email=${_email.value}&password=${_password.value}";
//
//
//     yield await UserService.browse(query);
//   }
//
//   Stream<bool> get isUserAuth$ async* {
//
//     String query = "email=${_email.value}&password=${_password.value}";
//
//   }
// }

