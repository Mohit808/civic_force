import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_images.dart';

class ControllerIntroSlider extends GetxController{
  int indexSelected=0;
  PageController pageController=PageController();
  List list=[
    {
      "image": Icon(Icons.location_city, size: 280),
      "heading": "Welcome to Social Fabric – Your City, Your Voice",
      "description": "Stay connected to what’s happening around you. From local updates to real-time reports, Social Fabric brings your city’s stories to life."
    },
    {
      "image": Icon(Icons.campaign,  size: 280),
      "heading": "Report, Share, and Discuss What Matters Locally",
      "description": "Traffic, safety, events, power cuts, or celebrations — report issues, share updates, and join conversations that impact your neighborhood."
    },
    {
      "image": Icon(Icons.groups, size: 280),
      "heading": "Built by the City, For the City",
      "description": "Every post strengthens the social fabric of your community. Discover trending topics in your area and be part of a more informed, connected city."
    }

  ];
  @override
  void onInit() {
    super.onInit();
  }

}