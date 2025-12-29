import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/button_single_atom.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
import 'package:flutter/material.dart';

class MobileWidget extends StatelessWidget {
  const MobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(mainAxisSize: MainAxisSize.min,spacing: 8,children: [
        SmallText(text: "Enter you mobile number",fontWeight: FontWeight.w600,size: 18,),
        SmallText(text: "Add your mobile number for verification",color: Colors.black54,),
        SizedBox(height: 24,),
        Row(children: [
          Expanded(child: TextFieldCommon(fillColor: Colors.white,prefixIcon: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(spacing: 8,crossAxisAlignment: WrapCrossAlignment.center,
                children: [

                  SmallText(text: "+91"),
                  ContainerDecorated(height: 28,width: 2,color: Colors.grey.shade300,)
                ],
              ),
            ],
          ),hintText: "Enter number",suffixIcon: Icon(Icons.cancel,size: 20,color: AppColors.primary.withOpacity(0.6),),))
        ],),
        SizedBox(height: 16,),
        ButtonSingleAtom(widget: "Submit",),
        SizedBox(height: 16,),
        SizedBox(height: 16,),
      ],),
    );
  }
}
