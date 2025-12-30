import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../utils/app_images.dart';
import 'container_decorated.dart';

class ImageCommon extends StatelessWidget {
  const ImageCommon(this.src,{super.key, this.height, this.width, this.borderRadius, this.size, this.sizeAndCircle, this.color, this.boxFit,});
  final dynamic src;
  final double? size;
  final double? sizeAndCircle;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? color;
  final BoxFit? boxFit;


  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadiusGeometry.circular(sizeAndCircle??borderRadius??0),child:
    "$src".startsWith("http") || "$src".startsWith("http") ?
    // Image.network("$src",errorBuilder: (a,b,c){return Image.asset(AppImages.user,errorBuilder: (a,b,c)=>SizedBox(),);},):
    CachedNetworkImage(
      imageUrl: "$src",
      width: sizeAndCircle??size??width,
      height: sizeAndCircle??size??height,
      fit: boxFit??BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: boxFit??BoxFit.cover,
            // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
          ),
        ),
      ),
      placeholder: (context, url) => Shimmer(child: ContainerDecorated(color: Color(0xFF151515),)),
      errorWidget: (context, url, error) => Image.asset(AppImages.user,height: sizeAndCircle??size??height,width:sizeAndCircle??size?? width,),
      // errorWidget: (context, url, error) => Icon(Icons.error),
    ):

    "$src".startsWith("assets")?Image.asset("$src",height: sizeAndCircle??size?? height,width:  sizeAndCircle??size??width,fit: boxFit??BoxFit.cover,color: color,errorBuilder: (a,b,c){return Image.asset(AppImages.user,height: sizeAndCircle??size?? height,width: sizeAndCircle??size?? width,errorBuilder: (a,b,c)=>SizedBox(),);},):
    Image.file(File("$src"),height: sizeAndCircle??size?? height,width: sizeAndCircle??size?? width,fit: boxFit??BoxFit.cover,errorBuilder: (a,b,c){return Image.asset(AppImages.user,height: sizeAndCircle??size??height,width: sizeAndCircle??size??width,errorBuilder: (a,b,c)=>SizedBox(),);},),)
    ;
  }
}
