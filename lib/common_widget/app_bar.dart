import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_common.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget{

  final dynamic title;
  final List<Widget> actions;
  final double? height;
  final double? elevation;
  final double? titleSpacing;
  final Widget? leading;
  final Color? titleColor;
  final Color? color;
  final Color? colorIconTheme;
  final bool? centerTitle;
  final double? leadingWidth;

  const AppBarCommon({super.key, required this.title, this.actions = const [], this.height, this.elevation, this.leading, this.titleColor, this.color, this.colorIconTheme, this.centerTitle, this.titleSpacing, this.leadingWidth});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth,
      titleSpacing: titleSpacing,
      elevation: elevation??0,
      backgroundColor: color??AppColors.primary,
      leading:leading,
      iconTheme: IconThemeData(color: colorIconTheme??Colors.white),
      title: title.runtimeType!=String?title:NormalHeadingText(text: title,color: titleColor??Colors.white,size: 14,),
      actions: actions,
      centerTitle: centerTitle??true,
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(height??kToolbarHeight);
}