
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import 'common_widget/app_colors.dart';
import 'common_widget/app_sizes.dart';
import 'common_widget/border_atom.dart';
import 'model/user_model.dart';


String token="";
UserInfo? userInfo;
late GetStorage box;
late SharedPreferences sharedPreferences;

isMobile(){
  return Get.width<1200;
}



showToast(msg) {
  // Fluttertoast.showToast(
  //     msg: "$msg",
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     timeInSecForIosWeb: 1,
  //     textColor: Colors.white,
  //     fontSize: 12.0
  // );
  // Get.snackbar(
  //   '',
  //   "$msg",
  //   snackPosition: SnackPosition.TOP,
  //   backgroundColor: Colors.green.withOpacity(0.9),
  //   colorText: Colors.white,
  //   margin: const EdgeInsets.all(12),
  //   borderRadius: 8,
  //   duration: const Duration(seconds: 2),
  // );
}

showToastSuccess(String? msg) {
  // Fluttertoast.showToast(
  //     msg: "$msg",
  //     toastLength: Toast.LENGTH_SHORT,
  //     backgroundColor: Colors.green,
  //     textColor: Colors.white,
  //     fontSize: 12.0
  // );
  // Get.snackbar(
  //   'Success',
  //   "$msg",
  //   snackPosition: SnackPosition.TOP,
  //   backgroundColor: Colors.green.withOpacity(0.9),
  //   colorText: Colors.white,
  //   margin: const EdgeInsets.all(12),
  //   borderRadius: 8,
  //   duration: const Duration(seconds: 2),
  // );
}


showToastError(msg) {
  // Fluttertoast.cancel();
  // Fluttertoast.showToast(msg: "$msg", toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 12.0);
}

hideKeyboard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  FocusManager.instance.primaryFocus?.unfocus();
}


class Utils {
  init({colorCode, double? radius, LinearGradient? gradient}) {
    setUpThemeColor(colorCode ?? 0xFF345259); //0xFF345259
    BorderAtom.setRadius = BorderRadius.circular(radius ?? AppSizes.h_4);
    BorderAtom.setRadiusTextField = BorderRadius.circular(radius ?? AppSizes.h_4);
    BorderAtom.borderRadiusValue = radius ?? AppSizes.h_4;
    GradientAtom.gradient = gradient;
    initialize();
  }

  setUpThemeColor(code) {
    AppColors.materialColor = MaterialColor(code, <int, Color>{
      50: Color(code),
      100: Color(code),
      200: Color(code),
      300: Color(code),
      400: Color(code),
      500: Color(code),
      600: Color(code),
      700: Color(code),
      800: Color(code),
      900: Color(code),
    });
  }

  static String userToken = "token";
  static String user = "user";
  static String info = "info";
  static String intro = "intro";

  initialize() async {
    await GetStorage.init();
    box = GetStorage();
    sharedPreferences=await SharedPreferences.getInstance();
    var value = box.read(Utils.userToken);
    if (value != null) {
      token = value;
    }
    var user = box.read(Utils.user);
    if(user!=null){
      userInfo=UserInfo.fromJson(user);
    }
  }
}
