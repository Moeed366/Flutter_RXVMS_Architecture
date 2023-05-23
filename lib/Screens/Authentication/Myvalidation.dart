import 'dart:async';

mixin Myvalidation {
  static bool isEmail(String email) => email.contains('@');

  static bool isPasswordValidLength(String password) => password.length >= 8;
  static bool data(String password) => password.length >= 1;
  static bool r(String ro) => ro.length !=0;
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      print("getting text $value 1");
      sink.add(value);
    } else {
      print("getting error text $value 2");
      sink.add("");
      sink.addError("field error");
    }
  });

  final passwordLength =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
        RegExp specialCharRegex = RegExp(r'[!@#\$&*~-]');
        RegExp capitalLetterRegex = RegExp(r'[A-Z]');

        bool hasSpecialChar = specialCharRegex.hasMatch(value);
        bool hasCapitalLetter = capitalLetterRegex.hasMatch(value);
        //&&hasSpecialChar&&hasCapitalLetter
    if (isPasswordValidLength(value)) {
      sink.add(value);
    } else {
      print("password error text > $value");
      sink.add("");
      sink.addError("Password include 8 character  with one Special & one A-Z ");
    }
  });
  final otherdata =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (data(value)) {
      sink.add(value);
    } else {
      print("institute id error text > $value");
      sink.add("");
      sink.addError("institute id must be of 2 characters");
    }
  });
  final role =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value!=''||value.isNotEmpty) {
      sink.add(value);
    } else {
      print("user role error text > $value");
      sink.add("");
      sink.addError("enter user role");
    }
  });

}
