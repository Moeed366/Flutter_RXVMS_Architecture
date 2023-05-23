/*
import 'dart:async';

import 'package:rxdart/rxdart.dart';


import '../../../AppLayer/Networking/apis_services.dart';

import '../Myvalidation.dart';
import 'loginService.dart';


class LoginFormManager with Myvalidation {
  late LoginFormService newPasswordFormService = LoginFormService();
  ApiService? apiService;
  LoginFormManager({this.apiService});

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
 // final _iid = BehaviorSubject<String>();
  final _role = BehaviorSubject<String>();
  // final _hasValue = BehaviorSubject<bool>();

  ///email
  Stream<String> get email$ => _email.stream.transform(validateEmail);
  Sink<String> get inEmail => _email.sink;

  ///password
  Stream<String> get password$ => _password.stream.transform(passwordLength);
  Sink<String> get inPassword => _password.sink;
  ///iid
*/
/*  Stream<String> get iid$ => _iid.stream.transform(otherdata);
  Sink<String> get iniid => _iid.sink;*//*

  ///role
  Stream<String> get role$ => _role.stream.transform(role);
  Sink<String> get inrole => _role.sink;
  // ///Has value
  // Stream<bool> get hasValue$ => _hasValue.stream.transform(hasValue);
  // StreamSink<bool> get inHasValue => _hasValue.sink;

  ///Object
  Stream<bool> get isLoginFormValid$ =>
      CombineLatestStream([email$, password$], (values) => true);

  ///is Login Form Submit
  Stream<bool> get isLoginFormSubmit$ async* {
    print("-------------${_email.value}-------${_role.value}-------------${_password.value}------------------------");
    String message = 'success';

    yield await newPasswordFormService.loginSubmitForm(
        _email.value, _password.value,_role.value);
  }
}
*/
