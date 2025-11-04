import 'package:flutter/material.dart';

import '../../common_widget/app_colors.dart';


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.center,this.color});
  final dynamic center;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return center==null?  CircularProgressIndicator(color: color??AppColors.primary,):  Center(child: CircularProgressIndicator(color: color??AppColors.primary,),);
  }
}
