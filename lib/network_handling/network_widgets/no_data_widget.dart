import 'package:civic_force/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../common_widget/text_common.dart';


class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, this.center, this.msg, this.height,this.optionalMsg});
  final dynamic center;
  final dynamic msg;
  final dynamic optionalMsg;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return center==null? Column(
      children: [
        Lottie.asset(AppImages.noData,height: height),
        HeadingText(text: msg??"No Data Found"),
        if(optionalMsg!=null) SmallText(text: optionalMsg,fontWeight: FontWeight.w600,color: Colors.black54,),
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
