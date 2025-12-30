import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({super.key, this.src});
  final dynamic src;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black54,
      appBar: AppBarCommon(title: "",height: 0,elevation: 0,color: AppColors.scaffoldBackgroundColor,colorIconTheme: Colors.black,),
      body: Stack(
        children: [
          Column(children: [
            Expanded(child: ImageCommon("$src".split(",").first,boxFit: BoxFit.fitWidth,)),
          ],),
          InkWell(onTap: (){
            Get.back();
          },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.arrow_back),
            ),
          )
        ],
      ),
    );
  }
}
