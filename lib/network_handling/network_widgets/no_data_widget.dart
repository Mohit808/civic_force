import 'dart:math';

import 'package:civic_force/utils/app_images.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../common_widget/text_common.dart';


class NoDataWidget extends StatelessWidget {
  NoDataWidget({super.key, this.center, this.msg, this.height,this.optionalMsg});
  final dynamic center;
  final dynamic msg;
  final dynamic optionalMsg;
  final double? height;

  final List emptyList=[
    "Hello? Echo… echo… 👋",
    "Everyone vanished like magic! ✨",
    "Too silent… did everyone go on vacation? 🌴",
    "Looks like the online party hasn’t started yet 🎉",
    "All users are offline… maybe fixing their hair? 😆",
    "Hmm… empty lobby. Ghost town vibes 👻",
    "Did someone turn off the internet or what? 😅",
    "Everyone dipped faster than a magic trick 🪄",
    "Empty room! Perfect time to practice your dance moves 💃🕺",
    "Even the ghosts went offline 🫥"
  ];

  @override
  Widget build(BuildContext context) {
    return center==null? Column(
      children: [
        // Lottie.asset(AppImages.noData,height: height),
        // HeadingText(text: msg??"No Data Found"),
        // if(optionalMsg!=null) SmallText(text: optionalMsg,fontWeight: FontWeight.w600,color: Colors.black54,),


        Padding(
          padding: const EdgeInsets.only(top: 90.0),
          child: Align(alignment: AlignmentGeometry.center,child: Column(
            children: [

              Container(constraints: BoxConstraints(maxWidth: 150),
                child: DotLottieLoader.fromAsset(AppImages.searching, frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                  if (dotlottie != null) {
                    return Lottie.memory(dotlottie.animations.values.single);
                  } else {
                    return Container();
                  }
                }),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SmallText(text: "${emptyList[int.parse(generateRandomInt(1))]}",fontWeight: FontWeight.w600,),
              ),
            ],
          )),
        )

      ],
    ): Center(child: Column(
      children: [
        Lottie.asset(AppImages.noData,height: height),
        HeadingText(text: msg??"No Data Found"),
        if(optionalMsg!=null) SmallText(text: optionalMsg,fontWeight: FontWeight.w600,color: Colors.black54,),

      ],
    ),);
  }
}

String generateRandomString(int length) {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
}

String generateRandomInt(int length) {
  const chars = '0123456789';
  final random = Random();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
}
