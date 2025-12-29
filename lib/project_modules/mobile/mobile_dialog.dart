
import 'package:civic_force/common_widget/button_single_atom.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'mobile_widget.dart';

class MobileDialog extends StatelessWidget {
  const MobileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,spacing: 16,children: [

        SizedBox(height: 300,child: SvgPicture.asset(AppImages.mobile)),

      SmallText(text: "Add phone number",fontWeight: FontWeight.w600,size: 16,),
        SmallText(text: "Discover people by your contacts. we designed to empower your customization experience",color: Colors.black54,),
        SizedBox(height: 4,),
        Row(children: [
          Expanded(child: ButtonSingleAtom(tap: (){
            Get.back();
          },widget: "Cancel",color: Colors.grey.shade200,colorText: Colors.grey,)),
          Expanded(child: ButtonSingleAtom(tap: (){
            Get.back();
            showModalBottomSheet(showDragHandle: true,context: context, builder: (builder){
              return MobileWidget();
            });
          },widget: "Add",)),
        ],)
      ],),
    );
  }
}
