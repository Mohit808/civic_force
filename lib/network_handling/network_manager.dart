import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../auth/login/login_screen.dart';
import '../utils.dart';
import '../utils/app_urls.dart';
import 'custom_exception.dart';

class NetworkManager {
  NetworkManager();
  get(String endPoint) async {

    print(token);
    var header = {"Authorization": "token $token",};
    try {
      // var res = await http.get(Uri.parse(ApiConstants.baseUrl + endPoint), headers: header,);
      // // if (kDebugMode) print(res);
      // if (kDebugMode) print(res.statusCode);
      // return responseReturn(res);

      var request = http.Request('GET',Uri.parse(AppUrls.baseUrl + endPoint));
      print(AppUrls.baseUrl + endPoint);
      request.headers.addAll(header);
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      return responseReturn(response);
    } on ExhaustException catch (e) {
      throw ExhaustException("$e");
    }
    // on SocketException {
    //   throw FetchDataException("No internet connected");
    // }
  }

  post(String endPoint, {data, headers}) async {
    var header = {
      "Authorization": token.isEmpty?"":"token $token",
      "Content-type":"application/json"
    };
    if (headers != null) header.addAll(headers);
    if (kDebugMode) print("POST "+AppUrls.baseUrl + endPoint);
    log(token);
    if (kDebugMode) log(jsonEncode(data).toString());
    // var res = await http.post(Uri.parse(ApiConstants.baseUrl + endPoint), body: data, headers: header);
    var request = http.Request('POST',Uri.parse(AppUrls.baseUrl + endPoint));
    print('===========${request.body}');
    if(data is Map){
      request.body=jsonEncode(data);
    }else{
      if(data!=null) request.body=data;
    }
    request.headers.addAll(header);
    http.StreamedResponse response = await request.send();

    try {
      if (kDebugMode) print(response.statusCode);
      return responseReturn(response);
    } on ExhaustException catch (e) {
      throw ExhaustException("$e");
    } on SocketException {
      throw FetchDataException("No internet connected");
    }
  }

  put(String endPoint, {data, headers}) async {
    var header = {
      "Authorization": token.isEmpty?"":"token $token",
      "Content-type":"application/json"
    };
    if (headers != null) header.addAll(headers);

    print(token);

    if (kDebugMode) print(AppUrls.baseUrl + endPoint);
    if (kDebugMode) print(data);
    // if (kDebugMode) print(data);

    // var res = await http.put(Uri.parse(ApiConstants.baseUrl + endPoint), body: data, headers: header);

    try {
      // return responseReturn(res);
      var request = http.Request('PUT',Uri.parse(AppUrls.baseUrl + endPoint));
      if(data is Map){
        request.body=jsonEncode(data);
      }else{
        if(data!=null) request.body=data;
      }
      request.headers.addAll(header);
      http.StreamedResponse response = await request.send();
      return  responseReturn(response);
    } on SocketException {
      throw FetchDataException("No internet connected");
    }
  }

  delete(String endPoint, {data, headers}) async {
    var header = {"Authorization": "token $token", "Content-type": "application/json"};
    if (headers != null) header.addAll(headers);

    if (kDebugMode) print(header);
    if (kDebugMode) print(AppUrls.baseUrl + endPoint);
    if (kDebugMode) print(data);
    // var res = await http.delete(Uri.parse(ApiConstants.baseUrl + endPoint),body: data, headers: header);
    // print(res.body);
    try {
      // return responseReturn(res);
      var request = http.Request('DELETE',Uri.parse(AppUrls.baseUrl + endPoint));
      if(data is Map){
        request.body=jsonEncode(data);
      }else{
        if(data!=null) request.body=data;
      }
      request.headers.addAll(header);
      http.StreamedResponse response = await request.send();
      return  responseReturn(response);
    } on SocketException {
      throw FetchDataException("No internet connected");
    }
  }

  responseReturn(http.StreamedResponse response) async {
    var result=await response.stream.bytesToString();
    switch (response.statusCode) {
      case 200 || 201:
        return jsonDecode(result);
      case 400:
        throw BadRequestException(result);
      case 401:
      // await box.erase();
      // token="";
      // if(box.read(Utils.userToken)!=null){
      //   showToastError("Invalid Token");
      //   Get.offAll(() => const MobileScreen());
      // }
        throw UnauthorizedException(result);
      case 403:
        await box.erase();
        token="";
        try{
          sharedPreferences.clear();
          sharedPreferences.reload();
          FirebaseMessaging.instance.deleteToken();
        }catch(e){}
        // showToast("Invalid Token");
        Get.offAll(() => const LoginScreen());
        // if(box.read(Utils.userToken)!=null){
        //   // showToast("Invalid Token");
        //   // Get.offAll(() => const MobileScreen());
        // }
        // // showToastError("Something went wrong");
        throw ExhaustException(result);
      case 429:
        showToast("Subscribe for access the data");
        throw ExhaustException(result);
      case 500:
        throw FetchDataException('Server error : ${response.statusCode}');
      case 502:
        throw FetchDataException('Server error : ${response.statusCode}');
      default:
        throw FetchDataException('Server error : ${response.statusCode}');
    // throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
