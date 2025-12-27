import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoChatWidget extends StatelessWidget {
  const VideoChatWidget({super.key, this.url, this.disable});
  final dynamic url;
  final bool? disable;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: disable==true?null:(){

    },
      child: Stack(
        children: [
          ImageCommon( "$url".split(",").first,height: Get.width-150,width: Get.width-150,borderRadius: 20,),
          Positioned(top: 0,bottom: 0,left: 0,right: 0,child: Icon(Icons.play_circle_outline_rounded,color: Colors.white,size: 50,))
        ],
      ),
    );
  }
}
