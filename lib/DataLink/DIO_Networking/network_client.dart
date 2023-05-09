import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../Streaming/Universal.dart';
import '../Streaming/appColors.dart';
import 'exception.dart';

class NetworkClient {
  Dio _dio = Dio();
  String baseUrl = 'https://admin.asasaestate.com.pk/';

  NetworkClient() {
    BaseOptions baseOptions = BaseOptions(
      receiveTimeout: Duration(milliseconds: 20000),
      connectTimeout: Duration(milliseconds: 15000),
      baseUrl: baseUrl,
      maxRedirects: 2,
    );
    _dio = Dio(baseOptions);
    // adding logging interceptor.
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  // for HTTP.GET Request.
  Future<Response> get(String url, Map<String, Object> params) async {
    Response response;
    final prefs = await SharedPreferences.getInstance();
    String? userToken;
    if (prefs.getString("userToken") != null) {
      userToken = prefs.getString("userToken");
    }
    print("============token  ${userToken}===========================");
    try {
      print("============token  ${userToken}===========================");
      response = await _dio.get(url,
          queryParameters: params,
          options: Options(responseType: ResponseType.json, headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer ${userToken}"
          }));
      print("===========================Requesting for get data==========================" + response.toString());
      Universal.printWrapped("this is our  : "+response.toString());
    } on DioError catch (exception) {
      String content = exception.response.toString();
      print("============${content}==========Network client exception ==" + exception.message.toString());

      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.POST Request.
  Future<Response> post(String url, Map<String, Object> params) async {
    Response response;
    final prefs = await SharedPreferences.getInstance();
    String? userToken;
    if (prefs.getString("userToken") != null) {
      userToken = prefs.getString("userToken");
    }
    try {
      response = await _dio.post(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $userToken"
          }));
      print("===========================Requesting for post data==========================" + response.toString());
    }on DioError catch (exception) {
      String content = exception.response.toString();
      print("============${content}==========Network client exception ==" + exception.message.toString());
      print('login method api sevice3 ${DateTime.now().second}');
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.POST Request.
  Future<Response> addNewPost(String url, var params) async {
    SharedPreferences sharedP = await SharedPreferences.getInstance();
    String? userToken = sharedP.getString('userLogin');
    Response response;
    try {
      response = await _dio.post(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: {
            "Accept": "application/json",
            // "Content-Type": "application/json",
            "Content-Type": "multipart/form-data",
            "Authorization": "Bearer $userToken"
          }));
    } on DioError catch (exception) {
      String content = exception.response.toString();
      print("============${content}==========Network client exception ==" + exception.message.toString());
      print('login method api sevice3 ${DateTime.now().second}');
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.POST Request.
  Future<Response> forGotPassword(
      String url, Map<String, Object> params) async {
    Response response;

    try {
      response = await _dio.post(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          }));
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.PATCH Request.
  Future<Response> patch(String url, Map<String, Object> params) async {
    Response response;
    try {
      response = await _dio.patch(url,
          data: params,
          options: Options(
            responseType: ResponseType.json,
          ));
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for dwonload Request.
  Future<Response> download(String url, String pathName,
      void Function(int, int)? onReceiveProgress) async {
    Response response;
    try {
      response = await _dio.download(
        url,
        pathName,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }
}
