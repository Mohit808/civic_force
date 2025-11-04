import 'package:flutter/material.dart';

import '../../common_widget/text_common.dart';

class SomethingWentWrongWidget extends StatelessWidget {
  const SomethingWentWrongWidget({super.key, this.center,this.msg, this.color});
  final dynamic center;
  final String? msg;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return  center==null? HeadingText(text: msg??"Something went wrong",color: color,):  Center(child: HeadingText(text: msg??"Something went wrong",textAlign: TextAlign.center,color: color,),);
  }
}

