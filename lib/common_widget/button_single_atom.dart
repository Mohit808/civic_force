import 'package:flutter/material.dart';

import '../network_handling/api_response.dart';
import 'app_colors.dart';
import 'app_sizes.dart';
import 'border_atom.dart';
import 'text_common.dart';


class ButtonSingleAtom extends StatelessWidget{
  const ButtonSingleAtom({super.key, this.widget, this.tap, this.color, this.colorText, this.colorBorder, this.borderRadius, this.status, this.size,});
  final dynamic widget;
  final Function()? tap;
  final Color? color;
  final Color? colorText;
  final Color? colorBorder;
  final double? borderRadius;
  final Status? status;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      tap!=null?tap!():null;
    },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(AppSizes.h_12),
        decoration: BoxDecoration(gradient: GradientAtom.gradient,color: color??AppColors.primary,borderRadius: borderRadius!=null?BorderRadius.circular(borderRadius??10):BorderAtom.borderRadius,border: color!=null?Border.all(color: colorBorder??color!):BorderAtom.border),
        child:
        status==Status.LOADING?
        SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)):

        widget.runtimeType==String?NormalHeadingText(text: widget,color: colorText??Colors.white,size: size,): widget,
      ),
    );
  }
}