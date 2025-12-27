import 'dart:async';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class ControllerWebView extends GetxController{
  dynamic url;
  late InAppWebViewController inAppWebViewController;
  bool showAnime=true;


  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  startTimer() async {
    await Future.delayed(Duration(seconds: 3));
    showAnime=false;
    update();
  }
}