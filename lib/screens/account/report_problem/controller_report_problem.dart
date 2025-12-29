import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerReportProblem extends GetxController{

  TextEditingController textEditingController=TextEditingController();
  int? selectedIndex;
  GlobalKey globalKey=GlobalKey();
  List list=[
    {"icon":Icons.credit_card_rounded,"title":"Payment issue","subtitle":"Failed transaction, refund, billing"},
    {"icon":Icons.account_circle_rounded,"title":"Account Problems","subtitle":"Login, Signup, Forgot password, profile"},
    {"icon":Icons.post_add,"title":"Post issues","subtitle":"Post and maps issues"},
    {"icon":Icons.settings,"title":"Technical Issues","subtitle":"App crashes, bugs or any errors"},
    {"icon":Icons.verified_user_outlined,"title":"Security Concern","subtitle":"Suspicious activity, fraud or scam"},
    {"icon":Icons.live_help_outlined,"title":"Other Issue","subtitle":"Something else you want to know"},

  ];

  @override
  void onInit() {
    super.onInit();
  }
}