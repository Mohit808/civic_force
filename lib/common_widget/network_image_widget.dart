import 'dart:io';

import 'package:civic_force/utils/app_images.dart';
import 'package:flutter/material.dart';

class ImageCommon extends StatelessWidget {
  const ImageCommon({super.key, required this.src, this.color, this.borderRadius, this.height, this.width, this.fit,this.isFile});
  final String src;
  final Color? color;
  final double? borderRadius;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final bool? isFile;

  @override
  Widget build(BuildContext context) {
    return
      ClipRRect(borderRadius: BorderRadius.circular(borderRadius??0),child:
      isFile!=null?
      Image.file(File(src),height: height,width: width,color:color,fit: fit,errorBuilder: (a,b,c){
        return Image.asset(AppImages.imageError,height: height,width: width,errorBuilder: (a,b,c){return SizedBox();},);
      },):

      src.startsWith("http") ?
      Image.network(src,height: height,width: width,color:color,fit: fit,errorBuilder: (a,b,c){
        return Image.asset(AppImages.imageError,height: height,width: width,errorBuilder: (a,b,c){return SizedBox();},);
      },):

      src.contains("assets")?
      Image.asset(src,height: height,width: width,color: color,fit: fit,errorBuilder: (a,b,c){
        return Image.asset(AppImages.imageError,color: color,height: height,width: width,errorBuilder: (a,b,c){return SizedBox();},);
      },)
          :
      Image.file(File(src),height: height,width: width,color:color,fit: fit,errorBuilder: (a,b,c){
        return Image.asset(AppImages.imageError,height: height,width: width,errorBuilder: (a,b,c){return SizedBox();},);
      },)
        ,);
  }
}