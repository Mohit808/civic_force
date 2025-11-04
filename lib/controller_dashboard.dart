import 'package:civic_force/screens/account/account_screen.dart';
import 'package:civic_force/screens/analysis_screen/analysis_screen.dart';
import 'package:civic_force/screens/home/home_screen.dart';
import 'package:civic_force/screens/map/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControllerDashboard extends GetxController{

  int currentIndex =0;


  List list=[
    HomeScreen(),
    MapScreen(),
    // SizedBox(),
    AnalysisScreen(),
    AccountScreen()
  ];

  @override
  void onInit() {
    super.onInit();
  }

}