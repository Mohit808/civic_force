
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common_widget/app_colors.dart';
import 'common_widget/app_sizes.dart';
import 'common_widget/border_atom.dart';


String token="";

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

  initialize() async {
    // await GetStorage.init();
    // box = GetStorage();
    // var value = box.read(Utils.userToken);
    // if (value != null) {
    //   token = value;
    //   getEmailClients();
    //   // print("TOKEEEEN= $token");
    // }
  }
}
