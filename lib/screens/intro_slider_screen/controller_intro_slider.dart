import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_images.dart';

class ControllerIntroSlider extends GetxController{
  int indexSelected=0;
  PageController pageController=PageController();
  List list=[
    {
      // "image": AppImages.anim1,
      "image": Icon(Icons.health_and_safety,color: Colors.white,size: 180,),
      "heading": "Welcome to Red Strap – Celebrate Who You Are",
      "description": "Join a vibrant and inclusive community where you can meet new people, make friends, and discover meaningful connections. Your journey starts here!"
    },
    {
      "image":Icon(Icons.flood,color: Colors.white,size: 180,),
      "heading": "Discover New Faces, Share Stories, and Make Genuine Connections",
      "description": "Explore people around you, chat freely, and find friendships or deeper connections. Red_Stap is your safe space to be yourself."
    },
    {
      "image": Icon(Icons.biotech,color: Colors.white,size: 180,),
      "heading": "Love Is Blind – Real Connection Begins Where Appearances End",
      "description": "We believe that true relationships grow from honesty, emotion, and conversation. Love is blind, but the connection you build here will feel truly seen."
    }
  ];
  @override
  void onInit() {
    super.onInit();
  }

}